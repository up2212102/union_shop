import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  int currentPage = 1;
  static const int itemsPerPage = 9;

  @override
  Widget build(BuildContext context) {
    final products = List.generate(
      10,
      (i) => _Product(title: 'Product ${i + 1}', price: 10 + i * 3, imageUrl: 'https://picsum.photos/seed/p$i/600/400'),
    );
    final totalPages = (products.length / itemsPerPage).ceil();
    final start = (currentPage - 1) * itemsPerPage;
    final end = (start + itemsPerPage) > products.length ? products.length : (start + itemsPerPage);
    final visibleProducts = products.sublist(start, end);

    return Scaffold(
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Navbar(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Collection',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Divider(color: Color(0xFFE5E7EB)),
                  const SizedBox(height: 8),
                  _FilterControl(count: products.length),
                  const SizedBox(height: 8),
                  const Divider(color: Color(0xFFE5E7EB)),
                  const SizedBox(height: 12),
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaInfo.isWide(context) ? 900 : 600,
                      ),
                      child: GridView.builder(
                        itemCount: visibleProducts.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: MediaInfo.isWide(context) ? 3 : 2,
                          crossAxisSpacing: 14,
                          mainAxisSpacing: 14,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) =>
                            _ProductCard(product: visibleProducts[index]),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _PageArrowButton(
                          icon: Icons.arrow_left,
                          onTap: currentPage > 1
                              ? () => setState(() => currentPage--)
                              : null,
                        ),
                        const SizedBox(width: 12),
                        Text('Page $currentPage of $totalPages',
                            style: const TextStyle(color: Colors.black54)),
                        const SizedBox(width: 12),
                        _PageArrowButton(
                          icon: Icons.arrow_right,
                          onTap: currentPage < totalPages
                              ? () => setState(() => currentPage++)
                              : null,
                        ),
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

class _Product {
  final String title;
  final double price;
  final String imageUrl;
  const _Product({required this.title, required this.price, required this.imageUrl});
}

class _ProductCard extends StatelessWidget {
  final _Product product;
  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/product'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => Container(color: Colors.grey[300]),
            ),
          ),
          const SizedBox(height: 8),
          Text(product.title, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 4),
          Text('£${product.price.toStringAsFixed(2)}', style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class MediaInfo {
  static bool isWide(BuildContext context) =>
      MediaQuery.of(context).size.width > 900;
}

class _PageArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const _PageArrowButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final disabled = onTap == null;
    return Opacity(
      opacity: disabled ? 0.5 : 1,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: onTap,
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
