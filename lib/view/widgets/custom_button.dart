import 'package:e_commerce_app/constants.dart';

import 'package:flutter/material.dart';

import '../../core/size_config.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({Key? key, required this.text, this.onTap})
      : super(key: key);
  final String? text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: DefaultTextStyle(
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w500,
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                text!,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.iconData,
      required this.color})
      : super(key: key);
  final String? text;
  final VoidCallback onTap;
  final IconData? iconData;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color(0xFF707070),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextStyle(
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                fontSize: 12,
                color: const Color(0xff000000),
              ),
              child: Text(
                text!,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Icon(
              iconData,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
