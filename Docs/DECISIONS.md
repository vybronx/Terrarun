# TERRARUN — Architecture Decision Records (ADR)

This file records confirmed, planned, and open technical decisions for TERRARUN.

---

## ADR 001: Initial Target Platform — Android Only
- **Date:** TBD
- **Status:** CONFIRMED SCOPE REQUIREMENT
- **Context:** Initial development and testing will focus exclusively on Android mobile devices.
- **Decision:** Build and optimize initial releases solely for Android.
- **Consequences:** Focuses platform permission handling and testing on Android location services.

---

## ADR 002: Backend Service — Supabase (Planned)
- **Date:** TBD
- **Status:** PLANNED / PROPOSED
- **Context:** App requires user authentication, cloud database storage, spatial geographic queries (PostGIS), and cloud sync.
- **Decision:** Select Supabase as the planned backend service provider.
- **Consequences:** Backend integration must enforce Row Level Security (RLS) and prohibit client-side secret keys.

---

## ADR 003: Core Activity Scope — Running Only
- **Date:** TBD
- **Status:** CONFIRMED SCOPE REQUIREMENT
- **Context:** Game rules need a specific physical movement scope for territory capture mechanics.
- **Decision:** Initial application supports running only. Cycling, driving, and external wearable devices are out of scope.
- **Consequences:** Simplifies movement speed validation and GPS tracking logic.

---

## Open & Proposed Technical Decisions [OPEN]
- **ADR-O01:** Map Rendering Framework (Flutter Map with OSM vs. Mapbox vs. Google Maps).
- **ADR-O02:** State Management Solution (BLoC vs. Riverpod vs. Provider).
- **ADR-O03:** Local Database Solution (Isar vs. Hive vs. sqflite).
- **ADR-O04:** Geographic Grid Indexing System (H3 Hexagonal vs. S2 Spatial Cells vs. Custom Lat-Lng Bounding Box).
- **ADR-O05:** Geometric formulation for 50% progress and 100% occupation thresholds.
- **ADR-O06:** Territory Battle, Loss & Reclaim Mechanics.
- **ADR-O07:** GPS Accuracy and Anti-Cheat Speed Validation Parameters.
