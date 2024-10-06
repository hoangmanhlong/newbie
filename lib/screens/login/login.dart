import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newbie/utils/app_res.dart';
import 'package:newbie/widgets/common_button.dart';
import 'package:newbie/widgets/common_input.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ListView(children: [
            SvgPicture.asset(
              AppRes.getImageResPath('carot.svg'),
            ),
            const SizedBox(height: 100),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Logging',
                    style: TextStyle(fontSize: 26),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Enter your emails and password',
                    style: TextStyle(fontSize: 16, color: Color(0xFF7C7C7C)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 40),
            CommonInput(
              label: 'Email',
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 30),
            CommonInput(
              label: 'Password',
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Forget password?',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            CommonButton(
              label: 'Login',
              buttonColor: Theme.of(context).colorScheme.primary.value,
              hasIcon: false,
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account"),
                  const SizedBox(width: 8),
                  Text(
                    "Sign up",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
