
# V2Ray VPN (Flutter)

---

### Overview
This project is a **Flutter-based V2Ray client** built using the  
[`flutter_vless`](https://pub.dev/packages/flutter_vless) package.

The project follows **Clean Architecture** principles and uses **Riverpod** for state management.
It supports adding VLESS configurations, storing them locally, connecting/disconnecting to servers, and performing ping tests.

---

### Features
- ✅ Add VLESS configurations (Vless/Vmess/Shadowsocks/Trojan/Socks5 supported)
- 💾 Store configurations locally using **SQLite (sqflite)**
- 🔌 Connect / Disconnect to V2Ray servers
- 📡 Ping all servers concurrently
- 🎯 Select active configuration
- 🧠 Clean Architecture structure
- ⚡ State management with **Riverpod**

---

### Project Structure (Clean Architecture)

````
lib/
├── core/
│   ├── errors/
│   ├── logging/
│   ├── routes/
│   ├── domains/
│   ├── theme/
│   ├── utils/
│   └── data/
│
├── features/
│   └── home/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       │
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       │
│       └── presentation/
│           ├── pages/
│           ├── components/
│           └── providers/
│
└── main.dart
````

### Architecture Layers

#### Domain Layer
- Contains **Entities**, **Use Cases**, and **Repository interfaces**
- Fully independent of Flutter and external packages

#### Data Layer
- Handles data sources (SQLite via `sqflite`)
- Maps raw data to domain entities
- Implements repository interfaces

#### Presentation Layer
- UI components
- Riverpod providers
- Handles user interactions and application state

---

### State Management
- Built with **Riverpod**
- Uses `Notifier` and `AsyncNotifier`
- Providers are auto-disposed where applicable
- Async lifecycle safety handled via `ref.mounted`

---

### Local Database
- Implemented using **sqflite**
- Auto-increment primary keys
- Stores VLESS configurations
- Only one configuration can be selected at a time

---

### Ping System
- Ping all servers concurrently using `Future.wait`
- Servers with negative or failed ping results are pushed to the bottom
- Sorted by lowest latency first

---

### Dependencies
- Flutter
- Riverpod
- flutter_vless
- sqflite

### Screenshots

<img src="screens/scr1.jpeg" height="300em" /> <img src="screens/scr2.jpeg" height="300em" />