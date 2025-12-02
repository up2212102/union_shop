import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const collections = [
      _CollectionCardData(title: 'Hoodies', imageUrl: 'https://picsum.photos/seed/hoodies/600/400'),
      _CollectionCardData(title: 'T-Shirts', imageUrl: 'https://picsum.photos/seed/tshirts/600/400'),
      _CollectionCardData(title: 'Accessories', imageUrl: 'https://picsum.photos/seed/accessories/600/400'),
      _CollectionCardData(title: 'Stationery', imageUrl: 'https://picsum.photos/seed/stationery/600/400'),
    ];

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
                  const Text(
                    'Collections',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    itemCount: collections.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.2,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final c = collections[index];
                      return _CollectionCard(data: c);
                    },
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

class _CollectionCardData {
  final String title;
  final String imageUrl;
  const _CollectionCardData({required this.title, required this.imageUrl});
}

class _CollectionCard extends StatelessWidget {
  final _CollectionCardData data;
  const _CollectionCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/collection'),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              data.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => Container(color: Colors.grey[300]),
            ),
            Container(color: Colors.black.withOpacity(0.35)),
            Center(
              child: Text(
                data.title,
                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
