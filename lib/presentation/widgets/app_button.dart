import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  final void Function()? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 56.0,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 40.0),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),),),
      ),
    );
  }
}
