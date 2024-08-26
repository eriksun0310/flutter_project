import 'package:flutter/material.dart';
class SwitchWidget extends StatefulWidget {
  SwitchWidget(
      {Key? key,
      required this.switchValue,
      required this.switchTitle,
      required this.switchSubTitle}) : super(key: key);

  bool switchValue; // 可變的布林值
  final String switchTitle;
  final String switchSubTitle;
  @override
  State<StatefulWidget> createState() {
    return _SwitchState();
  }
}

class _SwitchState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: widget.switchValue,
      onChanged: (isChecked) {
        setState(() {
          widget.switchValue = isChecked;
        });
      },
      title: Text(
        widget.switchTitle,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
      subtitle: Text(widget.switchSubTitle,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).colorScheme.onSurface)),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
