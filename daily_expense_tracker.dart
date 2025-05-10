import 'package:flutter/material.dart';

class DailyExpenseTracker extends StatefulWidget {
  @override
  _DailyExpenseTrackerState createState() => _DailyExpenseTrackerState();
}

class _DailyExpenseTrackerState extends State<DailyExpenseTracker> {
  final TextEditingController expenseController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<Map<String, dynamic>> expenses = [];
  double total = 0;

  void addExpense() {
    double amount = double.tryParse(expenseController.text) ?? 0;
    String desc = descriptionController.text;

    if (amount <= 0 || desc.isEmpty) return;

    setState(() {
      expenses.add({"amount": amount, "description": desc});
      total += amount;
      expenseController.clear();
      descriptionController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daily Expense Tracker")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: expenseController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Amount (₹)"),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Description"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: addExpense,
              child: Text("Add Expense"),
            ),
            SizedBox(height: 20),
            Text("Total Spent: ₹ ${total.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(expenses[index]['description']),
                    trailing: Text("₹ ${expenses[index]['amount']}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
