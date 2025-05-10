import 'package:flutter/material.dart';
import 'dart:math';

class SWPCalculator extends StatefulWidget {
  @override
  _SWPCalculatorState createState() => _SWPCalculatorState();
}

class _SWPCalculatorState extends State<SWPCalculator> {
  final TextEditingController initialInvestmentController =
      TextEditingController();
  final TextEditingController monthlyWithdrawalController =
      TextEditingController();
  final TextEditingController annualRateController = TextEditingController();
  final TextEditingController yearsController = TextEditingController();

  String result = "";

  void calculateSWP() {
    final double P = double.tryParse(initialInvestmentController.text) ?? 0;
    final double W = double.tryParse(monthlyWithdrawalController.text) ?? 0;
    final double r =
        (double.tryParse(annualRateController.text) ?? 0) / 12 / 100;
    final int n = (int.tryParse(yearsController.text) ?? 0) * 12;

    // Estimate ending value after systematic withdrawals
    double finalAmount = P;
    for (int i = 0; i < n; i++) {
      finalAmount = finalAmount * (1 + r) - W;
      if (finalAmount < 0) {
        finalAmount = 0;
        break;
      }
    }

    setState(() {
      result = "Remaining Balance = ₹ ${finalAmount.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SWP Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: initialInvestmentController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Initial Investment (₹)"),
            ),
            TextField(
              controller: monthlyWithdrawalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Monthly Withdrawal (₹)"),
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
              decoration: InputDecoration(labelText: "Duration (Years)"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateSWP,
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
