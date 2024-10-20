import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newbie/utils/app_utils.dart';
import 'package:newbie/widgets/common_button.dart';


class OnbordingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/onbording.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/images/carot.svg'),
                    SizedBox(height: AppUtils.getSizeRespontive(context, 36)),
                    const Text(
                      'Welcome to our store',
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: AppUtils.getSizeRespontive(context, 19)),
                    const Opacity(
                      opacity: 0.7,
                      child: Text(
                        'Get your groceries in as fast as one hour',
                        style: TextStyle(
                          color: Color(0xFFFCFCFC),
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 40),
                    CommonButton(
                      label: 'Get started',
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}