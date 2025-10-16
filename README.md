 Flutter Fitness App (MVVM Architecture)

This project is built using **Flutter**, following the **MVVM (Model-View-ViewModel)** architecture pattern for clean code organization, maintainability, and scalability.

---

##  Dependencies Used & Why

| Dependency | Version | Purpose |
|-------------|----------|----------|
| **table_calendar** | ^3.2.0 | For displaying interactive and customizable calendar views. |
| **google_fonts** | ^6.3.2 | To use custom Google Fonts throughout the app for better UI styling. |
| **flutter_animate** | ^4.5.2 | To add smooth and beautiful animations easily. |
| **provider** | ^6.1.5+1 | For efficient state management using MVVM architecture. |
| **flutter_screenutil** | ^5.9.3 | For responsive UI across different screen sizes and devices. |
| **intl** | ^0.20.1 | To handle date/time formatting and localization. |
| **flutter_svg** | ^2.2.1 | To render SVG (vector) images and icons. |
| **fl_chart** | ^0.68.0 | To create dynamic and beautiful charts for insights and analytics. |

---

##  Project Structure (MVVM Architecture)
```bash
lib/
│
├── core/
│ ├── constants/
│ │ └── appColors.dart
│ │
│ └── widgets/
│ ├── bottom_nav_bar.dart
│ ├── calender_bottom_sheet.dart
│ ├── custom_text.dart
│ ├── date_selector.dart
│ ├── draggable_workout.dart
│ ├── footer.dart
│ ├── hydration_card.dart
│ ├── insight_card.dart
│ ├── plan_workout_card.dart
│ ├── week_header.dart
│ ├── week_list.dart
│ └── workout_card.dart
│
├── features/
│ ├── bottom_nav_bar/
│ │ ├── model/
│ │ ├── view/
│ │ └── view_model/
│ │
│ ├── home/
│ │ ├── model/
│ │ ├── view/
│ │ └── view_model/
│ │
│ ├── mood/
│ │ ├── model/
│ │ ├── view/
│ │ └── view_model/
│ │
│ ├── plan/
│ │ ├── model/
│ │ ├── view/
│ │ └── view_model/
│ │
│ └── profile/
│ ├── model/
│ ├── view/
│ └── view_model/
│
└── main.dart
```

---

##  Folder Explanation

### **core/**
Contains essential reusable components and constants shared across the app.

- **constants/** — Defines app-wide constants such as color schemes (`appColors.dart`).
- **widgets/** — Contains reusable custom widgets like cards, bottom sheets, headers, and buttons to keep the UI consistent and modular.

### **features/**
Each feature follows the **MVVM** structure:
- **model/** — Data classes and models that define the structure of the feature’s data.
- **view/** — The UI files (screens and widgets).
- **view_model/** — The logic layer that connects the UI with the data (uses `Provider` for state management).

Features include:
- **bottom_nav_bar** — Navigation logic and UI for switching between main sections.
- **home** — Displays dashboard, workouts, and summary.
- **mood** — Tracks user’s mood and emotional state.
- **plan** — Handles workout or training plans.
- **profile** — Manages user profile, preferences, and settings.

### **main.dart**
The entry point of the application. Initializes providers, themes, and routes.

---

##  App Video
https://drive.google.com/file/d/1PtnNpoucBPDhV4QeeEkRzKg3HHhtqzoL/view?usp=drive_link

---

##  App Screenshots
https://github.com/saqibnawaz4u/Health_app/tree/main/screenshots
---

##  App APK
https://github.com/saqibnawaz4u/Health_app/releases/tag/health_app



