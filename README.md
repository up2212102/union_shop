# Union Shop

Union Shop is a multi-platform Flutter app (web, Android, iOS, macOS, Windows, Linux) that showcases a student union shop experience: browsing collections, viewing sale items, checking product details, personalising items via The Print Shack, and a simple static cart flow.

## Features
- Home with hero carousel and curated product sections
- Collections overview and individual collection pages with filters and pagination
- Sale page with consistent layout and product cards
- Product detail page: image gallery, colour/size/quantity selectors, Add to Cart, social actions
- The Print Shack page: personalisation options (lines or logo), dynamic inputs, quantity control
- Static Cart page: title, empty state message, return to home
- Global Navbar: logo, centered links (Home, About, Shop, Sale, The Print Shack), search reveal, cart, account
- Drawer for mobile navigation and footer across pages

## Installation and Setup

### Prerequisites
- Windows, macOS, or Linux
- Flutter SDK installed and configured
- Dart SDK (bundled with Flutter)
- A recent version of VS Code or Android Studio (optional)

Verify Flutter:

```powershell
flutter --version
```

### Clone the repository

```powershell
git clone https://github.com/up2212102/union_shop.git
cd union_shop
```

### Get dependencies

```powershell
flutter pub get
```

### Run the project

- Web:

```powershell
flutter run -d chrome
```

- Windows (desktop):

```powershell
flutter run -d windows
```

- Android/iOS: set up emulators or devices, then:

```powershell
flutter devices
flutter run -d <device_id>
```

## Usage

- Navigation:
	- Top navbar links: `Home`, `About`, `Shop` (collections), `Sale`, `The Print Shack`.
	- Cart icon opens the static Cart page.
	- Mobile uses a drawer with the same links.

- Home:
	- Hero carousel with dynamic slides and a CTA.
	- Essential and Signature sections with product cards.

- Collections and Sale:
	- Consistent grid layout, filter/sort placeholders, and pagination controls.

- Product Page:
	- Left: image with clickable thumbnails.
	- Right: dropdowns for colour and size, numeric quantity control, Add to Cart, "Buy with Shop" (placeholder), social buttons.

- The Print Shack:
	- Choose a personalisation option: one to four lines of text, or small/large logo.
	- Dynamic inputs appear for additional lines.
	- Suggested per-line character limit applied to inputs.
	- Add to Cart validates text options.

- Cart:
	- Static page with "Your Cart" and "Your cart is currently empty" plus a "CONTINUE SHOPPING" button to return home.

### Tests
Run Flutter unit/widget tests (if present):

```powershell
flutter test
```

## Project Structure

```
lib/
	main.dart                # App entry, routes, home screen & hero carousel
	product_page.dart        # Product detail view with selectors and actions
	print_page.dart          # The Print Shack personalisation page (dynamic inputs)
	cart_page.dart           # Static cart page (empty state)
	collections_page.dart    # Collections overview grid
	collection_page.dart     # Single collection with pagination
	sale_page.dart           # Sale listing with consistent UI
	widgets/
		navbar.dart            # Global navigation bar (links, search, cart, account)
		footer.dart            # Footer component
```

Other platform folders (android/, ios/, web/, windows/, macos/, linux/) are the standard Flutter platform targets and config.

## Technologies
- Flutter (Material)
- Dart
- VS Code / Android Studio (development)

## Notes
- Some controls (filter/sort, add-to-cart backend, sharing) are placeholders and can be wired to real services later.
- Image assets currently use picsum placeholders or example URLs.

## Contact
- GITHUB USER: `up2212102`
- Email: `up2212102@myport.ac.uk`
- Repository: https://github.com/up2212102/union_shop

