# TERRARUN — AI Agent & Developer Guide

This document defines the mandatory rules, standards, and workflow instructions for AI agents and human developers contributing to TERRARUN.

---

## 1. Core Principles & Strict Boundaries
- **No Unapproved Feature Implementation:** Do not write code for features outside the currently approved milestone.
- **Require Approval for OPEN Decisions:** Always seek explicit user approval before implementing any item marked as PROPOSED or OPEN in `DECISIONS.md`, `GAME_RULES.md`, or `PROJECT_SPEC.md`.
- **Preserve Package Identifiers:** Do NOT modify `namespace` or `applicationId` (`com.vybronx.terrarun.terrarun_app`) without explicit user instruction.
- **No Secrets in Source or Docs:** Never insert API keys, secret tokens, service-role keys, or signing key credentials into client source code, configuration files, or documentation.
- **Documentation Boundaries:** Maintain documentation in `Docs/` as a reflection of verified project facts. Do not claim work is completed or tested without verification.

---

## 2. File & Directory Conventions
- `lib/src/presentation/`: Flutter screens, widgets, design system components, and state management.
- `lib/src/domain/`: Entities, repository interfaces, use cases, loop detection math, and pure business logic.
- `lib/src/data/`: Data models, repository implementations, local storage datasources, and Supabase client code.
- `Docs/`: Project specification, architecture, milestone tracking, decisions, and gameplay rules.

---

## 3. Documentation Protocol
When performing development tasks:
1. Inspect `Docs/CURRENT_STATE.md` and `Docs/MILESTONES.md` before starting work.
2. Record all newly confirmed architectural decisions in `Docs/DECISIONS.md`.
3. Document any newly identified bugs in `Docs/BUG_LOG.md`.
4. Update status in `Docs/CURRENT_STATE.md` and `Docs/MILESTONES.md` **only after work is implemented and verified**.

---

## 4. Git & Security Guardrails
- Always run `git status` to verify modified, staged, and untracked files.
- Verify `.gitignore` excludes sensitive local configuration (`.env`, `key.properties`, `*.keystore`, `local.properties`).
- Do NOT stage, commit, push, create a remote GitHub repository, or publish release builds without explicit user confirmation and a verified security review.
