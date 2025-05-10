import 'package:flutter/material.dart';

class SavingsGoalTracker extends StatefulWidget {
  @override
  _SavingsGoalTrackerState createState() => _SavingsGoalTrackerState();
}

class _SavingsGoalTrackerState extends State<SavingsGoalTracker> {
  final TextEditingController goalController = TextEditingController();
  final TextEditingController savedController = TextEditingController();

  double goal = 0;
  double saved = 0;
  String message = "";

  void updateSavings() {
    double newGoal = double.tryParse(goalController.text) ?? 0;
    double addAmount = double.tryParse(savedController.text) ?? 0;

    if (newGoal > 0) goal = newGoal;
    saved += addAmount;

    setState(() {
      if (saved >= goal && goal > 0) {
        message = "🎉 Goal Achieved!";
      } else if (goal > 0) {
        message =
            "₹${(goal - saved).toStringAsFixed(2)} left to reach your goal.";
      }
      savedController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Savings Goal Tracker")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: goalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Set Your Goal (₹)"),
            ),
            TextField(
              controller: savedController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Add Savings (₹)"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateSavings,
              child: Text("Update Savings"),
            ),
            SizedBox(height: 20),
            Text("Saved: ₹ ${saved.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              message,
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
