import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  SwitchWidget(
      {super.key,
      required this.switchValue,
      required this.switchTitle,
      required this.switchSubTitle,
      required this.onChange});

  bool switchValue; // 可變的布林值
  final String switchTitle;
  final String switchSubTitle;
  final ValueChanged<bool> onChange; //變更switch state 的回調函數

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: switchValue,
      onChanged: (isChecked) {
        onChange(isChecked);
      },
      title: Text(
        switchTitle,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
      subtitle: Text(switchSubTitle,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).colorScheme.onSurface)),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
