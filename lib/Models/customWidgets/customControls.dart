import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.text,
    this.buttonWidth,
    this.buttonHeight,
    required this.onTap,
    this.color,
    required this.iconLeft,
    required this.iconRight,
  });

  String text;
  double? buttonWidth;
  double? buttonHeight;
  VoidCallback onTap;
  Color? color = Colors.yellow;
  IconData iconLeft;
  IconData iconRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      margin: EdgeInsets.all(10.0),
      child: Material(
        color: color ?? Color.fromARGB(255, 230, 226, 226),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Icon(iconLeft)),
                  Expanded(child: Text('$text')),
                  Expanded(child: Icon(iconRight)),
                ]),
          ),
        ),
      ),
    );
  }
}

class CustomMeasurmentText extends StatelessWidget {
  CustomMeasurmentText({
    super.key,
    required this.text,
    this.width,
    this.height,
    this.color,
  });

  String text;
  double? width;
  double? height;
  Color? color = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color ?? Colors.blue,
      ),
      margin: EdgeInsets.all(10.0),
      constraints: BoxConstraints(
        minWidth: width ?? 10,
        minHeight: height ?? 20,
      ),
      child: Text(text),
    );
  }
}

class CustomInverter extends StatelessWidget {
  CustomInverter({
    super.key,
    this.buttonWidth,
    this.buttonHeight,
    required this.onTap,
    this.color,
  });

  double? buttonWidth;
  double? buttonHeight;
  VoidCallback onTap;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: buttonWidth ?? 100,
      height: buttonHeight ?? 100,
      margin: EdgeInsets.all(10.0),
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(10),
                color: color ?? Colors.grey,
              ),
              child: Column(children: [
                //SvgPicture.asset('/assets/threeDots.svg'),
                //SvgPicture.asset('assets/nameThunder.svg'),
                Text('Inverter'),
              ])),
        ),
      ),
    );
  }
}
