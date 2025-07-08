# 🧪 Flutter Unit Test Masterclass

A complete hands-on guide to unit testing in Flutter using `flutter_test`, `mocktail`, and clean architecture principles. This repository demonstrates how to write modular, testable code by building a simple **shopping cart system with promo code support**.

---

## 📘 https://medium.com/@amit.marthak03/a-complete-guide-to-unit-testing-in-flutter-with-mocktail-clean-architecture-f8ebf935c69d

Read the full tutorial on Medium:  
**[A Complete Guide to Unit Testing in Flutter with Mocktail & Clean Architecture](#)**  

---

## 🚀 What You'll Learn

- How to structure testable and modular Flutter code
- Writing unit tests using `flutter_test`
- Mocking dependencies using `mocktail`
- Validating cart logic and promo codes with test coverage
- Building a maintainable architecture ready for production

---

## 📦 Project Structure
lib/
├── models/
│ └── cart_item_model.dart
├── services/
│ ├── cart_service.dart
│ └── promo_service.dart
test/
├── cart_service_test.dart
├── promo_service_test.dart
└── price_service_test.dart (with mocktail)