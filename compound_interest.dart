import 'package:flutter/material.dart';
import 'dart:math';

class CompoundInterestCalculator extends StatefulWidget {
  @override
  _CompoundInterestCalculatorState createState() =>
      _CompoundInterestCalculatorState();
}

class _CompoundInterestCalculatorState
    extends State<CompoundInterestCalculator> {
  final TextEditingController principalController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  String result = "";

  void calculateCompoundInterest() {
    final double principal = double.tryParse(principalController.text) ?? 0;
    final double rate = double.tryParse(rateController.text) ?? 0;
    final double time = double.tryParse(timeController.text) ?? 0;

    final compoundInterest =
        principal * pow(1 + (rate / 100), time) - principal;

    setState(() {
      result = "Compound Interest = ₹ ${compoundInterest.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Compound Interest Calculator')),
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
              onPressed: calculateCompoundInterest,
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
