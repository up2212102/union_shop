import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Navbar(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
              color: Colors.white,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: const Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'We are the University of Portsmouth Students\' Union Shop. This demo page uses static, dummy text to satisfy the coursework basics. Replace with your own content later.',
                        style: TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Our mission is to offer great-value merch and essentials for students, on campus and online. This Flutter app focuses on functionality over design, using hardcoded data for now.',
                        style: TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
                      ),
                    ],
                  ),
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
