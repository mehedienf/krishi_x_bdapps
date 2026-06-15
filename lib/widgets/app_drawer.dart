import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/subscription_service.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

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
          const SnackBar(content: Text('কোনো লগইন করা নম্বর নেই')),
        );
      }
      return;
    }

    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Unsubscribing…')));
    }

    try {
      final svc = SubscriptionService();
      final result = await svc.unsubscribe(phone);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              result.message ?? (result.success ? 'বাতিল সফল' : 'বাতিল ব্যর্থ'),
            ),
          ),
        );
      }

      if (result.success ||
          result.message != null &&
              result.message!.toLowerCase().contains('http') == false &&
              result.message!.toLowerCase().contains('too many api') == false) {
        // If it was a success, or it was not a network/rate-limit error (e.g. backend responded), log them out
        await prefs.setBool('isLoggedIn', false);
        await prefs.remove('userPhone');
        if (context.mounted) {
          Navigator.of(
            context,
            rootNavigator: true,
          ).pushNamedAndRemoveUntil('/login', (route) => false);
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('ত্রুটি: ${e.toString()}')));
      }
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
              padding: .all(0),
              // decoration: const BoxDecoration(color: Color(0xFF1B5E20)),
              child: Center(
                child: Row(
                  mainAxisAlignment: .center,
                  children: [
                    Image.asset('assets/app_icon.png', width: 64, height: 64),
                    const SizedBox(width: 12),
                    Text(
                      'KrishiX',
                      style: TextStyle(
                        color: const Color.fromARGB(
                          255,
                          37,
                          87,
                          38,
                        ).withValues(alpha: 0.3),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // const SizedBox(height: 6),
              // const Text('মেনু', style: TextStyle(color: Colors.white70)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(borderRadius: .circular(40)),
                tileColor: Colors.red,
                // leading: const Icon(Icons.cancel_outlined, color: Colors.red),
                title: const Text(
                  'আনসাবস্ক্রাইব করুন',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 18),
                  textAlign: .center,
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
