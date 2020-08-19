import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final String logoAssetPath;
  double aspectRatio;
  final Widget child;

  AppLogo({
    this.logoAssetPath = "assets/images/logo02.png",
  }) : child = Image.asset(logoAssetPath);

  AppLogo.aspectRatio(
      {this.logoAssetPath = "assets/images/logo02.png",
      this.aspectRatio: 3 / 0.5})
      : child = AspectRatio(
          aspectRatio: aspectRatio,
          child: Image.asset(logoAssetPath),
        );

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
