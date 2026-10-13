# TERRARUN — Functional & Technical Specification

## 1. Executive Summary
TERRARUN is an Android-first mobile application that transforms real-world running into a territory capture strategy game. Players record their running routes via GPS. When a runner completes a closed loop, the enclosed grid cells are evaluated, and eligible territory is captured and added to the runner's domain.

---

## 2. Target Platform & Scope
- **Primary Platform:** Android (initial development phase).
- **Activity Scope:** Running only. Cycling, driving, and external wearable integrations are out of scope.
- **Backend Service:** Supabase (Auth, PostgreSQL/PostGIS Database, Storage) [PLANNED].
- **Map Provider:** TBD [OPEN: Flutter Map with OSM vs. Mapbox vs. Google Maps].

---

## 3. Key Functional Modules

### 3.1 Design System & App Navigation (M1)
- Material 3 theme with support for light and dark modes.
- Responsive app shell with bottom navigation bar across core sections.

### 3.2 Authentication & Player Profile (M2)
- Supabase Authentication (email/password sign-up, login, password reset).
- Player profile management (avatar display, display name, total stats, privacy settings).

### 3.3 Home Dashboard & Map UI (M3)
- Central dashboard displaying active territory stats, recent runs, and quick-start tracking button.
- Interactive map interface with real-time location tracking and map view controls.

### 3.4 GPS Run Tracking (M4)
- Foreground service for continuous GPS coordinate tracking on Android during active runs.
- Live metric updates: Total distance, elapsed time, current pace, and active polyline rendering.
- Local storage for raw coordinate streams to support offline-first recording.

### 3.5 Run Summary & History (M5)
- Post-run summary view displaying route polyline, distance, duration, pace, and completed laps.
- Local run log with detail views for past runs.
- Saves all runs regardless of whether new territory was captured.

### 3.6 Grid System, Closed Loops & Territory Capture (M6)
- World coordinate geographic grid segmentation overlay.
- Geometric closed loop detection algorithm on recorded run polylines.
- Cell evaluation algorithms (proposed 50% cell progress, 100% occupation thresholds).
- Brief cell traversal prohibition and duplicate reward prevention for previously owned cells.

### 3.7 Territory Battles, Loss & Reclaim (M7)
- System allowing players to contest, capture, lose, and reclaim territory.
- Battle/decay mechanics for rival-owned grid cells (per approved rules).
- Territory loss history and alert notifications.

### 3.8 Friends & Friend Requests (M8)
- Search players by username or display name.
- Send, accept, decline, and manage friend requests.
- Friends list view showing online status and profile summaries.

### 3.9 Rivals & Competitions (M9)
- Designation of local rival runners in overlapping territory zones.
- Head-to-head territory capture competitions and custom time-bound challenges.

### 3.10 Leaderboards: Global, State, City & Friends (M10)
- Four competitive leaderboard tiers:
  1. Global Leaderboard
  2. State Leaderboard
  3. City Leaderboard
  4. Friends Leaderboard
- Ranked by Total Territory Owned, Total Distance, and Active Streak.

### 3.11 Dynamic Titles, Achievements & Progression (M11)
- Dynamic player titles unlocked based on territory size and running milestones (e.g., "District Explorer", "Territory Legend").
- Achievement badges and XP-based player level progression.

### 3.12 Quality Assurance, Accessibility, Security & Anti-Cheat (M12)
- GPS anti-cheat filtering (mock location detection, maximum speed thresholds).
- Row Level Security (RLS) enforcement and client secret exclusion.
- Comprehensive unit, widget, and integration test coverage.

### 3.13 Play Store Release & Post-Launch Operations (M13)
- Google Play Store metadata, privacy policy, release signing (`key.properties`), App Bundle (AAB) builds, and crash analytics.

---

## 4. Open Technical & Design Items [OPEN]
- **[OPEN] Map Provider Engine:** Flutter Map with OSM vs. Mapbox vs. Google Maps.
- **[OPEN] State Management Solution:** BLoC vs. Riverpod vs. Provider.
- **[OPEN] Local Database Solution:** Isar vs. Hive vs. sqflite.
- **[OPEN] Grid Indexing System:** H3 Hexagonal vs. S2 Spatial Cells vs. Custom Bounding Box.
- **[OPEN] Threshold Math:** Exact geometric definition for 50% cell progress and 100% occupation.
- **[OPEN] Battle Mechanics:** Algorithms for contesting and reclaiming rival territory.
