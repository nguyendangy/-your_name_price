import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductInfo {
  final String name;
  final double price;
  ProductInfo(this.name, this.price);
}

final products = [
  ProductInfo("Wireless mouse", 3),
  ProductInfo("Keyboard", 5),
  ProductInfo("Camera", 8),
  ProductInfo("Speaker", 4),
  ProductInfo("iPad", 1200),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentProductIndex = 0;
  int? _intputtedPrice;
  String _result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 40)),
            Text(products[_currentProductIndex].name),
            const Padding(padding: EdgeInsets.only(top: 40)),
            SizedBox(
              width: 200,
              child: TextField(
                key: const Key('priceInput'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  _intputtedPrice = int.tryParse(value);
                },
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 40)),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _result =
                        _intputtedPrice == products[_currentProductIndex].price
                            ? 'pass'
                            : 'fail';
                  });
                },
                child: const Text("Check")),
            Visibility(
              visible: _result.isNotEmpty,
              child: Text(
                _result,
                key: const Key('result'),
              ),
            ),
            Visibility(
              visible: _result.isNotEmpty,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _result = '';
                    if (_currentProductIndex < 4) {
                      _currentProductIndex++;
                    }
                  });
                },
                child: const Text("Next"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// add developgit 