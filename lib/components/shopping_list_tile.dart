import 'package:flutter/material.dart';

class ShoppingListTile extends StatelessWidget {
  final String title;
  final IconData iconData;
  final void Function()? onTap;
  final Widget? trailingWidget;
  const ShoppingListTile({
    super.key,
    required this.title,
    required this.iconData,
    required this.onTap,
    required this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedColor: Theme.of(context).colorScheme.primary,
      title: Text(
        title,
      ),
      leading: Icon(iconData),
      trailing: trailingWidget,
      onTap: onTap,
    );
  }
}
