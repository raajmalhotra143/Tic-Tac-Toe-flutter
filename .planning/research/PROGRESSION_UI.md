# Progression & UI: 2025-2026 Trends

**Domain:** UX Design / Mobile Gaming
**Researched:** 2025-05-24

## 1. Visual Aesthetics: "Liquid Glass" & "Functional Glow"

The 2025-2026 trend is moving away from flat design toward tactile, translucent interfaces.

### Core Visual Principles:
- **Layered Darkness:** Backgrounds are deep charcoal (`#121212`) or midnight navy (`#1A1A2E`). This prevents OLED "halation" and allows for shadow depth.
- **Liquid Glass:** HUD panels use frosted, translucent layers with a "glassy" blur. 
  - *Flutter implementation:* Use `BackdropFilter` with `ImageFiltered` for high-quality blur.
- **Functional Glow:** Neon colors (Cyber Pink, Electric Mint) are desaturated by default. They only "vibrate" (reach 100% saturation) when a player interacts with them.
- **Subtle Texture:** Overlay a faint film grain or digital noise on the background to add a premium, tactile feel.

### Color Palette (2025-2026):
- **Primary:** `#FF2D55` (Cyber Pink)
- **Secondary:** `#00FFA3` (Electric Mint)
- **Background:** `#0B0B0F` (Near Black)
- **Surface:** `rgba(255, 255, 255, 0.05)` (Frosted Glass)

## 2. Progression Systems: The 3-Star Mastery

Standard patterns for stage-based mobile games.

### Star Objectives for Tic-Tac-Toe:
1. **Star 1 (Completion):** Win the match.
2. **Star 2 (Efficiency):** Win in under 5 moves (or a specific move count).
3. **Star 3 (Speed):** Win within 10 seconds.

### Progression Mechanics:
- **Star Gating:** Require 30 total stars to unlock "Chapter 2: The Neon Abyss."
- **Cumulative Rewards:** "Star Chests" at 10, 25, and 50 stars containing board skins or emotes.
- **Dynamic Difficulty:** As the player progresses through stages (1-100), the AI's "Search Depth" increases from 1 (Easy) to 9 (Impossible).

## 3. UI Micro-Interactions

- **Button Ripples:** Use haptic-synced "neon pulses" that radiate from the tap point.
- **Liquid Morphing:** When transitioning between screens, UI panels should "melt" or "morph" into each other rather than simple sliding.
- **Ambient Feedback:** The entire background neon glow should subtly shift color based on who has the advantage (calculated by the Minimax score).

## Implementation Tips for Flutter

- **Custom Shaders:** For the "glowing" effect on the board, consider using custom fragment shaders (`.frag` files) to achieve performant neon bloom.
- **Google Fonts:** Use `Orbitron` or `Rajdhani` for a sleek, futuristic typography feel.
- **Animations:** Use the `rive` package for high-quality interactive neon icons (e.g., an animated "X" that pulses when placed).

## Sources
- Behance: "2026 UI Design Trends".
- LevelDesignPatterns.com: "The 3-Star System".
- Medium: "Designing for OLED Screens in 2025".
