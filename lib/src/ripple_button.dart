import 'package:flutter/material.dart';

class AdvancedRippleButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  final Color backgroundColor;
  final Color rippleColor;

  final Color? textColor;
  final TextStyle? textStyle;

  final IconData? icon;
  final double iconSize;
  final Color? iconColor;

  final double? width;
  final double height;
  final double borderRadius;

  final EdgeInsetsGeometry padding;

  final double elevation;

  final Color? borderColor;
  final double borderWidth;

  const AdvancedRippleButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.rippleColor = Colors.white24,
    this.textColor,
    this.textStyle,
    this.icon,
    this.iconSize = 20,
    this.iconColor,
    this.width,
    this.height = 50,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    this.elevation = 0,
    this.borderColor,
    this.borderWidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius =
    BorderRadius.circular(borderRadius);

    final Color effectiveTextColor =
        textColor ?? textStyle?.color ?? Colors.white;

    final bool isDisabled = onPressed == null;

    return SizedBox(
      width: width,
      height: height,
      child: Material(
        color: isDisabled ? Colors.grey.shade400 : backgroundColor,
        elevation: isDisabled ? 0 : elevation,
        borderRadius: radius,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: radius,
            border: borderWidth > 0
                ? Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderWidth,
            )
                : null,
          ),
          child: InkWell(
            onTap: onPressed,
            borderRadius: radius,
            splashColor: rippleColor,
            highlightColor: rippleColor.withValues(alpha: 0.12),
            child: Padding(
              padding: padding,
              child: Center(
                child: Row(
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
            ),
          ),
        ),
      ),
    );
  }
}