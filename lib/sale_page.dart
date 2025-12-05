import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';

class SalePage extends StatelessWidget {
  const SalePage({super.key});

  @override
  Widget build(BuildContext context) {
    final titles = [
      'A5 Notepad',
      'Classic Sweatshirts - Neutral',
      'Recycled Notebook',
      'Iphone 5/6 Charge & Sync Cable',
      'Type C Charge % Sync Cable',
      'USB to USB Charge & Sync Cables',
    ];

    final saleProducts = List.generate(
      6,
      (i) => _SaleProduct(
        title: titles[i],
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
                  // Non-functional filter/sort + count between dividers
                  const SizedBox(height: 8),
                  const Divider(color: Color(0xFFE5E7EB)),
                  const SizedBox(height: 8),
                  _FilterControl(count: saleProducts.length),
                  const SizedBox(height: 8),
                  const Divider(color: Color(0xFFE5E7EB)),
                  const SizedBox(height: 12),
                  const SizedBox(height: 12),
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaInfo.isWide(context) ? 900 : 600,
                      ),
                      child: GridView.builder(
                        itemCount: saleProducts.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: MediaInfo.isWide(context) ? 3 : 2,
                          crossAxisSpacing: 14,
                          mainAxisSpacing: 14,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) =>
                            _SaleCard(data: saleProducts[index]),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Non-functional pagination arrows
                  const Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _PageArrowButton(icon: Icons.arrow_left),
                        SizedBox(width: 12),
                        Text('Page 1 of 1', style: TextStyle(color: Colors.black54)),
                        SizedBox(width: 12),
                        _PageArrowButton(icon: Icons.arrow_right),
                      ],
                    ),
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
                  if (data.title == 'A5 Notepad') ...[
                    const Text(
                      'Sold Out',
                      style:
                          TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '£${data.original.toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ] else ...[
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

class _PageArrowButton extends StatelessWidget {
  final IconData icon;
  const _PageArrowButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Pagination is not implemented yet.')),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE5E7EB)),
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color(0x11000000),
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Icon(icon, size: 20, color: Colors.black87),
          ),
        ),
      ),
    );
  }
}

class _FilterControl extends StatefulWidget {
  final int count;
  const _FilterControl({required this.count});

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

  String sortCurrent = 'Featured';
  static const sortOptions = [
    'Featured',
    'Best Selling',
    'Alphabetically, A-Z',
    'Alphabetically, Z-A',
    'Price, low to high',
    'Price, high to low',
    'Date, old to new',
    'Date, new to old',
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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(current, style: const TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_drop_down, size: 18),
              ],
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            'Sort By:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          PopupMenuButton<String>(
            initialValue: sortCurrent,
            onSelected: (val) => setState(() => sortCurrent = val),
            itemBuilder: (context) => sortOptions
                .map((o) => PopupMenuItem<String>(value: o, child: Text(o)))
                .toList(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(sortCurrent, style: const TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_drop_down, size: 18),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Text(
            '${widget.count} Products',
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
