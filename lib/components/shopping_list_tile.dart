import 'package:flutter/material.dart';

class ShoppingListTile extends StatelessWidget {
  final String title;
  final IconData iconData;
  final void Function()? onTap;
  const ShoppingListTile({
    super.key,
    required this.title,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedColor: Theme.of(context).colorScheme.primary,
      title: Text(
        title,
      ),
      leading: Icon(iconData),
      onTap: onTap,
    );
  }
}
