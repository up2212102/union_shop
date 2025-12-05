import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/aboutus_page.dart';
import 'package:union_shop/collections_page.dart';
import 'package:union_shop/collection_page.dart';
import 'package:union_shop/sale_page.dart';
import 'package:union_shop/auth_page.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(),
      // By default, the app starts at the '/' route, which is the HomeScreen
      initialRoute: '/',
      // When navigating to '/product', build and return the ProductPage
      // In your browser, try this link: http://localhost:49856/#/product
      routes: {
        '/product': (context) => const ProductPage(),
        '/about': (context) => const AboutUsPage(),
        '/collections': (context) => const CollectionsPage(),
        '/collection': (context) => const CollectionPage(),
        '/sale': (context) => const SalePage(),
        '/auth': (context) => const AuthPage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(),

            // Hero Section (carousel background)
            const _HeroCarousel(
              imageUrls: [
                'https://picsum.photos/seed/carousel1/1600/900',
                'https://picsum.photos/seed/carousel2/1600/900',
                'https://picsum.photos/seed/carousel3/1600/900',
                'https://picsum.photos/seed/carousel4/1600/900',
              ],
            ),

            // (carousel moved into hero)

            // Products Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'ESSENTIAL RANGE - OVER 20% OFF!',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width > 900 ? 900 : 600,
                        ),
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 36,
                          children: const [
                            ProductCard(
                              title: 'Limited Edition Essential Zip Hoodies',
                              price: '£14.99',
                              originalPrice: '£20.00',
                              salePrice: '£14.99',
                              imageUrl:
                                  'https://picsum.photos/seed/essential1/1200/800',
                            ),
                            ProductCard(
                              title: 'Essential T-Shirt',
                              price: '£6.99',
                              originalPrice: '£10.00',
                              salePrice: '£6.99',
                              imageUrl:
                                  'https://picsum.photos/seed/essential2/1200/800',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'SIGNATURE RANGE',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width > 900 ? 900 : 600,
                        ),
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 36,
                          children: const [
                            ProductCard(
                              title: 'Signature Hoodie',
                              price: '£32.99',
                              imageUrl:
                                  'https://picsum.photos/seed/signature1/1200/800',
                            ),
                            ProductCard(
                              title: 'Signature T-Shirt',
                              price: '£14.99',
                              imageUrl:
                                  'https://picsum.photos/seed/signature2/1200/800',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 48),
                    const Text(
                      'PORTSMOUTH CITY COLLECTION',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 48),
                    Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width > 900 ? 900 : 600,
                        ),
                        child: Column(
                          children: [
                            GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount:
                                  MediaQuery.of(context).size.width > 600 ? 2 : 1,
                              crossAxisSpacing: 24,
                              mainAxisSpacing: 36,
                              children: const [
                                ProductCard(
                                  title: 'Portsmouth City Magnet',
                                  price: '£4.50',
                                  imageUrl:
                                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                                ),
                                ProductCard(
                                  title: 'Portsmouth City Postcard',
                                  price: '£1.00',
                                  imageUrl:
                                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                                ),
                                ProductCard(
                                  title: 'Portsmouth CIty Bookmark',
                                  price: '£3.00',
                                  imageUrl:
                                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                                ),
                                ProductCard(
                                  title: 'Portsmouth City Notebook',
                                  price: '£7.50',
                                  imageUrl:
                                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('View All pressed')),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4d2963),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                child: const Text('View All'),
                              ),
                            ),
                            const SizedBox(height: 48),
                            const Center(
                              child: Text(
                                'OUR RANGE',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: MediaQuery.of(context).size.width > 900
                                  ? 4
                                  : (MediaQuery.of(context).size.width > 600 ? 2 : 1),
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              children: const [
                                _ConceptImage(
                                  imageUrl:
                                      'https://picsum.photos/seed/merch1/1200/800',
                                  label: 'Clothing',
                                ),
                                _ConceptImage(
                                  imageUrl:
                                      'https://picsum.photos/seed/merch2/1200/800',
                                  label: 'Merchandise',
                                ),
                                _ConceptImage(
                                  imageUrl:
                                      'https://picsum.photos/seed/merch3/1200/800',
                                  label: 'Graduation',
                                ),
                                _ConceptImage(
                                  imageUrl:
                                      'https://picsum.photos/seed/merch4/1200/800',
                                  label: 'SALE',
                                ),
                              ],
                            ),
                            const SizedBox(height: 48),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                final isWide = constraints.maxWidth > 700;
                                final Widget content = Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Add a Personal Touch',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    const Text(
                                      'First add your item of clothing to the cart then click\nbelow to add your text! One line of text contains 10\ncharacters!',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                        height: 1.5,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF4d2963),
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 12,
                                        ),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                      ),
                                      child: const Text(
                                        'CLICK HERE TO ADD TEXT',
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                                if (isWide) {
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: AspectRatio(
                                          aspectRatio: 1,
                                          child: Image.asset(
                                            'assets/images/The_Union_Print_Shack_Logo_-_smaller_360x.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 24),
                                      Expanded(child: content),
                                    ],
                                  );
                                } else {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        width: 180,
                                        child: AspectRatio(
                                          aspectRatio: 1,
                                          child: Image.asset(
                                            'assets/images/The_Union_Print_Shack_Logo_-_smaller_360x.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      content,
                                    ],
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Footer(),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final String? originalPrice;
  final String? salePrice;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.originalPrice,
    this.salePrice,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.6,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.black),
                maxLines: 2,
              ),
              const SizedBox(height: 4),
              if (salePrice != null && originalPrice != null)
                Row(
                  children: [
                    Text(
                      originalPrice!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      salePrice!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              else
                Text(
                  price,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ConceptImage extends StatelessWidget {
  final String imageUrl;
  final String label;
  const _ConceptImage({required this.imageUrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Concept image tapped')),
        );
      },
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
            Container(
              color: Colors.black.withValues(alpha: 0.25),
            ),
            Center(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SimpleCarousel extends StatefulWidget {
  final List<String> imageUrls;
  const _SimpleCarousel({required this.imageUrls});

  @override
  State<_SimpleCarousel> createState() => _SimpleCarouselState();
}

class _SimpleCarouselState extends State<_SimpleCarousel> {
  int _index = 0;

  void _prev() {
    setState(() {
      _index = (_index - 1 + widget.imageUrls.length) % widget.imageUrls.length;
    });
  }

  void _next() {
    setState(() {
      _index = (_index + 1) % widget.imageUrls.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final url = widget.imageUrls[_index];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            url,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(Icons.image_not_supported, color: Colors.grey),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _prev,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4d2963),
                foregroundColor: Colors.white,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
              child: const Icon(Icons.chevron_left),
            ),
            const SizedBox(width: 16),
            Text(
              '${_index + 1} / ${widget.imageUrls.length}',
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: _next,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4d2963),
                foregroundColor: Colors.white,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
              child: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ],
    );
  }
}

class _HeroCarousel extends StatefulWidget {
  final List<String> imageUrls;
  const _HeroCarousel({required this.imageUrls});

  @override
  State<_HeroCarousel> createState() => _HeroCarouselState();
}

class _HeroCarouselState extends State<_HeroCarousel> {
  int _index = 0;

  void _prev() {
    setState(() {
      _index = (_index - 1 + widget.imageUrls.length) % widget.imageUrls.length;
    });
  }

  void _next() {
    setState(() {
      _index = (_index + 1) % widget.imageUrls.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final url = widget.imageUrls[_index];
    // Content per slide
    final List<Map<String, String>> slides = [
      {
        'title': 'ESSENTIAL RANGE - OVER 20% OFF',
        'desc': 'Save over 20% on our Essential Range.',
        'cta': 'SHOP ESSENTIAL RANGE',
        'route': '/sale',
      },
      {
        'title': 'The Print Shack',
        'desc': "Let's create something uniquely with our personalisation service",
        'cta': 'Find out more',
        'route': '/about',
      },
      {
        'title': 'Hungry?',
        'desc': 'We got this 🍕',
        'cta': "Order Domino's Pizza now",
        'route': '',
      },
      {
        'title': "What's your next move...",
        'desc': 'Are you with us?',
        'cta': 'Find your student accomodation',
        'route': '',
      },
    ];
    final slide = slides[_index % slides.length];
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              url,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withValues(alpha: 0.7),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            top: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  slide['title']!,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  slide['desc']!,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    final route = slide['route'] ?? '';
                    if (route.isNotEmpty) {
                      Navigator.pushNamed(context, route);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(slide['cta']!)),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4d2963),
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Text(
                    slide['cta']!,
                    style: const TextStyle(fontSize: 14, letterSpacing: 1),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _prev,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4d2963),
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                      ),
                      child: const Icon(Icons.chevron_left),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '${_index + 1} / ${widget.imageUrls.length}',
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: _next,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4d2963),
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                      ),
                      child: const Icon(Icons.chevron_right),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
