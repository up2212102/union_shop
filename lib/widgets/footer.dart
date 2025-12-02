import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Wrap(
            spacing: 32,
            runSpacing: 12,
            children: [
              _FooterSection(
                title: 'SHOP',
                items: ['Collections', 'Sale', 'New In'],
              ),
              _FooterSection(
                title: 'HELP',
                items: ['Contact', 'Delivery', 'Returns'],
              ),
              _FooterSection(
                title: 'LEGAL',
                items: ['Privacy', 'Terms'],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Divider(color: Colors.grey[300]),
          const SizedBox(height: 8),
          Text(
            '© ${DateTime.now().year} Union Shop — Dummy footer for coursework',
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _FooterSection extends StatelessWidget {
  final String title;
  final List<String> items;
  const _FooterSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          ...items.map((i) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(i, style: const TextStyle(color: Colors.grey)),
              )),
        ],
      ),
    );
  }
}
