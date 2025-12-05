import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const collections = [
      _CollectionCardData(title: 'Autumn Favorites', imageUrl: 'https://picsum.photos/seed/freshers/600/400'),
      _CollectionCardData(title: 'Societies', imageUrl: 'https://picsum.photos/seed/societies/600/400'),
      _CollectionCardData(title: 'Sportswear', imageUrl: 'https://picsum.photos/seed/sportswear/600/400'),
      _CollectionCardData(title: 'Graduation', imageUrl: 'https://picsum.photos/seed/graduation/600/400'),
      _CollectionCardData(title: 'Sale', imageUrl: 'https://picsum.photos/seed/sale/600/400'),
      _CollectionCardData(title: 'Essentials', imageUrl: 'https://picsum.photos/seed/essentials/600/400'),
      _CollectionCardData(title: 'Print Shack', imageUrl: 'https://picsum.photos/seed/printshack/600/400'),
      _CollectionCardData(title: "Domino's Deals", imageUrl: 'https://picsum.photos/seed/dominos/600/400'),
      _CollectionCardData(title: 'Accommodation', imageUrl: 'https://picsum.photos/seed/accommodation/600/400'),
      _CollectionCardData(title: 'Study', imageUrl: 'https://picsum.photos/seed/study/600/400'),
      _CollectionCardData(title: 'Tech', imageUrl: 'https://picsum.photos/seed/tech/600/400'),
      _CollectionCardData(title: 'Merch', imageUrl: 'https://picsum.photos/seed/merch/600/400'),
      _CollectionCardData(title: 'Eco', imageUrl: 'https://picsum.photos/seed/eco/600/400'),
      _CollectionCardData(title: 'Winter', imageUrl: 'https://picsum.photos/seed/winter/600/400'),
      _CollectionCardData(title: 'Summer', imageUrl: 'https://picsum.photos/seed/summer/600/400'),
      _CollectionCardData(title: 'New In', imageUrl: 'https://picsum.photos/seed/newin/600/400'),
      _CollectionCardData(title: 'Best Sellers', imageUrl: 'https://picsum.photos/seed/bestsellers/600/400'),
      _CollectionCardData(title: 'Clearance', imageUrl: 'https://picsum.photos/seed/clearance/600/400'),
      _CollectionCardData(title: 'Limited Edition', imageUrl: 'https://picsum.photos/seed/limited/600/400'),
      _CollectionCardData(title: 'Campus Life', imageUrl: 'https://picsum.photos/seed/campus/600/400'),
      _CollectionCardData(title: 'Portsmouth City', imageUrl: 'https://picsum.photos/seed/portsmouth/600/400'),
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
                  const Center(
                    child: Text(
                      'Collections',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width > 1200
                            ? 1200
                            : (MediaQuery.of(context).size.width > 800
                                ? 900
                                : 600),
                      ),
                      child: GridView.builder(
                        itemCount: collections.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
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
            Container(color: Colors.black.withValues(alpha: 0.35)),
            Center(
              child: Text(
                data.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
