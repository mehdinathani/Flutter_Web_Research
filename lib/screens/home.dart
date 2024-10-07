import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webdemo/screens/opt_View.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? phoneNumber;
  String message = "";
  String _selectedCountryCode1 = '+1';

  Country? _selectedCountry;

  bool _isPhoneNumberValid = false;

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
            _buildTextField(CountryCodePicker(
              onChanged: (country) {
                setState(() {
                  _selectedCountryCode1 = country.dialCode ?? '';
                });
                _printCountryCode(country);
              },
              initialSelection: 'US',
              favorite: [_selectedCountryCode1],
              showFlag: true,
              showDropDownButton: true,
            )),
            // InternationalPhoneNumberInput(
            //   onInputChanged: (PhoneNumber number) {
            //     print(number.phoneNumber);
            //   },
            //   onInputValidated: (bool value) {
            //     print(value);
            //   },
            //   selectorConfig: const SelectorConfig(
            //     selectorType: PhoneInputSelectorType.DROPDOWN,
            //   ),
            //   ignoreBlank: false,
            //   autoValidateMode: AutovalidateMode.disabled,
            //   initialValue: number,
            //   textFieldController: TextEditingController(),
            //   formatInput: true,
            //   keyboardType:
            //       TextInputType.numberWithOptions(signed: true, decimal: true),
            //   inputBorder: OutlineInputBorder(),
            //   onSaved: (PhoneNumber number) {
            //     phoneNumber = number.phoneNumber;
            //   },
            // ),

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

  Widget _buildTextField(Widget prefixIcon) {
    return TextField(
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        PhoneNumberFormatter(),
      ],
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: 'Enter phone number',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red))),
    );
  }

  _printCountryCode(Country? country) {
    if (country != null) {
      debugPrint(country.name);
      debugPrint(country.code);
      debugPrint(country.dialCode);
    }
  }
}
