import 'package:flutter/material.dart';

class GroupCustomButton extends StatelessWidget {
  const GroupCustomButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.isSelected,
      this.selectedBorderColor,
      this.unselectedBorderColor,
      this.selectedTextStyle,
      this.unselectedTextStyle,
      this.selectedColor,
      this.unselectedColor,
      this.borderRadius,
      this.selectedShadow,
      this.unselectedShadow,
      this.height,
      this.width,
      required this.textAlign,
      required this.textPadding,
      this.alignment,
      this.elevation})
      : super(key: key);

  final String text;
  final void Function() onPressed;
  final bool isSelected;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? selectedBorderColor;
  final Color? unselectedBorderColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? selectedShadow;
  final List<BoxShadow>? unselectedShadow;
  final double? height;
  final double? width;
  final TextAlign textAlign;
  final EdgeInsets textPadding;
  final AlignmentGeometry? alignment;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(30),
        boxShadow: isSelected ? selectedShadow : unselectedShadow,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 0.0,
          primary: _getBackGroundColor(theme),
          shape: _buildShape(),
          padding: (width != null || height != null) ? EdgeInsets.zero : null,
          alignment: (width != null || height != null) ? alignment : null,
        ),
        child: Padding(
          padding: textPadding,
          child: Text(
            text,
            textAlign: textAlign,
            style: isSelected ? selectedTextStyle : unselectedTextStyle,
          ),
        ),
      ),
    );
  }

  Color? _getBackGroundColor(ThemeData theme) {
    final themePrimaryColor = theme.buttonTheme.colorScheme?.primary;
    //TODO: implement
    // final themeSecondaryColor = theme.buttonTheme.colorScheme?.secondary;

    Color? selectedColorBuffer = selectedColor;
    Color? unselectedColorBuffer = unselectedColor;

    selectedColorBuffer ??= themePrimaryColor;
    selectedColorBuffer ??= Colors.black;

    unselectedColorBuffer ??= Colors.white;

    final color = isSelected ? selectedColorBuffer : unselectedColorBuffer;
    return color;
  }

  OutlinedBorder? _buildShape() {
    final color = isSelected ? selectedBorderColor ?? unselectedBorderColor : unselectedBorderColor;
    if (borderRadius != null) {
      return RoundedRectangleBorder(
        borderRadius: borderRadius!,
        side: buildBorderSide(color),
      );
    } else {
      return RoundedRectangleBorder(
        side: buildBorderSide(color),
      );
    }
  }

  BorderSide buildBorderSide(Color? color) {
    if (color != null) {
      return BorderSide(
        color: color,
      );
    }
    return BorderSide.none;
  }
}
