import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/widgets/divider/divider_widget.dart';

class SetButtonsWidget extends StatelessWidget {
  final String labelPrimary;
  final VoidCallback onTapPrimary;
  final String labelSencondary;
  final VoidCallback onTapSecondary;
  final bool enablePrimaryColor;

  const SetButtonsWidget({
    Key? key,
    required this.labelPrimary,
    required this.onTapPrimary,
    required this.labelSencondary,
    required this.onTapSecondary,
    this.enablePrimaryColor = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      height: 56,
      child: Row(
        children: [
          if (enablePrimaryColor) ...[
            LabelButton.primary(label: labelPrimary, onPressed: onTapPrimary)
          ] else ...[
            LabelButton.heading(label: labelPrimary, onPressed: onTapPrimary)
          ],
          DividerWidget(height: 56),
          LabelButton.heading(label: labelSencondary, onPressed: onTapSecondary)
        ],
      ),
    );
  }
}

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle style;

  const LabelButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.style,
  }) : super(key: key);

  factory LabelButton.heading({
    required String label,
    required VoidCallback onPressed,
  }) {
    return LabelButton(
      label: label,
      onPressed: onPressed,
      style: TextStyles.buttonHeading,
    );
  }

  factory LabelButton.primary({
    required String label,
    required VoidCallback onPressed,
  }) {
    return LabelButton(
      label: label,
      onPressed: onPressed,
      style: TextStyles.buttonPrimary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 56,
        child: TextButton(
          onPressed: onPressed,
          child: Text(label, style: style),
        ),
      ),
    );
  }
}
