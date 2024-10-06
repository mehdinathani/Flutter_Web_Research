import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:webdemo/screens/schedule.dart';

class PaymentPlan extends StatefulWidget {
  const PaymentPlan({super.key});

  @override
  State<PaymentPlan> createState() => _PaymentPlanState();
}

class _PaymentPlanState extends State<PaymentPlan> {
  final NumberFormat currencyFormatter = NumberFormat.currency(
      symbol: '\$', decimalDigits: 2); // Currency formatter

  double price = 10000;
  int selectedValue = 1; // Default selected value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Payment Plan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text("Honda Civic ABC"),
              trailing: Text(currencyFormatter.format(price)),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<int>(
              value: selectedValue, // Initial selected value
              decoration: const InputDecoration(
                labelText: "Installment Plan years",
                border: OutlineInputBorder(),
              ),
              items: List.generate(
                      4, (index) => index + 1) // Generates values from 1 to 4
                  .map((value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue!;
                  // Handle any additional logic based on the selected value
                });
              },
            ),
            Spacer(),
            Center(
                child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.purple)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Schedule(installments: selectedValue, price: price),
                  ),
                );
              },
              child: const Text(
                "View Payment Plan",
                style: TextStyle(color: Colors.white),
              ),
            )),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
