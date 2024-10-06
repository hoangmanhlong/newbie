import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newbie/widgets/common_button.dart';

import '../../utils/app_res.dart';
import '../routes.dart';

class LoginIntro extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  LoginIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage(AppRes.getImageResPath('Mask_Group.png')),
                height: 375,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Get your groceries with nectar',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Image(
                        width: 34,
                        height: 24,
                        image: AssetImage(
                            AppRes.getImageResPath('Rectangle_11.png')),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          style: const TextStyle(fontSize: 18),
                          decoration: const InputDecoration(
                            hintText: '+84',
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(height: 1),
                  const SizedBox(height: 40),
                  const Center(
                      child: Text('Or connect with social media',
                          style: TextStyle(color: Color(0xFF828282)))),
                  const SizedBox(height: 38),
                  CommonButton(
                    label: 'Continue with Google',
                    buttonColor: 0xFF5383EC,
                    hasIcon: true,
                    iconRes: 'google.svg',
                    onButtonClicked: () => {
                      Navigator.pushNamed(context, AppRoute.login),
                    },
                  ),
                  const SizedBox(height: 20),
                  CommonButton(
                    label: 'Continue with Facebook',
                    buttonColor: 0xFF4A66AC,
                    hasIcon: true,
                    iconRes: 'facebook.svg',
                    onButtonClicked: () => {
                      Navigator.pushNamed(context, AppRoute.login),
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
