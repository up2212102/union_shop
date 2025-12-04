import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';

class SalePage extends StatelessWidget {
  const SalePage({super.key});

  @override
  Widget build(BuildContext context) {
    final saleProducts = List.generate(
      6,
      (i) => _SaleProduct(
        title: 'Sale Item ${i + 1}',
        original: 25 + i * 5,
        discounted: 15 + i * 4,
        imageUrl: 'https://picsum.photos/seed/sale$i/600/400',
      ),
    );

    return Scaffold(
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Navbar(),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'SALE',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Don’t miss out! Get yours before they’re all gone!\n\nAll prices shown are inclusive of the discount 🛒",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  // Non-functional filter dropdown
                  const _FilterControl(),
                  const SizedBox(height: 12),
                  GridView.builder(
                    itemCount: saleProducts.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaInfo.isWide(context) ? 3 : 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.72,
                    ),
                    itemBuilder: (context, index) =>
                        _SaleCard(data: saleProducts[index]),
                  ),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class MediaInfo {
  static bool isWide(BuildContext context) =>
      MediaQuery.of(context).size.width > 900;
}

class _SaleProduct {
  final String title;
  final double original;
  final double discounted;
  final String imageUrl;
  const _SaleProduct(
      {required this.title,
      required this.original,
      required this.discounted,
      required this.imageUrl});
}

class _SaleCard extends StatelessWidget {
  final _SaleProduct data;
  const _SaleCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/product'),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  data.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) => Container(color: Colors.grey[300]),
                ),
              ),
              const SizedBox(height: 8),
              Text(data.title, style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text('£${data.discounted.toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 8),
                  Text(
                    '£${data.original.toStringAsFixed(2)}',
                    style: const TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              color: Colors.red,
              child: const Text('SALE',
                  style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
          )
        ],
      ),
    );
  }
}

class _FilterControl extends StatefulWidget {
  const _FilterControl();

  @override
  State<_FilterControl> createState() => _FilterControlState();
}

class _FilterControlState extends State<_FilterControl> {
  String current = 'All Products';
  static const options = [
    'All Products',
    'Clothing',
    'Merchandise',
    'PSUT',
  ];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        runSpacing: 8,
        children: [
          const Text(
            'Filter By:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          PopupMenuButton<String>(
            initialValue: current,
            onSelected: (val) => setState(() => current = val),
            itemBuilder: (context) => options
                .map((o) => PopupMenuItem<String>(value: o, child: Text(o)))
                .toList(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFE5E7EB)),
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(current),
                  const SizedBox(width: 6),
                  const Icon(Icons.arrow_drop_down, size: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
