// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:testing_app/utils/size/app_size.dart';

class ContainerWithShadow extends StatelessWidget {
  final double width;
  final double? height;
  final double? padding;
  final Color? color;
  final Widget child;
  final double? radius;
  final LinearGradient? gradient;
  const ContainerWithShadow({
    Key? key,
    required this.width,
    required this.height,
    this.padding,
    this.gradient,
    this.radius,
    this.color,
    this.child = const SizedBox.shrink(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding ?? AppSize.size10),
      decoration: BoxDecoration(
        gradient: gradient,
        color:  color ?? theme.cardColor,
        borderRadius: BorderRadius.circular(radius ?? AppSize.size20),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, AppSize.size5),
              blurRadius: AppSize.size10)
        ],
      ),
      child: child,
    );
  }
}
