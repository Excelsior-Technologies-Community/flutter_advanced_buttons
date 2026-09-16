import 'package:flutter/material.dart';

class AdvancedLoadingButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  final double? width;
  final double height;
  final double borderRadius;

  final Color backgroundColor;
  final Color disabledColor;

  final Color? textColor;
  final TextStyle? textStyle;

  final IconData? icon;
  final double iconSize;
  final Color? iconColor;

  final Color? loadingColor;
  final double loadingSize;
  final double loadingStrokeWidth;

  final EdgeInsetsGeometry padding;

  final BorderSide? borderSide;
  final List<BoxShadow>? boxShadow;

  const AdvancedLoadingButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.width,
    this.height = 50,
    this.borderRadius = 12,
    this.backgroundColor = Colors.blue,
    this.disabledColor = Colors.grey,
    this.textColor,
    this.textStyle,
    this.icon,
    this.iconSize = 20,
    this.iconColor,
    this.loadingColor,
    this.loadingSize = 20,
    this.loadingStrokeWidth = 2.5,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    this.borderSide,
    this.boxShadow,
  });

  bool get isDisabled => onPressed == null || isLoading;

  @override
  Widget build(BuildContext context) {
    final borderRadiusValue = BorderRadius.circular(borderRadius);

    final Color effectiveTextColor =
        textColor ?? textStyle?.color ?? Colors.white;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          disabledBackgroundColor: disabledColor,
          foregroundColor: effectiveTextColor,
          disabledForegroundColor: effectiveTextColor,
          padding: padding,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadiusValue,
            side: borderSide ?? BorderSide.none,
          ),
          shadowColor: Colors.transparent,
        ).copyWith(
          elevation: WidgetStateProperty.all(
            boxShadow == null ? 0 : 2,
          ),
        ),
        child: isLoading
            ? SizedBox(
          width: loadingSize,
          height: loadingSize,
          child: CircularProgressIndicator(
            strokeWidth: loadingStrokeWidth,
            valueColor: AlwaysStoppedAnimation<Color>(
              loadingColor ?? effectiveTextColor,
            ),
          ),
        )
            : Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: iconSize,
                color: iconColor ?? effectiveTextColor,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: textStyle ??
                  TextStyle(
                    color: effectiveTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}