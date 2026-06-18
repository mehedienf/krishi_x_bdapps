import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  // আনসাবস্ক্রিপশনের মূল API এন্ডপয়েন্ট
  static const String _unsubscribeUrl = "https://bdapps.flicksize.com/krishix/api/unsubscribe.php";

  Future<void> _confirmAndUnsubscribe(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Unsubscribe'),
        content: const Text('আপনি কি সাবস্ক্রিপশন বাতিল করতে চান?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('বাতিল'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('হ্যাঁ, বাতিল করুন'),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    final prefs = await SharedPreferences.getInstance();
    final phone = prefs.getString('userPhone') ?? '';
    if (phone.isEmpty) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('কোনো লগইন করা নম্বর নেই'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
      return;
    }

    // ব্যাকএন্ড প্রসেস চলাকালীন নন-ডিসমিসিবল প্রগ্রেস বার শো করা
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    try {
      // সরাসরি HTTP POST এবং ১৫ সেকেন্ডের টাইমআউট প্রটেকশন
      final response = await http.post(
        Uri.parse(_unsubscribeUrl),
        body: {'user_mobile': phone},
      ).timeout(const Duration(seconds: 15));

      if (!context.mounted) return;
      Navigator.of(context).pop(); // লোডিং ডায়ালগ ক্লোজ করা

      if (response.statusCode == 200) {
        dynamic parsed;
        try {
          parsed = jsonDecode(response.body);
        } catch (_) {
          parsed = response.body;
        }

        final data = parsed is Map<String, dynamic> ? parsed : <String, dynamic>{};

        // সমস্ত সম্ভাব্য সাকসেস প্যারামিটার চেক করা
        final statusCode = (data['statusCode'] ?? data['StatusCode'] ?? data['status_code'])
                ?.toString()
                .trim()
                .toUpperCase() ?? '';

        final subscriptionStatus = data['subscriptionStatus']?.toString().trim().toUpperCase() ?? '';
        
        // মেসেজ বা স্ট্যাটাসডিটেইলস টেক্সট চেক করা
        final responseMessage = (data['message'] ?? data['statusDetail'] ?? '').toString().toLowerCase();

        // এখানে তোমার এরর মেসেজটি (already unsubscribed) সাকসেস কন্ডিশনে যুক্ত করা হয়েছে
        final success = data['success'] == true ||
            statusCode == 'S1000' ||
            subscriptionStatus == 'UNREGISTERED' ||
            data['status']?.toString().trim().toLowerCase() == 'success' ||
            data['result']?.toString().trim().toLowerCase() == 'success' ||
            statusCode == 'E1351' || 
            responseMessage.contains('unsubscribe') ||
            responseMessage.contains('invalid') || 
            responseMessage.contains('already');

        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('সাবস্ক্রিপশন সফলভাবে বাতিল করা হয়েছে।'),
              backgroundColor: Colors.green,
            ),
          );

          // লোকাল সেশন বা SharedPreferences ক্লিয়ার করা
          await prefs.setBool('isLoggedIn', false);
          await prefs.remove('userPhone');
          
          if (context.mounted) {
            // তোমার অ্যাপের রুট অনুযায়ী যদি '/login' না হয়ে অন্য কিছু হয় (যেমন: 'LoginPage()')
            // তাহলে pushNamedAndRemoveUntil এর বদলে MaterialPageRoute ব্যবহার করতে পারো।
            Navigator.of(
              context,
              rootNavigator: true,
            ).pushNamedAndRemoveUntil('/login', (route) => false);
          }
        } else {
          final msg = data['statusDetail']?.toString() ?? 
                     (data['message']?.toString() ?? 'বাতিল ব্যর্থ হয়েছে। আবার চেষ্টা করুন।');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(msg), backgroundColor: Colors.redAccent),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('সার্ভার ত্রুটি: HTTP ${response.statusCode}'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } on TimeoutException catch (_) {
      if (!context.mounted) return;
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('রিকোয়েস্ট টাইমআউট হয়েছে। আবার চেষ্টা করুন।'),
          backgroundColor: Colors.redAccent,
        ),
      );
    } catch (e) {
      if (!context.mounted) return;
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('নেটওয়ার্ক ত্রুটি: ${e.toString()}'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/app_icon.png', width: 64, height: 64),
                    const SizedBox(width: 12),
                    const Text(
                      'KrishiX',
                      style: TextStyle(
                        color: Color.fromARGB(255, 37, 87, 38),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                tileColor: Colors.red,
                title: const Text(
                  'আনসাবস্ক্রাইব করুন',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                onTap: () async {
                  await _confirmAndUnsubscribe(context);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'এসএমএস দিয়ে আনসাবস্ক্রাইব করুন',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'STOP 62742 লিখুন এবং 21213 নম্বরে পাঠান',
                    style: TextStyle(fontSize: 12, color: Colors.black45),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}