import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = List.generate(
      8,
      (i) => _Product(title: 'Product ${i + 1}', price: 10 + i * 3, imageUrl: 'https://picsum.photos/seed/p$i/600/400'),
    );

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Hoodies', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  const Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      _Dropdown(label: 'Sort by'),
                      _Dropdown(label: 'Size'),
                      _Dropdown(label: 'Colour'),
                      _FilterChip(label: 'In Stock'),
                      _FilterChip(label: 'New'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    itemCount: products.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width > 900
                          ? 4
                          : MediaQuery.of(context).size.width > 600
                              ? 3
                              : 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.72,
                    ),
                    itemBuilder: (context, index) => _ProductCard(product: products[index]),
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

class _Dropdown extends StatelessWidget {
  final String label;
  const _Dropdown({required this.label});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: label,
      items: [label, 'Option 1', 'Option 2']
          .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
          .toList(),
      onChanged: (_) {},
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  const _FilterChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: false,
      onSelected: (_) {},
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
