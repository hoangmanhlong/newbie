import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newbie/screens/routes.dart';
import 'package:newbie/utils/app_res.dart';
import 'package:newbie/widgets/common_button.dart';

import 'login_intro.dart';

class LoginStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
            child: Image(
          image: AssetImage(AppRes.getImageResPath('welcome.png')),
          fit: BoxFit.cover,
        )),
        Positioned.fill(
            child: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const Text(
                    'Welcome to our store',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Ger your groceries in as fast as one hour',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFFCFCFC),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  CommonButton(
                    label: 'Get started',
                    buttonColor: Theme.of(context).colorScheme.primary.value,
                    hasIcon: false,
                    onButtonClicked: () => {
                      Navigator.pushNamed(context, AppRoute.login),
                    },
                  ),
                ],
              ),
            )
          ],
        ))
      ]),
    );
  }
}
