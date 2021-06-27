import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/widgets/divider/divider_widget.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final bool enablePrimaryColor;
  final bool enableSecondaryColor;
  const SetLabelButtons({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    this.enablePrimaryColor = false,
    this.enableSecondaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      height: 57,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 1,
            height: 1,
            color: AppColors.stroke,
          ),
          Container(
            height: 56,
            child: Row(
              children: [
                Expanded(
                    child: LabelButton(
                  label: primaryLabel,
                  onPressed: primaryOnPressed,
                  style: enablePrimaryColor ? TextStyles.buttonPrimary : null,
                )),
                DividerWidget(),
                Expanded(
                    child: LabelButton(
                  label: secondaryLabel,
                  onPressed: secondaryOnPressed,
                  style: enableSecondaryColor ? TextStyles.buttonPrimary : null,
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle? style;

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
