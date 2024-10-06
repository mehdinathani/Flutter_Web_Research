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
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text("${widget.installments} Paymnets"),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.installments,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text('Payment ${index + 1}'),
                    trailing: Text(
                      currencyFormatter
                          .format((widget.price / widget.installments)),
                    ));
              },
            ),
            Divider(),
            Row(
              children: [
                Text("Total : Inclusive 1%  processing fee"),
                Spacer(),
                Text(currencyFormatter.format(widget.price)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
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
                  SizedBox(
                    width: 10,
                  ),
                  const Text("Waive the \$ 40 fee"),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Try free",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                Text("Pay with"),
                Spacer(),
                Row(
                  children: const [
                    Icon(Icons.apple),
                    Text("Apple Pay"),
                    Icon(Icons.arrow_forward_ios)
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.purple)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CheckOutAddCard(price: widget.price),
                      ));
                },
                child: Text(
                    style: TextStyle(color: Colors.white),
                    "Pay US ${currencyFormatter.format((widget.price / widget.installments))}")),
          ],
        ),
      ),
    );
  }
}
