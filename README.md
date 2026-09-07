# 1Fi — Flutter Assignment

A pixel-accurate Flutter scaffolding for the **1Fi** mobile application — a mutual-fund-backed, 0% interest EMI shopping platform.

---

## What is 1Fi?

1Fi is a fintech product that lets users shop at partner brands on **no-cost EMI**, backed by their existing mutual fund investments. There's no credit score check, no hidden charges, and no paperwork — the user's portfolio acts as collateral, and a lien is created seamlessly against their holdings.

This app is the mobile front-end that lets users:

- Browse and activate a 1Fi credit limit backed by mutual funds
- Shop at top partner brands (Apple, Samsung, Air India, and more) using 0% EMI
- Choose an EMI tenure, confirm financing, and track their dues

---

## Why it's built

This project was built as a **SDE Intern Assignment** to demonstrate:

- Clean app architecture using feature-based folder structure
- Scalable state management with `provider`
- Reusable widget composition with a shared design system
- Realistic UI that mirrors the actual 1Fi product experience

---

## Screens

| Screen | Description |
|---|---|
| **Home** | Hero banner, active offers carousel, top brand list, benefit cards |
| **Shop** | Segmented tab bar — Top Brands, Nearby Stores, and 1Fi Marketplace |
| **1Fi Marketplace** | Live product search with debounce, category filter chips, product cards, product detail modal with variant selector and EMI plan picker, checkout confirmation |
| **EMI Dues** | Active loan summary with next due date and NACH auto-debit status |
| **Limit** | Credit limit card with utilization progress bar and pledged portfolio breakdown |
| **Profile** | User profile header and account settings |

---

## Architecture

```
lib/
├── core/
│   ├── constants/     # AppColors, AppTypography, AppSpacing, AppDecorations
│   └── theme/         # AppTheme (Material 3)
├── models/            # Plain Dart data classes (ProductModel, EmiPlanModel, …)
├── providers/         # ChangeNotifier state (MarketplaceProvider, NavigationProvider)
├── repositories/      # Static data sources (BrandRepository, OfferRepository)
├── screens/           # One file per route
│   └── marketplace/   # Sub-views co-located with their screen
├── services/          # Async data layer (MarketplaceService)
└── widgets/
    ├── common/        # Shared across features (BaseHeroBanner, SectionHeader, …)
    ├── home/          # Home-specific widgets
    ├── shop/          # Shop-specific widgets
    └── marketplace/   # Marketplace-specific widgets
```

**State management:** Provider  
**Navigation:** `IndexedStack` with a custom `FloatingBottomNavBar`  
**Data:** In-memory mock data via `MarketplaceService`; ready to swap with a real HTTP client via constructor injection

---

## Key engineering decisions

- **`BaseHeroBanner`** — A single parameterised base widget that both `HomeHeroBanner` and `ShopHeroBanner` extend, avoiding layout duplication.
- **Search debounce** — `setSearchQuery` waits 300 ms before triggering a fetch, preventing rapid-fire calls on every keystroke.
- **Race-condition guard** — `fetchProducts` uses a `_currentFetchId` counter so stale responses from abandoned fetches are silently discarded.
- **Constructor injection** — `MarketplaceProvider` accepts an optional `MarketplaceService` parameter, making the data layer swappable and testable.
- **`ColorUtils.fromHex()`** — A runtime hex parser (`'#2DBE76'`) for non-const colour usages, alongside a fully token-based `AppColors` design system.
- **Responsive layouts** — `LayoutBuilder` breakpoints at 600 dp switch product and brand lists to a 2-column grid on tablets and landscape phones.

---

## Getting started

**Requirements:** Flutter ≥ 3.13 · Dart ≥ 3.0

```bash
# Install dependencies
flutter pub get

# Run on a connected device or simulator
flutter run
```

---

## Dependencies

| Package | Purpose |
|---|---|
| [`provider`](https://pub.dev/packages/provider) `^6.1.2` | State management |
| [`flutter_lints`](https://pub.dev/packages/flutter_lints) `^6.0.0` | Static analysis |
