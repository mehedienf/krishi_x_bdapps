# farmers_weather_app
# 🌾 KrishiX (কৃষিএক্স) — Farmers & Weather App for Bangladesh

A new Flutter project.
> **Comprehensive Technical & Functional Project Report**  
> **Platform:** Flutter (Android, iOS, Web, Desktop)    
> **Ecosystem:** Robi & Cirkle BDApps Platform (Bangladesh)  
> **Package ID:** `com.bdapps.krishix` | **Version:** 1.0.0+1  

## Getting Started
---

This project is a starting point for a Flutter application.
## 📑 Table of Contents (সূচিপত্র)

A few resources to get you started if this is your first Flutter project:
- [farmers\_weather\_app](#farmers_weather_app)
- [🌾 KrishiX (কৃষিএক্স) — Farmers \& Weather App for Bangladesh](#-krishix-কৃষিএক্স--farmers--weather-app-for-bangladesh)
  - [Getting Started](#getting-started)
  - [📑 Table of Contents (সূচিপত্র)](#-table-of-contents-সূচিপত্র)
  - [📖 Executive Summary (প্রজেক্ট পরিচিতি)](#-executive-summary-প্রজেক্ট-পরিচিতি)
  - [🏛 Core Architecture \& System Flow (সিস্টেম আর্কিটেকচার ও প্রবাহ)](#-core-architecture--system-flow-সিস্টেম-আর্কিটেকচার-ও-প্রবাহ)
  - [🚀 Key Features \& Capabilities (প্রধান বৈশিষ্ট্যসমূহ)](#-key-features--capabilities-প্রধান-বৈশিষ্ট্যসমূহ)
    - [1. BDApps Telco Integration \& Subscription System](#1-bdapps-telco-integration--subscription-system)
    - [2. Hyper-local Weather \& 7-Day Forecast](#2-hyper-local-weather--7-day-forecast)
    - [3. BMD Cyclone Warning \& Pulsing "Signal Aura"](#3-bmd-cyclone-warning--pulsing-signal-aura)
    - [4. BAMIS Pest \& Disease Epidemiological Alert](#4-bamis-pest--disease-epidemiological-alert)
    - [5. FFWC Flood Risk Bulletin \& SADMS Drought Monitor](#5-ffwc-flood-risk-bulletin--sadms-drought-monitor)
    - [6. Seasonal Crop Advisory \& High-Yield Seed Varieties](#6-seasonal-crop-advisory--high-yield-seed-varieties)
    - [7. Soil Testing, Fertilizer \& Irrigation Management](#7-soil-testing-fertilizer--irrigation-management)
    - [8. Government Support, Subsidies \& Agri Loans](#8-government-support-subsidies--agri-loans)
    - [9. Live Services \& In-App Web Portals](#9-live-services--in-app-web-portals)
    - [10. Emergency SOS Hotline \& Push Notifications](#10-emergency-sos-hotline--push-notifications)
  - [📂 Codebase Structure \& Directory Map (ফাইল ও ডিরেক্টরি কাঠামো)](#-codebase-structure--directory-map-ফাইল-ও-ডিরেক্টরি-কাঠামো)
  - [⚙️ State Management \& Provider Architecture (স্টেট ম্যানেজমেন্ট)](#️-state-management--provider-architecture-স্টেট-ম্যানেজমেন্ট)
  - [🌐 External APIs \& Data Sources (এপিআই ও তথ্যের উৎস)](#-external-apis--data-sources-এপিআই-ও-তথ্যের-উৎস)
    - [১. টেলকো / BDApps API](#১-টেলকো--bdapps-api)
    - [২. আবহাওয়া ডেটা API (Open-Meteo)](#২-আবহাওয়া-ডেটা-api-open-meteo)
  - [🔒 Device Permissions \& Platform Configs (অনুমতি ও কনফিগারেশন)](#-device-permissions--platform-configs-অনুমতি-ও-কনফিগারেশন)
  - [🛠 Installation \& Build Guide (চালু ও বিল্ড করার নির্দেশিকা)](#-installation--build-guide-চালু-ও-বিল্ড-করার-নির্দেশিকা)
    - [সিস্টেম রিকোয়ারমেন্ট](#সিস্টেম-রিকোয়ারমেন্ট)
    - [ইন্সটলেশন ধাপসমূহ](#ইন্সটলেশন-ধাপসমূহ)
  - [🔮 Future Roadmap \& Recommendations (ভবিষ্যৎ প্রস্তাবনা)](#-future-roadmap--recommendations-ভবিষ্যৎ-প্রস্তাবনা)
---

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
"# farmers_weather_app" 
## 📖 Executive Summary (প্রজেক্ট পরিচিতি)

**KrishiX (কৃষিএক্স)** হলো বাংলাদেশের প্রান্তিক কৃষক ও কৃষি উদ্যোক্তাদের জন্য নির্মিত একটি আধুনিক, ডেটা-নির্ভর এবং অত্যন্ত কার্যকর হাইপার-লোকাল আবহাওয়া ও কৃষি পরামর্শ অ্যাপ। 

বাংলাদেশের ভৌগোলিক বাস্তবতা বিবেচনা করে অ্যাপটিতে রিয়েল-টাইম আবহাওয়া পূর্বাভাসের পাশাপাশি **বাংলাদেশ আবহাওয়া অধিদপ্তর (BMD)**-এর ঘূর্ণিঝড় সংকেত, **বন্যা পূর্বাভাস ও সতর্কীকরণ কেন্দ্র (FFWC)**-এর নদী পরিস্থিতি, **বাংলাদেশ কৃষি আবহাওয়া তথ্য পদ্ধতি (BAMIS)**-এর রোগ-বালাই পূর্বাভাস, **মৃত্তিকা সম্পদ উন্নয়ন ইনস্টিটিউট (SRDI)**-এর মাটি পরীক্ষা নির্দেশিকা এবং **বাংলাদেশ কৃষি উন্নয়ন কর্পোরেশন (BADC)**-এর উন্নত বীজের তথ্য একত্রিত করা হয়েছে।
বাংলাদেশের ভৌগোলিক বাস্তবতা বিবেচনা করে অ্যাপটিতে রিয়েল-টাইম আবহাওয়া পূর্বাভাস ছাড়াও **বাংলাদেশ আবহাওয়া অধিদপ্তর (BMD)**-এর ঘূর্ণিঝড় সংকেত, **বন্যা পূর্বাভাস ও সতর্কীকরণ কেন্দ্র (FFWC)**-এর নদী পরিস্থিতি, **বাংলাদেশ কৃষি আবহাওয়া তথ্য পদ্ধতি (BAMIS)**-এর রোগ-বালাই পূর্বাভাস, **মৃত্তিকা সম্পদ উন্নয়ন ইনস্টিটিউট (SRDI)**-এর মাটি পরীক্ষা নির্দেশিকা এবং **বাংলাদেশ কৃষি উন্নয়ন কর্পোরেশন (BADC)**-এর উন্নত বীজের তথ্য একত্রিত করা হয়েছে।

অ্যাপটি সরাসরি রবি ও এয়ারটেল-এর **BDApps** সাবস্ক্রিপশন প্ল্যাটফর্মের সাথে সংযুক্ত। ফলে ব্যবহারকারীরা সহজেই তাদের মোবাইল নম্বর দিয়ে ওটিপি (OTP) ভেরিফিকেশনের মাধ্যমে প্রতিদিন মাত্র **২.৭৮ টাকা (ভ্যাট, এসডি ও এসসি সহ)** সাবস্ক্রিপশন মডেলে সকল প্রিমিয়াম সেবা উপভোগ করতে পারেন।
অ্যাপটি সরাসরি রবি ও সার্কেল (Cirkle)-এর **BDApps** সাবস্ক্রিপশন প্ল্যাটফর্মের সাথে সংযুক্ত। ফলে ব্যবহারকারীরা সহজেই তাদের মোবাইল নম্বর দিয়ে ওটিপি (OTP) ভেরিফিকেশনের মাধ্যমে প্রতিদিন মাত্র **২.৭৮ টাকা (ভ্যাট, এসডি ও এসসি সহ)** সাবস্ক্রিপশন মডেলে সকল প্রিমিয়াম সেবা উপভোগ করতে পারেন।

---

## 🏛 Core Architecture & System Flow (সিস্টেম আর্কিটেকচার ও প্রবাহ)

অ্যাপটি **Flutter 3.10+ / Dart 3.x** দ্বারা নির্মিত এবং পরিষ্কার **Provider Architecture** অনুসরণ করে। নিচে অ্যাপটির ডেটা এবং ইউজার জার্নির ফ্লোচার্ট দেওয়া হলো:

```
+--------------------------------------------------------------------------+
|                            APP INITIALIZATION                            |
|                          (main.dart / _AuthGate)                         |
+--------------------------------------------------------------------------+
                                     |
             +-----------------------+-----------------------+
             |                                               |
      [Not Logged In]                                  [Logged In]
             v                                               v
+-------------------------+                     +--------------------------+
|        LoginPage        |                     |     _AppInitializer      |
|  - Robi/Cirkle Check    |                     |  - Location Detection    |
|  - Check Subscription   |                     |  - Weather Fetch         |
|  - Send OTP (4m timer)  |                     |  - Setup Periodic Clock  |
|  - Verify & Sync        |                     |  - Notifications Init    |
+-------------------------+                     +--------------------------+
             |                                               |
             +-----------------> /home <--------------------+
                                   |
         +-------------------------+-------------------------+
         |                                                   |
+-------------------+                     +----------------------------------+
| SignalAuraOverlay |                     |          _MainNavigator          |
| (Edge Glow on     |                     |        (IndexedStack Page)       |
|  Warning > 4)     |                     +----------------------------------+
+-------------------+                                      |
                               +---------------------------+---------------------------+
                               |                           |                           |
                               v                           v                           v
                      +------------------+       +-------------------+       +--------------------+
                      |    Tab 1: 🌾     |       |     Tab 2: ☁️     |       |     Tab 3: 🌐      |
                      |   KrishokPage    |       |   ForecastPage    |       |  LiveServicesPage  |
                      |  (Agri & Alerts) |       |  (7-Day Weather)  |       | (Govt Web Portals) |
                      +------------------+       +-------------------+       +--------------------+
```

---

## 🚀 Key Features & Capabilities (প্রধান বৈশিষ্ট্যসমূহ)

### 1. BDApps Telco Integration & Subscription System
- **টেলকো ভ্যালিডেশন:** শুধুমাত্র রবি (`018`) এবং এয়ারটেল (`016`) মোবাইল নম্বরের জন্য বিশেষায়িত রেজেক্স ভ্যালিডেশন (`^01(?:6|8)\d{8}$`)।
- **টেলকো ভ্যালিডেশন:** শুধুমাত্র রবি (`018`) এবং সার্কেল/Cirkle (`016`) মোবাইল নম্বরের জন্য বিশেষায়িত রেজেক্স ভ্যালিডেশন (`^01(?:6|8)\d{8}$`)।
- **স্বয়ংক্রিয় স্ট্যাটাস চেকিং:** ব্যবহারকারী পূর্বে নিবন্ধিত থাকলে পুনরায় ওটিপি ছাড়া সাথে সাথে লগইন (`check_subscription.php`)।
- **কাউন্টডাউন টাইমার সহ OTP ভেরিফিকেশন:** ৪ মিনিট (২৪০ সেকেন্ড) লাইভ কাউন্টডাউন টাইমার, কালার-কোডেড ভিজ্যুয়াল অ্যালার্ট এবং স্বয়ংক্রিয় রেফারেন্স নম্বর ট্র্যাকিং।
- **রেট লিমিটিং ও ক্যাশিং:** টেলকো এপিআই কোটা বাঁচাতে ঘন্টায় সর্বোচ্চ ২০টি কল সীমা এবং ৫ মিনিটের লোকাল ক্যাশিং (`SubscriptionService`)।
- **আনসাবস্ক্রাইব সুবিধা:** ইন-অ্যাপ ড্রয়ার থেকে ওয়ান-ক্লিক আনসাবস্ক্রাইব এপিআই এবং এসএমএস নির্দেশিকা (`STOP 62742` লিখে পাঠান `21213` নম্বরে)।

### 2. Hyper-local Weather & 7-Day Forecast
- **ওপেন-মেটিও (Open-Meteo) ইন্টিগ্রেশন:** কোনো জটিল API Key ছাড়াই সম্পূর্ণ বিনামূল্যে রিয়েল-টাইম লাইভ ওয়েদার ও ৭ দিনের পূর্বাভাস।
- **অটো-ডিটেক্ট জেলা ও ম্যানুয়াল নির্বাচন:** ডিভাইস জিপিএস (Geolocator) এর মাধ্যমে হাভারসাইন (Haversine) ফর্মুলা প্রয়োগ করে নিকটস্থ জেলা স্বয়ংক্রিয়ভাবে সনাক্ত করে। এছাড়াও ৬৪টি জেলার যে কোনোটি ম্যানুয়ালি নির্বাচন করা যায়।
- **অফলাইন রেজিলিয়েন্স ও ক্যাশ সাপোর্ট:** নেটওয়ার্ক না থাকলে সর্বশেষ সংরক্ষিত ক্যাশ ডেটা প্রদর্শন এবং কতক্ষণ আগের ডেটা তা স্ট্যাম্প আকারে দেখানো হয় (সর্বোচ্চ ৭ দিন পর্যন্ত অফলাইন ক্যাশ সাপোর্ট)।

### 3. BMD Cyclone Warning & Pulsing "Signal Aura"
- **ঘূর্ণিঝড় সংকেত হিসাব (BMD Standard):** বাতাসের গতিবেগ (km/h) বিশ্লেষণ করে আবহাওয়া অধিদপ্তরের ১ থেকে ১০ নম্বর সতর্ক সংকেত স্বয়ংক্রিয়ভাবে নির্ধারণ করা হয়।
- **সিগন্যাল অরা (Signal Aura Effect):** বিপদ সংকেত ৫ থেকে ১০ এ পৌঁছালে ব্যবহারকারীর স্ক্রিনের চারধারে একটি পালসিং অ্যাম্বিয়েন্ট গ্লো (Pulsing Edge Glow) জ্বলতে থাকে (`SignalAuraOverlay`), যা কৃষকদের দ্রুত নিরাপদ আশ্রয়ে যাওয়ার কথা স্মরণ করিয়ে দেয়।
- **কৃষকদের বিস্তারিত করণীয়:** প্রতিটি সংকেতের (১-১০) জন্য মাঠে কী করণীয় তা বাংলা ভাষায় বিস্তারিত কার্ড আকারে লিপিবদ্ধ।

### 4. BAMIS Pest & Disease Epidemiological Alert
- **রোগ-বালাই পূর্বাভাস মডেল:** তাপমাত্রা এবং বাতাসের আর্দ্রতার রিয়েল-টাইম কম্বিনেশন থেকে রোগের ঝুঁকি নির্ণয়:
  - *ধানের ব্লাস্ট রোগ* (Pyricularia oryzae) — আর্দ্রতা > ৭৮% এবং তাপমাত্রা ১৮°–৩০° সেলসিয়াস।
  - *শিথ ব্লাইট / খোল পচা* (Rhizoctonia solani) — আর্দ্রতা > ৮৫% এবং তাপমাত্রা ২৫°–৩৫° সেলসিয়াস।
  - *জাবপোকা ও সাদামাছি* — উচ্চ তাপমাত্রা (> ৩২° সেলসিয়াস) এবং কম আর্দ্রতা।
  - *আলুর মড়ক / লেট ব্লাইট* (Phytophthora infestans) — আর্দ্রতা > ৮৫% এবং তাপমাত্রা ১২°–২২° সেলসিয়াস।
- **প্রতিকার ও প্রতিরোধ:** আক্রান্ত ফসলের জন্য সঠিক কীটনাশক/ছত্রাকনাশকের ডোজ এবং প্রতিরোধমূলক ব্যবস্থার দিকনির্দেশনা।

### 5. FFWC Flood Risk Bulletin & SADMS Drought Monitor
- **নদী বন্যা পরিস্থিতি (FFWC):** যমুনা (বাহাদুরাবাদ), পদ্মা (হার্ডিঞ্জ ব্রিজ), মেঘনা (চাঁদপুর) এবং সুরমা (সিলেট) প্রধান নদ-নদীর বিপদসীমা ও লাইভ পরিস্থিতি ট্র্যাকিং।
- **সমন্বিত খরা সূচক (IDSI):**
  - **SPI (Standardized Precipitation Index):** বৃষ্টিপাতের ঘাটতি পর্যবেক্ষণ।
  - **VCI (Vegetation Condition Index):** উদ্ভিদের স্বাস্থ্যের অবস্থা।
  - **SMI (Soil Moisture Index):** মাটির আর্দ্রতার স্তর ও খরা সতর্কতা।

### 6. Seasonal Crop Advisory & High-Yield Seed Varieties
- **মৌসুমি ফসল ডায়নামিক্স:** ফোনের বর্তমান মাস অনুযায়ী স্বয়ংক্রিয়ভাবে ৪টি মৌসুমে বিভক্ত:
  - বসন্ত/গ্রীষ্ম (মার্চ–মে): পাট, আউশ ধান, মরিচ, তরমুজ
  - বর্ষা (জুন–সেপ্টেম্বর): আমন ধান, পাট, করলা, ঝিঙ্গা
  - শরৎ/হেমন্ত (অক্টোবর–নভেম্বর): আলু, সরিষা, মসুর, ফুলকপি
  - শীত (ডিসেম্বর–ফেব্রুয়ারি): বোরো ধান, গম, টমেটো, পেঁয়াজ
- **উন্নত জাতের বীজ তালিকা:** BRRI dhan28/29/88/49/52/54/48, Binadhan-19, BARI সরিষা-14/17, BARI আলু-25/72, BARI হাইব্রিড ভুট্টা-9 ইত্যাদি।

### 7. Soil Testing, Fertilizer & Irrigation Management
- **মাটি পরীক্ষা (SRDI):** প্রতি ৩ বছরে মাটি পরীক্ষা ও উপজেলা নির্দেশিকা অনুযায়ী সুষম সার ব্যবহারের নিয়মাবলী।
- **সারের ব্যবহার:** ইউরিয়া, টিএসপি, এমওপি/এসওপি প্রয়োগের সঠিক সময় ও বৃষ্টির সাথে সামঞ্জস্যতা।
- **আধুনিক সেচ (AWD):** পর্যায়ক্রমে শুকানো-ভেজানো সেচ পদ্ধতির মাধ্যমে ৩০% পানির অপচয় হ্রাস ও ইনপুট খরচ বাঁচানোর গাইড।

### 8. Government Support, Subsidies & Agri Loans
- **সরকারি প্রণোদনা:** বিনামূল্যে বীজ ও সার বিতরণ, কৃষক কার্ড ও সার ভর্তুকি, ৫০-৭০% কৃষি যন্ত্রপাতি ভর্তুকি।
- **কৃষি ব্যাংক ও ঋণ সুবিধা:** বাংলাদেশ কৃষি ব্যাংক (BKB) ৪% সুদে শস্য ঋণ, রাজশাহী কৃষি উন্নয়ন ব্যাংক (RAKUB), সাধারণ বীমা কর্পোরেশন ফসল বিমা ও ১০ টাকার কৃষক ব্যাংক অ্যাকাউন্ট খোলার তথ্য।

### 9. Live Services & In-App Web Portals
- অ্যাপের ভেতর থেকেই সরকারি ও প্রাতিষ্ঠানিক বিভিন্ন পোর্টাল সরাসরি ব্রাউজ করার ব্যবস্থা (`WebViewPage`):
  - FFWC লাইভ বন্যা মানচিত্র (`ffwc.gov.bd`)
  - Google Flood Forecasting Map
  - DDM দুর্যোগ ব্যবস্থাপনা অধিদপ্তর
  - DAM দৈনিক বাজার মূল্য তালিকা (`dam.gov.bd`)
  - BAMIS কৃষি উপদেষ্টা পোর্টাল
  - BADC বীজ ও সেচ পোর্টাল

### 10. Emergency SOS Hotline & Push Notifications
- **জরুরি ডায়ালার (SOS Button):** অ্যাপবারের লাল রঙের **"জরুরি সাহায্য"** বাটনে এক ট্যাপেই কৃষি হেল্পলাইন `16123`-তে সরাসরি কল ডায়াল।
- **লোকাল পুশ নোটিফিকেশন (`NotificationService`):** বিপদ সংকেত ৪-এর উপরে গেলে স্বয়ংক্রিয় ব্যাকগ্রাউন্ড ও ফোরগ্রাউন্ড পুশ নোটিফিকেশন ও ভাইব্রেশন অ্যালার্ট।

---

## 📂 Codebase Structure & Directory Map (ফাইল ও ডিরেক্টরি কাঠামো)

```
krishi_x_bdapps/
├── android/                        # Android নেটিভ কনফিগারেশন, পারমিশন ও Gradle স্ক্রিপ্ট
│   └── app/src/main/AndroidManifest.xml
├── assets/                         # অ্যাপ লোগো এবং আইকন রিসোর্স
│   ├── app_icon.png
│   └── icon.png
├── lib/                            # মূল Flutter ডার্ট কোডবেস
│   ├── main.dart                   # এন্ট্রি পয়েন্ট, মাল্টি-প্রোভাইডার ও রুট নেভিগেশন
│   ├── login.dart                  # BDApps মোবাইল নম্বর ইনপুট, ওটিপি ভেরিফিকেশন ও কাউন্টডাউন
│   ├── krishok_page.dart           # কৃষক সেবা: রোগ-বালাই, পরামর্শ, সার, ঋণ, বীজ ও বন্যা গাইড
│   ├── forecast_page.dart          # ৭ দিনের আবহাওয়া পূর্বাভাস, তাপমাত্রা, আর্দ্রতা ও রেইনফল
│   ├── live_services_page.dart     # সরকারি লাইভ ওয়েব সেবা ও পোর্টাল ডিরেক্টরি
│   ├── theme.dart                  # ডিজাইন সিস্টেম টোকেন, GlassCard ও কালার প্যালেট
│   │
│   ├── models/                     # ডেটা মডেল
│   │   └── weather_model.dart      # আবহাওয়ার ডেটা কাঠামো ও ক্যাশ সিরিয়ালাইজেশন
│   │
│   ├── providers/                  # স্টেট ম্যানেজমেন্ট প্রোভাইডার
│   │   ├── app_provider.dart       # জিপিএস অবস্থান, জেলা নির্বাচন (৬৪ জেলা), এসওএস স্টেট
│   │   ├── weather_provider.dart   # বর্তমান আবহাওয়া, ক্যাশিং ও বিএমডি সংকেত গণনা
│   │   ├── forecast_provider.dart  # ৭ দিনের পূর্বাভাস ফেচিং ও ক্যাশিং
│   │   └── admin_notification_provider.dart # অ্যাডমিন ব্রডকাস্ট বিজ্ঞপ্তি ও আনরিড কাউন্ট
│   │
│   ├── services/                   # ব্যাকএন্ড ও নেটওয়ার্ক সার্ভিসেস
│   │   ├── weather_service.dart    # Open-Meteo REST API কল ও ডেমো ডেটা ফলব্যাক
│   │   ├── subscription_service.dart # BDApps সাবস্ক্রিপশন, ওটিপি, রেট লিমিট ও আনসাবস্ক্রাইব
│   │   └── notification_service.dart # লোকাল পুশ নোটিফিকেশন ও ইন-অ্যাপ স্নাকবার অ্যালার্ট
│   │
│   └── widgets/                    # রি-ইউজেবল ইউআই উইজেটস
│       ├── app_drawer.dart         # সাইড মেনু, আনসাবস্ক্রাইব বোতাম ও এসএমএস নির্দেশিকা
│       ├── disaster_app_bar.dart   # কাস্টম ব্লার অ্যাপবার, জেলা নির্বাচক ও এসওএস বাটন
│       ├── signal_aura.dart        # দুর্যোগ সংকেত ৫+ হলে পালসিং স্ক্রিন এজ-গ্লো এফেক্ট
│       └── web_view_page.dart      # ইন-অ্যাপ ফুল-স্ক্রিন ব্রাউজার ও ওয়েব ভিউয়ার
│
├── pubspec.yaml                    # ডিপেন্ডেন্সি, অ্যাসেট ও প্লাগইন কনফিগারেশন
└── README.md                       # পূর্ণাঙ্গ প্রজেক্ট টেকনিক্যাল ও ফাংশনাল রিপোর্ট
```

---

## ⚙️ State Management & Provider Architecture (স্টেট ম্যানেজমেন্ট)

অ্যাপটিতে **Provider** প্যাকেজ ব্যবহার করে রিঅ্যাক্টিভ ও ডিক্লারেটিভ স্টেট ম্যানেজমেন্ট নিশ্চিত করা হয়েছে:

| প্রোভাইডার (Provider) | দায়িত্ব ও কাজের পরিধি |
|---|---|
| `AppProvider` | ডিভাইসের অক্ষাংশ ও দ্রাঘিমাংশ ট্র্যাক করা, ৬৪টি জেলার কোঅর্ডিনেট ম্যাপিং, হাভারসাইন ডিসট্যান্স ক্যালকুলেশন দিয়ে নিকটস্থ জেলা বের করা, ঘড়ির সময় প্রতি মিনিটে আপডেট এবং এসওএস নম্বর সংরক্ষণ। |
| `WeatherProvider` | বর্তমান তাপমাত্রা, বাতাসের গতি ও আর্দ্রতা লোড করা, বাতাসের বেগ অনুযায়ী BMD সাইক্লোন সংকেত (১-১০) বের করা, এবং লোকাল ক্যাশে সংরক্ষণ। |
| `ForecastProvider` | `ChangeNotifierProxyProvider` এর মাধ্যমে `AppProvider`-এর জেলা বা অবস্থান পরিবর্তন হলেই স্বয়ংক্রিয়ভাবে নতুন ৭ দিনের পূর্বাভাস লোড করে। |
| `AdminNotificationProvider` | নতুন বিজ্ঞপ্তি ব্রডকাস্ট করা, নোটিফিকেশন স্টোরেজ বজায় রাখা, পঠিত/অপঠিত স্ট্যাটাস হ্যান্ডেল করা এবং সিস্টেম ট্রেতে নোটিফিকেশন পাঠানো। |

---

## 🌐 External APIs & Data Sources (এপিআই ও তথ্যের উৎস)

### ১. টেলকো / BDApps API
- **বেস ইউআরএল:** `https://bdappsdigitalapps.com/NADB26015/prantik/` এবং `https://bdapps.flicksize.com/krishix/api/`
- **এন্ডপয়েন্টস:**
  - `POST check_subscription.php` — সাবস্ক্রিপশন স্ট্যাটাস চেক।
  - `POST send_otp.php` — মোবাইলে ওটিপি পাঠানো।
  - `POST verify_otp.php` — ওটিপি যাচাই এবং সাবস্ক্রিপশন এক্টিভেশন।
  - `POST unsubscribe.php` — সার্ভিস থেকে আনসাবস্ক্রাইব করা।

### ২. আবহাওয়া ডেটা API (Open-Meteo)
- **এন্ডপয়েন্ট:** `https://api.open-meteo.com/v1/forecast`
- **প্যারামিটারসমূহ:** `latitude`, `longitude`, `current=temperature_2m,relative_humidity_2m,weather_code,wind_speed_10m`, `daily=weather_code,temperature_2m_max,temperature_2m_min,precipitation_sum,wind_speed_10m_max,relative_humidity_2m_mean`, `timezone=Asia/Dhaka`.
- **বৈশিষ্ট্য:** লাইটওয়েট, উচ্চ গতিসম্পন্ন, কোনো রেট লিমিট বা API কী-এর জটিলতা নেই।

---

## 🔒 Device Permissions & Platform Configs (অনুমতি ও কনফিগারেশন)

`android/app/src/main/AndroidManifest.xml`-এ নিম্নোক্ত অনুমতিসমূহ কনফিগার করা আছে:
- `android.permission.INTERNET` — আবহাওয়া ডেটা ও টেলকো এপিআই কমিউনিকেশন।
- `android.permission.ACCESS_FINE_LOCATION` & `ACCESS_COARSE_LOCATION` — জিপিএস ও নেটওয়ার্কের মাধ্যমে সঠিক জেলা সনাক্তকরণ।
- `android.permission.POST_NOTIFICATIONS` — অ্যান্ড্রয়েড ১৩+ ডিভাইসে জরুরি দুর্যোগ নোটিফিকেশন পাঠানোর জন্য।
- `android.permission.VIBRATE` — দুর্যোগ সংকেত অ্যালার্টের সময় ভাইব্রেশন প্রদান।
- `android.permission.RECEIVE_BOOT_COMPLETED` — ডিভাইস রিস্টার্ট হলেও নোটিফিকেশন সার্ভিস কার্যকর রাখা।
- `queries` ট্যাগ — `tel:` স্কিমের মাধ্যমে এসওএস কল এবং `https:` স্কিমে ইন-অ্যাপ/সিস্টেম ব্রাউজার চালনা।

---

## 🛠 Installation & Build Guide (চালু ও বিল্ড করার নির্দেশিকা)

### সিস্টেম রিকোয়ারমেন্ট
- Flutter SDK `>=3.10.4`
- Dart SDK `>=3.10.4`
- Android Studio / VS Code
- Java 17 (Gradle ডেসিগারিং সাপোর্ট সহ)

### ইন্সটলেশন ধাপসমূহ

1. **রিপোজিটরি ক্লোন করুন:**
   ```bash
   git clone <repository_url>
   cd krishi_x_bdapps
   ```

2. **ডিপেন্ডেন্সি ইন্সটল করুন:**
   ```bash
   flutter pub get
   ```

3. **অ্যাপ আইকন জেনারেট করুন:**
   ```bash
   dart run flutter_launcher_icons
   ```

4. **ডিবাগ মোডে রান করুন:**
   ```bash
   flutter run
   ```

5. **প্রোডাকশন APK / App Bundle বিল্ড করুন:**
   ```bash
   # Release APK
   flutter build apk --release

   # Google Play / BDApps App Bundle
   flutter build appbundle --release
   ```

---

## 🔮 Future Roadmap & Recommendations (ভবিষ্যৎ প্রস্তাবনা)

1. **কৃত্রিম বুদ্ধিমত্তা ভিত্তিক ফসলের রোগ সনাক্তকরণ (AI Plant Disease Detection):** 
   - ক্যামেরায় আক্রান্ত পাতার ছবি তুলে অন-ডিভাইস TensorFlow Lite বা ক্লাউড ভিশন মডেলের মাধ্যমে রোগ নির্ণয় ও তাৎক্ষণিক প্রতিকার প্রদান।
2. **লাইভ কমিউনিটি ও কৃষক ফোরাম (Krishi Community Feed):**
   - অভিজ্ঞ কৃষি কর্মকর্তা এবং কৃষকদের মাঝে সরাসরি প্রশ্নোত্তর ও পরামর্শ আদান-প্রদানের সামাজিক মাধ্যম যুক্ত করা।
3. **ভয়েস অ্যাসিস্ট্যান্ট ও অডিও পরামর্শ (Bangla Voice Guidance):**
   - যে সকল কৃষক পড়তে পারেন না, তাদের জন্য অডিও আকারে আবহাওয়ার পূর্বাভাস ও জরুরি সতর্কতা শোনানোর ব্যবস্থা।
4. **সার্বক্ষণিক আইভিআর (IVR) ও এসএমএস পুশ ব্যাকআপ:**
   - স্মার্টফোন বা ইন্টারনেট সংযোগ সাময়িক বিচ্ছিন্ন থাকলে BDApps SMS ও OBD (Outbound Dialing) ব্রডকাস্টের মাধ্যমে সংকেত পাঠানো।

---

<p align="center">
  <b>KrishiX — কৃষকের পাশে, প্রযুক্তির সাথে।</b><br>
  <sub>Designed & Developed for Bangladesh Agricultural Development & Climate Resilience</sub>
</p>
