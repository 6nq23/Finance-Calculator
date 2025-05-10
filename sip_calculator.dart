import 'package:flutter/material.dart';
import 'dart:math';

class SIPCalculator extends StatefulWidget {
  @override
  _SIPCalculatorState createState() => _SIPCalculatorState();
}

class _SIPCalculatorState extends State<SIPCalculator> {
  final TextEditingController monthlyInvestmentController =
      TextEditingController();
  final TextEditingController annualRateController = TextEditingController();
  final TextEditingController yearsController = TextEditingController();

  String result = "";

  void calculateSIP() {
    final double P = double.tryParse(monthlyInvestmentController.text) ?? 0;
    final double r =
        (double.tryParse(annualRateController.text) ?? 0) / 12 / 100;
    final int n = (int.tryParse(yearsController.text) ?? 0) * 12;

    double amount = P * ((pow(1 + r, n) - 1) / r) * (1 + r);

    setState(() {
      result = "Maturity Amount = ₹ ${amount.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SIP Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: monthlyInvestmentController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Monthly Investment (₹)"),
            ),
            TextField(
              controller: annualRateController,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Annual Interest Rate (%)"),
            ),
            TextField(
              controller: yearsController,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Investment Period (Years)"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateSIP,
              child: Text("Calculate"),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
