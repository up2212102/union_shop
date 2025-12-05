import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';

class PrintPage extends StatefulWidget {
  const PrintPage({super.key});

  @override
  State<PrintPage> createState() => _PrintPageState();
}

class _PrintPageState extends State<PrintPage> {
  int quantity = 1;
  final TextEditingController _qtyController = TextEditingController(text: '1');
  final TextEditingController _line1Controller = TextEditingController();
  final TextEditingController _line2Controller = TextEditingController();
  final TextEditingController _line3Controller = TextEditingController();
  final TextEditingController _line4Controller = TextEditingController();
  final List<String> _images = const [
    'https://picsum.photos/seed/print1/1024/1024',
    'https://picsum.photos/seed/print2/1024/1024',
    'https://picsum.photos/seed/print3/1024/1024',
  ];
  int _imageIndex = 0;
  String _selection = 'One Line of Text';
  final int _charLimitPerLine = 10; // default, can be adjusted later

  @override
  void dispose() {
    _qtyController.dispose();
    _line1Controller.dispose();
    _line2Controller.dispose();
    _line3Controller.dispose();
    _line4Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width > 1200 ? 1200 : 1000,
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final isWide = constraints.maxWidth > 700;
                      final image = Container(
                        height: isWide ? 380 : 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200],
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Image.network(
                                _images[_imageIndex],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[300],
                                    child: const Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.image_not_supported, size: 64, color: Colors.grey),
                                          SizedBox(height: 8),
                                          Text('Image unavailable', style: TextStyle(color: Colors.grey)),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              height: 70,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (int i = 0; i < _images.length; i++)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 6),
                                      child: InkWell(
                                        onTap: () => setState(() => _imageIndex = i),
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: i == _imageIndex ? const Color(0xFF4d2963) : const Color(0xFFE5E7EB),
                                              width: i == _imageIndex ? 2 : 1,
                                            ),
                                            borderRadius: BorderRadius.circular(6),
                                            color: Colors.white,
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: Image.network(
                                            _images[i],
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[300]),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );

                      final details = Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'The Print Shack',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Personalisation Service',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4d2963),
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Add a personal touch to your merch. Choose your item, then add custom text in-store. Pricing varies by item and number of characters.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Per Line: Description of Text:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: 320,
                            child: DropdownButtonFormField<String>(
                              initialValue: _selection,
                              items: const [
                                'One Line of Text',
                                'Two Lines',
                                'Three Lines',
                                'Four Lines',
                                'Small Logo (Chest)',
                                'Large Logo (Back)'
                              ]
                                  .map((s) => DropdownMenuItem<String>(
                                        value: s,
                                        child: Text(s),
                                      ))
                                  .toList(),
                              onChanged: (val) => setState(() => _selection = val ?? _selection),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                labelText: 'Select personalisation',
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Personalisation Line 1:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: 420,
                            child: TextField(
                              controller: _line1Controller,
                              maxLength: _charLimitPerLine,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                hintText: 'Enter text for line 1',
                                labelText: 'Line 1',
                                counterText: '',
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Quantity',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        _QtyButton(
                                          icon: Icons.remove,
                                          onTap: () {
                                            setState(() {
                                              quantity = (quantity - 1).clamp(1, 999);
                                              _qtyController.text = quantity.toString();
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                        SizedBox(
                                          width: 64,
                                          child: TextField(
                                            controller: _qtyController,
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              isDense: true,
                                              contentPadding: EdgeInsets.symmetric(vertical: 8),
                                            ),
                                            onSubmitted: (val) {
                                              final n = int.tryParse(val) ?? quantity;
                                              setState(() {
                                                quantity = n.clamp(1, 999);
                                                _qtyController.text = quantity.toString();
                                              });
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        _QtyButton(
                                          icon: Icons.add,
                                          onTap: () {
                                            setState(() {
                                              quantity = (quantity + 1).clamp(1, 999);
                                              _qtyController.text = quantity.toString();
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (_selection == 'Two Lines' || _selection == 'Three Lines' || _selection == 'Four Lines') ...[
                                const SizedBox(height: 16),
                                const Text(
                                  'Personalisation Line 2:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  width: 420,
                                  child: TextField(
                                    controller: _line2Controller,
                                    maxLength: _charLimitPerLine,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      isDense: true,
                                      hintText: 'Enter text for line 2',
                                      labelText: 'Line 2',
                                      counterText: '',
                                    ),
                                  ),
                                ),
                              ],
                              if (_selection == 'Three Lines' || _selection == 'Four Lines') ...[
                                const SizedBox(height: 16),
                                const Text(
                                  'Personalisation Line 3:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  width: 420,
                                  child: TextField(
                                    controller: _line3Controller,
                                    maxLength: _charLimitPerLine,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      isDense: true,
                                      hintText: 'Enter text for line 3',
                                      labelText: 'Line 3',
                                      counterText: '',
                                    ),
                                  ),
                                ),
                              ],
                              if (_selection == 'Four Lines') ...[
                                const SizedBox(height: 16),
                                const Text(
                                  'Personalisation Line 4:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  width: 420,
                                  child: TextField(
                                    controller: _line4Controller,
                                    maxLength: _charLimitPerLine,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      isDense: true,
                                      hintText: 'Enter text for line 4',
                                      labelText: 'Line 4',
                                      counterText: '',
                                    ),
                                  ),
                                ),
                              ],
                              // Extra spacing before actions
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                      final lines = <String>[
                                        _line1Controller.text.trim(),
                                        if (_selection == 'Two Lines' || _selection == 'Three Lines' || _selection == 'Four Lines') _line2Controller.text.trim(),
                                        if (_selection == 'Three Lines' || _selection == 'Four Lines') _line3Controller.text.trim(),
                                        if (_selection == 'Four Lines') _line4Controller.text.trim(),
                                      ];
                                      // Simple validation: at least line1 for text options
                                      final isLogo = _selection.contains('Logo');
                                      if (!isLogo && (lines.isEmpty || lines.first.isEmpty)) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Please enter text for Line 1')),
                                        );
                                        return;
                                      }
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(isLogo ? 'Added logo option to cart' : 'Added personalisation to cart')),
                                      );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4d2963),
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                                  ),
                                  child: const Text('Add to Cart'),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Share clicked')),
                                        );
                                      },
                                      style: OutlinedButton.styleFrom(
                                        side: const BorderSide(color: Color(0xFFE5E7EB)),
                                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                      ),
                                      child: const Text('Share'),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Tweet clicked')),
                                        );
                                      },
                                      style: OutlinedButton.styleFrom(
                                        side: const BorderSide(color: Color(0xFFE5E7EB)),
                                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                      ),
                                      child: const Text('Tweet'),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Pin it clicked')),
                                        );
                                      },
                                      style: OutlinedButton.styleFrom(
                                        side: const BorderSide(color: Color(0xFFE5E7EB)),
                                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                      ),
                                      child: const Text('Pin it'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );

                      if (isWide) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 1, child: image),
                            const SizedBox(width: 24),
                            Expanded(flex: 1, child: details),
                          ],
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            image,
                            const SizedBox(height: 24),
                            details,
                          ],
                        );
                      }
                    },
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

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE5E7EB)),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(icon, size: 18),
        ),
      ),
    );
  }
}
