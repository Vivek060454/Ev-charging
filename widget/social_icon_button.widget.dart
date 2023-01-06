import 'package:flutter/material.dart';

class SocialIconButton extends StatelessWidget {
  final Color backgroungColor;
  final Icon icon;
  final VoidCallback onTap;

  const SocialIconButton({
    Key? key,
    required this.backgroungColor,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroungColor,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          // color: Colors.blue[900],
          alignment: Alignment.center,
          child: icon,
        ),
      ),
    );
  }
}
