# Sadeem Task Mobile App


https://github.com/user-attachments/assets/416c586c-fdc8-4818-a15b-5ffdedcf180c


A Flutter application that demonstrates modern app architecture and best practices for authentication, product browsing, and cart management

![Screenshot 2025-05-09 144944](https://github.com/user-attachments/assets/5ca1dc1d-b118-4a9d-a5b2-88b911c666c6)

## Features

- 🔐 **Authentication System**
  - Login with username/password
  - Token-based authentication with refresh tokens
  - Secure token storage
  - Auto-login functionality

- 📱 **Product Catalog**
  - Product grid with pagination
  - Product details view
 
  
- 🛒 **Cart Management**
  - Add products to cart
  - Update product quantity
  - Remove All  products


## Architecture

This app follows Clean Architecture principles with:

- **Data Layer**: API clients, DTOs, repositories implementation
- **Domain Layer**: Entities, repositories interfaces, use cases
- **Presentation Layer**: Cubit/BLoC state management, UI components

## Tech Stack

- **State Management**: Flutter Bloc/Cubit
- **Dependency Injection**: GetIt + Injectable
- **Networking**: Dio + Retrofit
- **Local Storage**: Hive, Flutter Secure Storage
- **Navigation**: Go Router
- **UI Components**: Custom widgets, responsive design

## Getting Started

### Prerequisites

- Flutter SDK 3.0 or higher
- Dart SDK 2.17 or higher
- Android Studio / VS Code
  
## Responsive Ui

![photo_2_2025-05-09_15-42-31](https://github.com/user-attachments/assets/f156bd70-c20d-42ec-a237-85e16465e759)  ![photo_1_2025-05-09_15-42-31](https://github.com/user-attachments/assets/d10cfb4e-8b74-4a7b-b80f-c1d68b7df742)



### Installation

1. Clone the repository:
```bash
git clone https://github.com/your-username/sadeem_task.git
