# TERRARUN — Game Rules & Gameplay Mechanics

This document defines confirmed gameplay rules, proposed mechanics, and undecided gameplay items for TERRARUN.

---

## 1. Confirmed Gameplay Scope & Rules
- **Target Platform:** Android mobile devices.
- **Allowed Activity:** Running only.
  - Cycling, driving, or motor vehicle movement strictly invalidates territory claims.
- **Location Hardware:** Smartphone GPS only.
  - External wearable device integration (e.g., Apple Watch, Garmin, Wear OS) is out of scope for initial development.
- **Run Metric Recording:**
  - GPS tracks and records the runner's route in real time.
  - Every run records total distance, active duration, route coordinates, and completion metrics.
- **Non-Territory Run Preservation:**
  - A run that does NOT result in new territory capture is still valid and must be saved to run history with its metrics.
- **Closed Loop Territory Claiming:**
  - Claiming new territory requires completing a valid closed loop (start and end points connecting).
- **Brief Cell Traversal Prohibition:**
  - Briefly entering or passing through a grid cell must NOT automatically grant cell ownership.
- **Duplicate Reward Prohibition:**
  - Previously owned cells by the same player cannot award duplicate territory points or area rewards.
- **Territory Contestation Requirement:**
  - Players must be able to contest, lose, and reclaim territory, though exact battle mechanics remain to be finalized.

---

## 2. Proposed Cell Occupation Mechanics [PROPOSED / OPEN]
- **50% Cell Progress Threshold:** [PROPOSED / OPEN until geometric definition is explicitly approved]
- **100% Occupation Threshold:** [PROPOSED / OPEN until geometric definition is explicitly approved]
- **Status:** The numerical thresholds (50% progress, 100% occupation) are proposed guidelines. The exact geometric interpretation (e.g., minimum path length through cell vs. polygon area coverage ratio) is open until explicitly approved.

---

## 3. Open & Undecided Gameplay Mechanics [OPEN]
The following game rules require explicit definition and user approval before implementation:

- **[OPEN] GPS Accuracy Limits:** Minimum required horizontal accuracy threshold (e.g., < 15m) for GPS points during loop evaluation.
- **[OPEN] Route Validation & Speed Limits:** Maximum allowed speed threshold to detect vehicle usage (e.g., speed > 25 km/h disqualifies run).
- **[OPEN] Overlapping & Nested Loops:** Rules for handling self-intersecting or multiple loops completed within a single run.
- **[OPEN] Grid Cell Dimensions:** Physical size and geometry of grid cells (e.g., 10m x 10m squares vs. H3 hexagons).
- **[OPEN] Territory Battle, Loss & Reclaim Mechanics:** Exact rules and algorithms for contesting, decaying, overwriting, or reclaiming territory owned by rival runners.
- **[OPEN] Anti-Cheat Detection:** Specific rules for identifying GPS spoofing, mock locations, or unrealistic coordinate jumps.
