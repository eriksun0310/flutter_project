import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  const DrawerList(
      {super.key,
      required this.title,
      required this.icon,
      required this.onSelectScreen});

  final String title;
  final IconData icon;
  final void Function(String title) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.onSurface, fontSize: 24),
      ),
      onTap: () {
        onSelectScreen(title);
      },
    );
  }
}
