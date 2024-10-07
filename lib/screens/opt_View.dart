import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:webdemo/screens/paymentplan.dart';

class OptView extends StatefulWidget {
  final String phoneNumber;
  const OptView({super.key, required this.phoneNumber});

  @override
  State<OptView> createState() => _OptViewState();
}

class _OptViewState extends State<OptView> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond:
        StopWatchTimer.getMilliSecFromSecond(30), // 30 seconds countdown
  );

  OtpFieldController otpController = OtpFieldController();

  @override
  void initState() {
    super.initState();
    // Start the countdown timer when the screen is loaded.
    _stopWatchTimer.onStartTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer
        .dispose(); // Dispose of the timer when the widget is destroyed.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text("Enter 4-digit Code"),
            Text(
                "Enter the verification sent to you at \n${widget.phoneNumber}"),
            OTPTextField(
                fieldWidth: MediaQuery.of(context).size.width / 8,
                fieldStyle: FieldStyle.box,
                controller: otpController,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                length: 4,
                onChanged: (pin) {
                  print("Changed: " + pin);
                },
                onCompleted: (pin) {
                  print("Completed: " + pin);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPlan(),
                      ));
                }),
            StreamBuilder<int>(
              stream:
                  _stopWatchTimer.secondTime, // Listen to the seconds stream
              initialData: 30, // Start with 30 seconds
              builder: (context, snap) {
                final value = snap.data;
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'You can resend the code in : ',
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Helvetica',
                            ),
                          ),
                          Text(
                            value.toString(),
                            style: const TextStyle(
                              fontSize: 30,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            ' sec',
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Helvetica',
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    const Text(
                        "By Continuing I accept the terms and condition.")
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
