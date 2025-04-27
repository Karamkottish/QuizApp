import 'package:english_quiz/Presentation/_Resources/ColorManager.dart';
import 'package:english_quiz/Presentation/_Resources/WidgetValueManager.dart';
import 'package:flutter/material.dart';


class MyContainer extends StatelessWidget {
  final Widget child;
  const MyContainer({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: ColorManager.primaryContainer,
            border:  Border.fromBorderSide(BorderSide(color: ColorManager.primary)),
            borderRadius: BorderRadius.all(Radius.circular(AppSizeManager.s16))
        ),
        padding: const EdgeInsets.all(AppPaddingManager.p10),
        width: double.maxFinite,
        child: child
    );
  }
}