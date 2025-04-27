
# English Quiz Application

## Overview
**English Quiz** is a freelance project developed in 2022. It provides a full English multiple-choice testing system with automatic scoring and real-time feedback. The application is built with a **Flutter frontend** and a **Laravel backend**, connected to a **MySQL database**.

It is designed for educational institutions, independent tutors, and individual learners.

## ✨ Features
- Multiple-choice English quizzes
- Real-time answer validation and scoring
- Final results summary (correct vs incorrect answers)
- User authentication (if enabled)
- Mobile-friendly UI (Flutter)
- Backend REST API (Laravel)

## 🛠 Technologies Used

| Part | Technology |
|:----|:-----------|
| Frontend | Flutter |
| Backend | Laravel (PHP) |
| Database | MySQL |

## 🚀 Installation and Setup

### 1. Backend Setup (Laravel)

#### Requirements
- PHP (>= 7.4)
- Composer
- MySQL Server
- Laravel (optional global installation)

#### Steps

```bash
# Clone the backend repository
git clone https://github.com/MohaAmiry/english_quiz.git

# Navigate to backend folder
cd english_quiz

# Install dependencies
composer install

# Copy the .env example
cp .env.example .env

# Set your MySQL database details inside .env
# Example inside .env:
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=english_quiz_db
DB_USERNAME=root
DB_PASSWORD=yourpassword

# Generate Laravel app key
php artisan key:generate

# Create the MySQL database manually:
# Login to MySQL and run:
CREATE DATABASE english_quiz_db;

# Run database migrations
php artisan migrate

# Start the Laravel server
php artisan serve
```

The backend will run at:

```
http://127.0.0.1:8000
```

### 2. Frontend Setup (Flutter)

#### Requirements
- Flutter SDK installed
- Android Studio / VSCode / Xcode for development
- Emulator or real device

#### Steps

```bash
# Navigate to your Flutter project
cd path/to/your/flutter/frontend

# Get dependencies
flutter pub get

# Run the app
flutter run
```

Make sure you update your API URLs in the Flutter app (example):

```dart
String baseUrl = 'http://127.0.0.1:8000/api/';
```

- If running on an Android emulator, use `http://10.0.2.2:8000/api/` instead of `127.0.0.1`.



## ⚖️ License
This project is licensed for educational and freelance use only.

## 📬 Contact

For inquiries or collaboration:
- GitHub: [@Karamkottish](https://github.com/Karamkottish)

# ✅ Final Notes

- Backend API must be running before you launch the mobile app.
- Always match your Flutter API URL with the backend server address.
- Database migrations automatically create necessary tables.

## 📚 Useful References
- [Laravel Official Documentation](https://laravel.com/docs/11.x)
- [Flutter Official Documentation](https://flutter.dev/docs)
- [MySQL Official Documentation](https://dev.mysql.com/doc/)
