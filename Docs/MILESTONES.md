# TERRARUN — Project Milestones & Roadmap

This document defines the complete 14-stage proposed development roadmap (M0–M13) for TERRARUN.

---

## M0: Project Foundation & Documentation
- **Objective:** Establish repository structure, project documentation, strict boundaries, security rules, and initial Git readiness.
- **Scope:**
  - Codebase audit and `.gitignore` configuration.
  - Documentation creation and alignment in `Docs/`.
  - Definition of core gameplay rules and open decisions.
  - Pre-publication security review of project files, sensitive configuration, intended initial commit contents, and Git staging state prior to initial commit or public repository creation.
- **Dependencies:** None.
- **Acceptance Criteria:**
  - All 8 `Docs/*.md` files updated and aligned.
  - Pre-publication security review conducted for project files and `.gitignore`.
  - Preliminary file inspection shows no obvious hardcoded keys in checked files; full verification of all intended initial commit files required prior to public release.
  - Application package ID preserved (`com.vybronx.terrarun.terrarun_app`).
  - Milestone roadmap (M0–M13) fully defined.
  - Initial commit contents and Git staging state verified prior to remote repository creation.
- **Testing Requirements:** Repository structure and file inspection; pre-publication configuration review.
- **Status:** IN PROGRESS

---

## M1: Design System & App Navigation
- **Objective:** Build core UI design system, theme, app layout scaffold, and bottom navigation.
- **Scope:**
  - Material 3 theme, color scheme, typography, and dark/light mode support.
  - Navigation shell with bottom navigation bar.
  - Placeholder screens for Home, Map, Runs, Leaderboards, and Profile.
- **Dependencies:** M0.
- **Acceptance Criteria:**
  - Responsive app shell with working navigation between primary screens.
- **Testing Requirements:** Flutter widget tests for navigation and theme rendering.
- **Status:** NOT STARTED

---

## M2: Authentication & Player Profile
- **Objective:** Implement user authentication and player profile management.
- **Scope:**
  - Supabase Auth integration (email/password sign-up and login).
  - User profile data model, avatar display, display name editing, and preference settings.
  - Row Level Security (RLS) database policies for user profile data.
- **Dependencies:** M1.
- **Acceptance Criteria:**
  - Users can register, log in, view, and update their player profile.
  - Authentication state persists across app restarts.
- **Testing Requirements:** Integration tests for auth flow; unit tests for user profile repository.
- **Status:** NOT STARTED

---

## M3: Home Dashboard & Map UI
- **Objective:** Develop the main home dashboard and interactive map interface.
- **Scope:**
  - Interactive map view integration (selected map provider engine).
  - Current location centering, zoom controls, and tracking mode toggles.
  - Dashboard widgets displaying key player stats and recent activity summary.
- **Dependencies:** M2.
- **Acceptance Criteria:**
  - Map renders smoothly with real-time location indicator.
- **Testing Requirements:** Widget tests for dashboard UI; manual map interaction testing on Android.
- **Status:** NOT STARTED

---

## M4: GPS Run Tracking
- **Objective:** Implement real-time foreground and background GPS location tracking for runs.
- **Scope:**
  - Android location permissions handling (Foreground and Background Location).
  - Foreground service for continuous GPS recording during active runs.
  - Real-time run metrics calculation (distance, duration, current/average pace).
  - Live polyline rendering on map.
  - Local database storage for raw GPS track points (offline support).
- **Dependencies:** M3.
- **Acceptance Criteria:**
  - Reliable location recording during active runs, including when screen is off.
  - Distance, duration, and pace update accurately in real time.
- **Testing Requirements:** Unit tests for GPS metric calculations; field testing / simulated location playback on Android emulator.
- **Status:** NOT STARTED

---

## M5: Run Summary & History
- **Objective:** Build run completion summary, route map visualization, and historical run log.
- **Scope:**
  - Run summary screen displaying total distance, duration, pace, route map, and completed laps.
  - Saving runs locally and queuing for background sync.
  - Historical run list view with filtering and detailed route views.
  - Saving runs that produce no new territory capture.
- **Dependencies:** M4.
- **Acceptance Criteria:**
  - Completed runs saved to history and viewable with full route maps and stats.
  - Runs without territory capture are persisted correctly.
- **Testing Requirements:** Widget tests for summary UI; database persistence tests.
- **Status:** NOT STARTED

---

## M6: Grid System, Closed Loops & Territory Capture
- **Objective:** Implement geographic grid overlay, closed loop detection math, and territory capture logic.
- **Scope:**
  - Geographic grid segmentation overlay mapped to world coordinates.
  - Geometry algorithm to detect closed loops in recorded run polylines.
  - Grid cell progress and occupation evaluation algorithms.
  - Brief entry prohibition enforcement.
  - Territory claim creation and prevention of duplicate rewards for previously owned cells.
