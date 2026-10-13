# TERRARUN — Architecture & Technical Design

This document details the confirmed requirements, proposed architecture, and current implementation state of TERRARUN.

---

## 1. Confirmed Architecture Requirements
- **Target Platform:** Android mobile application.
- **Activity Tracking Scope:** Running activity recording via smartphone GPS only.
- **Offline Capability:** GPS run tracking and route logging must operate without an active network connection.
- **Client Security Rule:** Supabase secret/service-role keys are strictly forbidden in client-side code. All public client interactions must use anon keys paired with database Row Level Security (RLS).

---

## 2. Proposed Architecture (Subject to Approval)

### 2.1 Layered Pattern (Clean Architecture) [PROPOSED]
The planned architecture proposes three primary layers:

```
┌─────────────────────────────────────────────────────────┐
│                    Presentation Layer                   │
│      (Flutter Widgets, UI Screens, State Management)    │
└────────────────────────────┬────────────────────────────┘
                             │
┌────────────────────────────▼────────────────────────────┐
│                       Domain Layer                      │
│     (Pure Dart Entities, Use Cases, Geometry Logic)     │
└────────────────────────────┬────────────────────────────┘
                             │
┌────────────────────────────▼────────────────────────────┐
│                        Data Layer                       │
│    (Repositories, Local Storage, Supabase Client Engine)│
└────────────────────────────┴────────────────────────────┘
```

### 2.2 Proposed Technology Stack Components
- **State Management:** [PROPOSED / OPEN: BLoC vs. Riverpod vs. Provider]
- **Local Database:** [PROPOSED / OPEN: Isar vs. Hive vs. sqflite]
- **Map Provider Engine:** [PROPOSED / OPEN: Flutter Map with OSM vs. Mapbox vs. Google Maps]
- **Backend Service:** [PLANNED: Supabase for Auth, PostgreSQL/PostGIS Database, Storage, and Real-time Sync]
- **Background Sync Strategy:** [PROPOSED / OPEN: WorkManager background sync engine for uploading offline runs and territory claims]

---

## 3. Verified Current Implementation State
- **Application Codebase:** Default Flutter starter counter template in `lib/main.dart` (`MyApp`, `MyHomePage`).
- **Android Configuration:** Namespace and Application ID set to `com.vybronx.terrarun.terrarun_app` in Gradle Kotlin DSL (`android/app/build.gradle.kts`).
- **Implemented Business Logic:** None. GPS tracking, map rendering, grid math, closed loop algorithms, state management, local database, and Supabase integration are **not yet implemented**.

---

## 4. Security Architecture & Audit Status
- **Planned Security Measures:**
  - Runtime loading of anon public keys via environment configuration (`.env`).
  - Row Level Security (RLS) in PostgreSQL to enforce user data boundaries.
  - Server-side validation for territory claims and anti-cheat checks.
- **Verification Status:**
  - M0 pre-publication review of project files, sensitive configuration, `.gitignore`, and intended initial commit contents is underway.
  - Comprehensive application and backend security audit (RLS policies, anti-cheat, penetration testing) is planned for M12 prior to production release. No security audit has been marked passed.
