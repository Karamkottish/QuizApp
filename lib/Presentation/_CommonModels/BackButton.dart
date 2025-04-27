import 'package:flutter/material.dart';

import '../_Resources/ColorManager.dart';
import '../_Resources/FontManager.dart';
import '../_Resources/StyleManager.dart';

class MyBackButton extends StatelessWidget {
  final String route;
  final Function? specialAction;
  const MyBackButton({required this.route,this.specialAction,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {
      specialAction?.call();
        Navigator.pushReplacementNamed(context, route);}, child:Text("back",style: TextStyleManager.getRegularStyle(size: FontSizeManager.s13,color: ColorManager.onPrimary)));
  }
}