- **Dependencies:** M5.
- **Acceptance Criteria:**
  - Valid closed loops detect enclosed grid cells and evaluate territory capture.
  - Brief cell traversals do not award cell ownership.
- **Testing Requirements:** Unit tests for polygon loop detection and point-in-grid math.
- **Status:** NOT STARTED

---

## M7: Territory Battles, Loss & Reclaim
- **Objective:** Implement territory contestation, rival cell capture, loss notifications, and reclaim mechanics.
- **Scope:**
  - Logic for contesting cells currently owned by other runners.
  - Territory decay, overwrite, or battle mechanics (per approved rules).
  - Loss notifications and history of contested/lost territories.
  - Reclaiming previously lost territory through new running loops.
- **Dependencies:** M6.
- **Acceptance Criteria:**
  - Players can contest, capture, lose, and reclaim grid territory.
- **Testing Requirements:** Unit tests for territory contestation algorithms; backend state transition tests.
- **Status:** NOT STARTED

---

## M8: Friends & Friend Requests
- **Objective:** Implement social friend connections and request management.
- **Scope:**
  - Search players by username or display name.
  - Send, accept, decline, and cancel friend requests.
  - Friends list view with online status and profile summaries.
  - Row Level Security (RLS) policies for friend data privacy.
- **Dependencies:** M2.
- **Acceptance Criteria:**
  - Social friend requests operate end-to-end with proper privacy controls.
- **Testing Requirements:** Unit tests for friend repository; RLS permission checks.
- **Status:** NOT STARTED

---

## M9: Rivals & Competitions
- **Objective:** Implement rival tracking and head-to-head territorial competitions.
- **Scope:**
  - Automatic or manual designation of rival runners in overlapping areas.
  - Head-to-head competition challenges (e.g., most territory captured in 7 days).
  - Rival leaderboard and territory conflict map overlays.
- **Dependencies:** M7, M8.
- **Acceptance Criteria:**
  - Competitions track territory and run stats between rival players correctly.
- **Testing Requirements:** Unit and integration tests for competition rules and score tracking.
- **Status:** NOT STARTED

---

## M10: Global, State, City & Friends Leaderboards
- **Objective:** Implement multi-tier competitive leaderboards.
- **Scope:**
  - Global, State, City, and Friends leaderboard rankings.
  - Ranking metrics: Total Territory Owned, Total Run Distance, and Active Streak.
  - Pagination, search, and user rank positioning highlights.
- **Dependencies:** M6, M8.
- **Acceptance Criteria:**
  - Leaderboards accurately aggregate and rank players across all four geographic/social tiers.
- **Testing Requirements:** Database aggregation query performance tests; UI widget tests.
- **Status:** NOT STARTED

---

## M11: Dynamic Titles, Achievements & Progression
- **Objective:** Develop player progression system, earnable titles, and achievement badges.
- **Scope:**
  - Dynamic player titles (e.g., "District Explorer", "City Conqueror") unlocked based on territory and run milestones.
  - Achievement badge system with progress tracking.
  - Level/XP progression system displayed on user profile.
- **Dependencies:** M6, M10.
- **Acceptance Criteria:**
  - Achievements and titles unlock automatically when criteria are met.
- **Testing Requirements:** Unit tests for title and achievement evaluation engines.
- **Status:** NOT STARTED

---

## M12: UI Polish, Accessibility, Testing & Security
- **Objective:** Polish UI/UX, ensure accessibility compliance, complete automated testing, and conduct comprehensive application and backend security audit.
- **Scope:**
  - UI animation, map transition polish, and dark/light mode refinement.
  - Accessibility compliance (screen readers, contrast, touch targets).
  - GPS anti-cheat validation (mock location detection, speed thresholds).
  - Comprehensive application and backend security audit: Supabase secret and API key audit, Row Level Security (RLS) policies verification, and penetration testing.
  - Comprehensive unit, widget, and integration test suite execution.
- **Dependencies:** M1–M11.
- **Acceptance Criteria:**
  - Anti-cheat flags invalid runs; comprehensive application and backend security audit verified and passed; test coverage targets met.
- **Testing Requirements:** Full automated test suite execution; static security code analysis and backend RLS verification.
- **Status:** NOT STARTED

---

## M13: Play Store Release & Post-Launch Monitoring
- **Objective:** Prepare Google Play Store release assets, configure release signing, publish app, and monitor post-launch performance.
- **Scope:**
  - Release signing configuration (`key.properties` stored securely outside repo).
  - Google Play Console listing, screenshots, privacy policy, and store metadata.
  - Release build generation (Android App Bundle - AAB).
  - Crash analytics and performance monitoring integration.
  - Post-launch monitoring and patch support.
- **Dependencies:** M12.
- **Acceptance Criteria:**
  - App published successfully on Google Play Store with active crash monitoring.
- **Testing Requirements:** Release build verification on physical Android hardware.
- **Status:** NOT STARTED
