import 'package:flutter/material.dart';

class AdvancedGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  final List<Color> colors;
  final Alignment begin;
  final Alignment end;

  final double? width;
  final double height;
  final double borderRadius;

  final EdgeInsetsGeometry padding;

  final TextStyle? textStyle;

  final IconData? icon;
  final double iconSize;
  final Color? iconColor;

  final Color? borderColor;
  final double borderWidth;

  final List<BoxShadow>? boxShadow;

  final bool isLoading;
  final Color? loadingColor;
  final double loadingSize;

  final Color? disabledColor;

  const AdvancedGradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.colors,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    this.width,
    this.height = 50,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    this.textStyle,
    this.icon,
    this.iconSize = 20,
    this.iconColor,
    this.borderColor,
    this.borderWidth = 0,
    this.boxShadow,
    this.isLoading = false,
    this.loadingColor,
    this.loadingSize = 20,
    this.disabledColor,
  });

  bool get isDisabled => onPressed == null || isLoading;

  @override
  Widget build(BuildContext context) {
    final borderRadiusValue = BorderRadius.circular(borderRadius);

    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: isDisabled
              ? null
              : LinearGradient(
            colors: colors,
            begin: begin,
            end: end,
          ),
          color: isDisabled
              ? disabledColor ?? Colors.grey.shade400
              : null,
          borderRadius: borderRadiusValue,
          border: borderWidth > 0
              ? Border.all(
            color: borderColor ?? Colors.transparent,
            width: borderWidth,
          )
              : null,
          boxShadow: isDisabled ? null : boxShadow,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isDisabled ? null : onPressed,
            borderRadius: borderRadiusValue,
            child: Padding(
              padding: padding,
              child: Center(
                child: isLoading
                    ? SizedBox(
                  width: loadingSize,
                  height: loadingSize,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      loadingColor ??
                          textStyle?.color ??
                          Colors.white,
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
                        color: iconColor ??
                            textStyle?.color ??
                            Colors.white,
                      ),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      text,
                      style: textStyle ??
                          const TextStyle(
                            color: Colors.white,
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