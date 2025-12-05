import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool _showSearch = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 900;
    return Column(
      children: [
        // Top banner
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          color: const Color(0xFF4d2963),
          child: const Text(
            'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: 64,
          child: Row(
            children: [
              // Logo
              GestureDetector(
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false),
                child: Image.network(
                  'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                  height: 28,
                  errorBuilder: (context, error, stack) => Container(
                    width: 28,
                    height: 28,
                    color: Colors.grey[300],
                    child:
                        const Icon(Icons.store, size: 18, color: Colors.grey),
                  ),
                ),
              ),
              // Centered nav links
              Expanded(
                child: isWide
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _NavLink(label: 'Home', route: '/'),
                          _NavLink(label: 'About', route: '/about'),
                          _NavLink(label: 'Shop', route: '/collections'),
                          _NavLink(label: 'Sale', route: '/sale'),
                          _NavLink(label: 'The Print Shack', route: '/print'),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
              // Right-side controls: icons on wide screens, menu on mobile
              if (isWide) ...[
                Row(
                  children: [
                    // Search input slides out to the left of the icon
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      width: _showSearch ? 220 : 0,
                      height: 36,
                      margin: EdgeInsets.only(right: _showSearch ? 8 : 0),
                      child: _showSearch
                          ? TextField(
                              controller: _searchController,
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText: 'Search products…',
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey[300]!,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFF4d2963),
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                suffixIcon: IconButton(
                                  tooltip: 'Close',
                                  icon: const Icon(Icons.close, size: 18),
                                  onPressed: () {
                                    setState(() => _showSearch = false);
                                  },
                                ),
                              ),
                              onSubmitted: (q) {
                                // Placeholder: route to collections with query snack
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Searching for "$q"')),
                                );
                              },
                            )
                          : const SizedBox.shrink(),
                    ),
                    IconButton(
                      tooltip: _showSearch ? 'Hide search' : 'Search',
                      icon: const Icon(Icons.search, color: Colors.grey),
                      onPressed: () {
                        setState(() => _showSearch = !_showSearch);
                      },
                    ),
                    IconButton(
                      tooltip: 'Cart',
                      icon: const Icon(Icons.shopping_cart_outlined, color: Colors.grey),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Cart is empty')),
                        );
                      },
                    ),
                    IconButton(
                      tooltip: 'Account',
                      icon: const Icon(Icons.person_outline, color: Colors.grey),
                      onPressed: () {
                        Navigator.pushNamed(context, '/auth');
                      },
                    ),
                  ],
                ),
              ] else ...[
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu, color: Colors.grey),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                )
              ]
            ],
          ),
        ),
        // Separator line under the navbar
        Divider(height: 1, thickness: 1, color: Colors.grey[300]),
      ],
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final String route;
  const _NavLink({required this.label, required this.route});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final text = widget.label.toUpperCase();
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final isActive = _isRouteActive(currentRoute, widget.route);
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: TextButton(
        onPressed: () {
          try {
            if (widget.route == '/') {
              Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
            } else {
              Navigator.pushNamed(context, widget.route);
            }
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Route ${widget.route} not available')),
            );
          }
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black87,
            letterSpacing: 0.5,
            decoration: (_hovering || isActive)
                ? TextDecoration.underline
                : TextDecoration.none,
          ),
        ),
      ),
    );
  }

  bool _isRouteActive(String? current, String target) {
    if (current == null) return target == '/';
    if (target == '/') {
      return current == '/' || current.isEmpty;
    }
    return current == target;
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Home'),
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/', (route) => false),
            ),
            ListTile(
              title: const Text('About'),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            ListTile(
              title: const Text('Shop'),
              onTap: () => Navigator.pushNamed(context, '/collections'),
            ),
            ListTile(
              title: const Text('Sale'),
              onTap: () => Navigator.pushNamed(context, '/sale'),
            ),
            ListTile(
              title: const Text('The Print Shack'),
              onTap: () {
                try {
                  Navigator.pushNamed(context, '/print');
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Print Shack route not available')),
                  );
                }
              },
            ),
            ListTile(
              title: const Text('Account'),
              onTap: () => Navigator.pushNamed(context, '/auth'),
            ),
          ],
        ),
      ),
    );
  }
}
