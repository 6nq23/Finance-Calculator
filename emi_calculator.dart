import 'package:flutter/material.dart';
import 'dart:math'; // Ensure you are importing this

class EMICalculator extends StatefulWidget {
  @override
  _EMICalculatorState createState() => _EMICalculatorState();
}

class _EMICalculatorState extends State<EMICalculator> {
  final TextEditingController loanAmountController = TextEditingController();
  final TextEditingController interestRateController = TextEditingController();
  final TextEditingController loanTermController = TextEditingController();

  String result = "";

  void calculateEMI() {
    final double loanAmount = double.tryParse(loanAmountController.text) ?? 0;
    final double annualInterestRate =
        double.tryParse(interestRateController.text) ?? 0;
    final int loanTerm = int.tryParse(loanTermController.text) ?? 0;

    // EMI formula
    double monthlyInterestRate = annualInterestRate / 12 / 100;
    int totalPayments = loanTerm * 12;

    // EMI formula: [P * r * (1 + r)^n] / [(1 + r)^n - 1]
    double emi = loanAmount *
        monthlyInterestRate *
        pow(1 + monthlyInterestRate, totalPayments).toDouble() /
        (pow(1 + monthlyInterestRate, totalPayments).toDouble() - 1);

    setState(() {
      result = "EMI = ₹ ${emi.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EMI Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: loanAmountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Loan Amount (₹)"),
            ),
            TextField(
              controller: interestRateController,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Annual Interest Rate (%)"),
            ),
            TextField(
              controller: loanTermController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Loan Term (in years)"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateEMI,
              child: Text("Calculate EMI"),
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
