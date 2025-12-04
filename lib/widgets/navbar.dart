import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

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
            'WELCOME TO THE UNION SHOP',
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
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
              // Right-side control (Account or menu)
              if (isWide) ...[
                const _NavLink(label: 'Account', route: '/auth'),
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
          if (widget.route == '/') {
            Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
          } else {
            Navigator.pushNamed(context, widget.route);
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
              title: const Text('Account'),
              onTap: () => Navigator.pushNamed(context, '/auth'),
            ),
          ],
        ),
      ),
    );
  }
}
