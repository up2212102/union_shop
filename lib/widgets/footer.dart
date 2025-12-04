import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 800;
              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: isWide
                      ? const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 3, child: _OpeningHours()),
                            SizedBox(width: 8),
                            Expanded(flex: 2, child: _HelpInfo()),
                            SizedBox(width: 8),
                            Expanded(flex: 3, child: _SubscribeBox()),
                          ],
                        )
                      : const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _OpeningHours(),
                            SizedBox(height: 24),
                            _HelpInfo(),
                            SizedBox(height: 24),
                            _SubscribeBox(),
                          ],
                        ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          Divider(color: Colors.grey[300]),
          const SizedBox(height: 8),
          // Social icons row
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Tooltip(
                  message: 'Facebook',
                  child: InkWell(
                    onTap: () async {
                      final uri =
                          Uri.parse('https://www.facebook.com/portsmouthsu');
                      await launchUrl(uri,
                          mode: LaunchMode.externalApplication);
                    },
                    child: const _SocialIcon(icon: Icons.image),
                  ),
                ),
                const SizedBox(width: 12),
                Tooltip(
                  message: 'Twitter',
                  child: InkWell(
                    onTap: () async {
                      final uri = Uri.parse('https://twitter.com/upsu_shop');
                      await launchUrl(uri,
                          mode: LaunchMode.externalApplication);
                    },
                    child: const _SocialIcon(icon: Icons.image),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '© 2025, ',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                      (route) => false,
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'upsu-store',
                    style: TextStyle(
                      color: Color(0xFF4d2963),
                      fontSize: 12,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  '•',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(width: 12),
                TextButton(
                  onPressed: () async {
                    final uri = Uri.parse(
                        'https://www.shopify.com/uk?utm_campaign=poweredby&utm_medium=shopify&utm_source=onlinestore');
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Powered by Shopify',
                    style: TextStyle(
                      color: Color(0xFF4d2963),
                      fontSize: 12,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OpeningHours extends StatelessWidget {
  const _OpeningHours();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Opening Hours',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 14),
        Text('❄️ Winter Break Closure Dates ❄️',
            style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text('Closing 4pm 19/12/2025',
            style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text('Reopening 10am 05/01/2026',
            style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text('Last post date: 12pm on 18/12/2025',
            style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text('------------------------',
            style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text('(Term Time)', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text('Monday - Friday 10am - 4pm',
            style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text('(Outside of Term Time / Consolidation Weeks)',
            style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text('Monday - Friday 10am - 3pm',
            style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text('Purchase online 24/7',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _SubscribeBox extends StatefulWidget {
  const _SubscribeBox();

  @override
  State<_SubscribeBox> createState() => _SubscribeBoxState();
}

class _SubscribeBoxState extends State<_SubscribeBox> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Latest Offers',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE5E7EB)),
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.hardEdge,
          child: Row(
            children: [
              Expanded(
                flex: 10,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Email address',
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: TextButton(
                  onPressed: () {
                    final email = _controller.text.trim();
                    if (email.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please enter an email address')),
                      );
                      return;
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Subscribed: $email')),
                    );
                    _controller.clear();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF4d2963),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    minimumSize: const Size(140, 40),
                  ),
                  child: const Text('Subscribe'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  const _SocialIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 14,
          color: const Color(0xFF4d2963),
        ),
      ),
    );
  }
}

class _HelpInfo extends StatelessWidget {
  const _HelpInfo();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Help and Information',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 14),
        Text('Search'),
        SizedBox(height: 10),
        Text('Terms & Conditions of Sale'),
        SizedBox(height: 10),
        Text('Policy'),
      ],
    );
  }
}
