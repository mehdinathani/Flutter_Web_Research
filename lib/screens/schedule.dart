import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:webdemo/screens/addCard.dart';

class Schedule extends StatefulWidget {
  final int installments;
  final double price;

  const Schedule({super.key, required this.installments, required this.price});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final NumberFormat currencyFormatter = NumberFormat.currency(
      symbol: '\$', decimalDigits: 2); // Currency formatter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("${widget.installments} Payments"),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.installments,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Payment ${index + 1}'),
                  trailing: Text(
                    currencyFormatter
                        .format((widget.price / widget.installments)),
                  ),
                );
              },
            ),
            const Divider(),
            Row(
              children: [
                const Text("Total: Inclusive of 1% processing fee"),
                const Spacer(),
                Text(currencyFormatter.format(widget.price)),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.grey),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.currency_exchange,
                    color: Colors.red,
                  ),
                  const Text(
                    "Smart",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  const Text("Waive the \$40 fee"),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "Try free",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text("Pay with"),
                const Spacer(),
                Row(
                  children: const [
                    Icon(Icons.apple),
                    Text("Apple Pay"),
                    Icon(Icons.arrow_forward_ios)
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckOutAddCard(price: widget.price),
                  ),
                );
              },
              child: Text(
                "Pay US ${currencyFormatter.format(widget.price / widget.installments)}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
