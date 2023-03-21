import 'package:bmi/components/constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon,required this.tap});
  final IconData icon;
  final VoidCallback tap;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: tap,
      elevation: 8.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),

      shape: const CircleBorder(),
      fillColor: kButtonFillColor,
      child: Icon(icon),
    );
  }
}