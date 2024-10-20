import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {

  String label;
  VoidCallback? onClick;
  int? color;

  CommonButton({super.key, required this.label, this.onClick, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 67,
        decoration: BoxDecoration(
            color: color == null ? Theme.of(context).primaryColor : Color(color!),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        // color: Theme.of(context).primaryColor,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
