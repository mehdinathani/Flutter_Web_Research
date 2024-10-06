import 'package:flutter/material.dart';
import 'package:intl_phone_number_input_v2/intl_phone_number_input.dart';
import 'package:webdemo/screens/opt_View.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? phoneNumber;
  PhoneNumber number = PhoneNumber(isoCode: 'US');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter your mobile number.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                print(number.phoneNumber);
              },
              onInputValidated: (bool value) {
                print(value);
              },
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.DROPDOWN,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              initialValue: number,
              textFieldController: TextEditingController(),
              formatInput: true,
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              inputBorder: OutlineInputBorder(),
              onSaved: (PhoneNumber number) {
                phoneNumber = number.phoneNumber;
              },
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.purple)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OptView(phoneNumber: "9233333333"),
                      ));
                },
                child: const Text(
                  "Send Verification Code",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
