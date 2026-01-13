# 📱 Daily Quote App (Flutter)

A clean and modern Flutter application that displays inspirational quotes, allows users to save favorites locally, and share quotes using the system share sheet.

This project demonstrates **clean architecture**, **state management with Cubit**, and **AI-assisted development workflow**.

---

## 🚀 Features

- Fetch random quotes from **ZenQuotes API**
- Shimmer loading state for better UX
- Like / Unlike quotes
- Save favorite quotes locally
- Favorites screen with persisted data
- Share quotes via system share sheet
- Graceful handling of:
  - Network errors
  - DNS issues
  - API rate limiting (HTTP 429)
- Gradient-based modern UI

---

## 🛠 Tech Stack

- **Flutter**
- **flutter_bloc (Cubit)** – state management
- **Dio** – network layer
- **SharedPreferences** – local persistence
- **get_it + injectable** – dependency injection
- **share_plus** – native share support
- **shimmer** – loading skeleton UI

---

## ⚙️ Setup Instructions

### Prerequisites
- Flutter SDK installed
- Android Emulator / iOS Simulator / Physical device

### Steps

```bash
git clone https://github.com/San23042001/quote_app.git
cd quote_app
flutter pub get
flutter run

### 🤖 How AI Was Used in This Project

AI tools were used as **assistive pair programmers** throughout the development process to accelerate iteration and improve solution quality, while all final technical decisions were made intentionally.

### 🧱 Architecture Planning
- Generated and refined a clean architecture folder structure
- Designed a Cubit-based state management flow aligned with best practices

### 🎨 UI Development
- Created initial UI layouts using **Stitch**
- Converted AI-generated designs into Flutter widgets
- Iteratively refined:
  - Spacing
  - Typography
  - Shimmer loading effects
  - Gradient backgrounds

### 🌐 Networking & Debugging
- Diagnosed and fixed real-world issues such as:
  - API timeouts and DNS resolution errors
  - ZenQuotes API rate limiting (HTTP 429)
  - Incorrect error propagation (`Instance of NetworkException`)
- Implemented robust Dio error mapping based on AI suggestions and manual validation

### 🔁 Iteration & Validation
- AI responses were reviewed critically rather than used blindly
- Incorrect or incomplete suggestions were refined through follow-up prompts
- Final implementations were manually verified and tested

AI significantly reduced iteration time while maintaining full control over architecture, logic, and UX decisions.

