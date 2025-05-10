// main.dart
import 'package:flutter/material.dart';
import 'simple_interest.dart';
import 'compound_interest.dart';
import 'emi_calculator.dart';
import 'sip_calculator.dart';
import 'swp_calculator.dart';
import 'daily_expense_tracker.dart';
import 'savings_goal_tracker.dart';

void main() {
  runApp(FinanceToolkitApp());
}

class FinanceToolkitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Finance Toolkit',
      theme: ThemeData(
        primaryColor: Color(0xFF333333),
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF007AFF),
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> calculators = [
    {'title': 'Simple Interest', 'widget': SimpleInterestCalculator()},
    {'title': 'Compound Interest', 'widget': CompoundInterestCalculator()},
    {'title': 'EMI Calculator', 'widget': EMICalculator()},
    {'title': 'SIP Calculator', 'widget': SIPCalculator()},
    {'title': 'SWP Calculator', 'widget': SWPCalculator()},
    {'title': 'Daily Expense Tracker', 'widget': DailyExpenseTracker()},
    {'title': 'Savings Goal Tracker', 'widget': SavingsGoalTracker()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Finance Toolkit')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: calculators.length,
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(calculators[index]['title'],
                  style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => calculators[index]['widget']),
              ),
            ),
          );
        },
      ),
    );
  }
}
