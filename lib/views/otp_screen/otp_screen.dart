
import 'package:flutter/services.dart';

import '/controller/controller.dart';
import '/views/login_screen/widget/login_btn.dart';
import '/views/utils/utils.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Verify OTP to continue",
                  style: TextStyle(
                    fontSize: 22,
                    color: grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kHeight40,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const[
                    OtpField(),
                    OtpField(),
                    OtpField(),
                    OtpField(),
                  ],
                ),
                kHeight30,
                const LoginBtn(verify: true),
              ]),
        ),
      ),
    );
  }
}

class OtpField extends StatelessWidget {
  const OtpField({super.key, this.title});
  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: grey,
        ),
      ),
      height: 60,
      width: 60,
      child: TextFormField(
        keyboardType: TextInputType.number,
        // controller: otpController,
        onChanged: (value) {
          if (value.isNotEmpty) {
            pinList.add(value);

            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && pinList.isNotEmpty) {
            pinList.removeLast();
          }

          if (pinList.length > 4) {
            pinList.removeRange(4, pinList.length);
          }
        },
        style: Theme.of(context).textTheme.headlineSmall,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
