import 'package:flutter/material.dart';

class AdvancedToggleButton extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  final String activeText;
  final String inactiveText;

  final IconData? activeIcon;
  final IconData? inactiveIcon;

  final Color activeColor;
  final Color inactiveColor;

  final Color? activeTextColor;
  final Color? inactiveTextColor;

  final TextStyle? textStyle;

  final double? width;
  final double height;
  final double borderRadius;

  final EdgeInsetsGeometry padding;

  final Duration animationDuration;
  final Curve animationCurve;

  final bool enabled;

  const AdvancedToggleButton({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeText = 'ON',
    this.inactiveText = 'OFF',
    this.activeIcon,
    this.inactiveIcon,
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.grey,
    this.activeTextColor,
    this.inactiveTextColor,
    this.textStyle,
    this.width,
    this.height = 48,
    this.borderRadius = 24,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.animationDuration = const Duration(milliseconds: 250),
    this.animationCurve = Curves.easeInOut,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
    value ? activeColor : inactiveColor;

    final Color foregroundColor = value
        ? activeTextColor ?? Colors.white
        : inactiveTextColor ?? Colors.white;

    final IconData? currentIcon =
    value ? activeIcon : inactiveIcon;

    final String currentText =
    value ? activeText : inactiveText;

    return Semantics(
      button: true,
      toggled: value,
      enabled: enabled,
      label: currentText,
      child: GestureDetector(
        onTap: enabled
            ? () {
          onChanged(!value);
        }
            : null,
        child: AnimatedContainer(
          duration: animationDuration,
          curve: animationCurve,
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            color: enabled
                ? backgroundColor
                : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: AnimatedSwitcher(
            duration: animationDuration,
            switchInCurve: animationCurve,
            switchOutCurve: animationCurve,
            child: Row(
              key: ValueKey(value),
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (currentIcon != null) ...[
                  Icon(
                    currentIcon,
                    size: 20,
                    color: foregroundColor,
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  currentText,
                  style: textStyle ??
                      TextStyle(
                        color: foregroundColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}