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
                    child: const Icon(Icons.store, size: 18, color: Colors.grey),
                  ),
                ),
              ),
              const Spacer(),
              if (isWide) ...[
                const _NavLink(label: 'Home', route: '/'),
                const _NavLink(label: 'About', route: '/about'),
                const _NavLink(label: 'Collections', route: '/collections'),
                const _NavLink(label: 'Sale', route: '/sale'),
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

class _NavLink extends StatelessWidget {
  final String label;
  final String route;
  const _NavLink({required this.label, required this.route});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (route == '/') {
          Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
        } else {
          Navigator.pushNamed(context, route);
        }
      },
      child: Text(
        label.toUpperCase(),
        style: const TextStyle(color: Colors.black87, letterSpacing: 0.5),
      ),
    );
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
              title: const Text('Collections'),
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
