import 'package:flutter/material.dart';

class SimpleInterestCalculator extends StatefulWidget {
  @override
  _SimpleInterestCalculatorState createState() =>
      _SimpleInterestCalculatorState();
}

class _SimpleInterestCalculatorState extends State<SimpleInterestCalculator> {
  final TextEditingController principalController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  String result = "";

  void calculateSimpleInterest() {
    final double principal = double.tryParse(principalController.text) ?? 0;
    final double rate = double.tryParse(rateController.text) ?? 0;
    final double time = double.tryParse(timeController.text) ?? 0;

    final simpleInterest = (principal * rate * time) / 100;
    setState(() {
      result = "Simple Interest = ₹ ${simpleInterest.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Interest Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: principalController,
              decoration: InputDecoration(labelText: 'Principal (₹)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: rateController,
              decoration: InputDecoration(labelText: 'Rate of Interest (%)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: timeController,
              decoration: InputDecoration(labelText: 'Time (years)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateSimpleInterest,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text(result,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
