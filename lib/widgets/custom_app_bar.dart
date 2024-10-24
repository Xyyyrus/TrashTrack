import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showLegendIcon;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showLegendIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: Text(title),
      actions: [
        if (showLegendIcon)
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              _showLegendsDialog(context);
            },
          ),
      ],
    );
  }

  void _showLegendsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Map Legends'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _legendItem('lib/assets/images/user.png', 'Your location'),
              _legendItem('lib/assets/images/truck.png', 'Driver location'),
              _legendItem(
                  'lib/assets/images/trash-bin.png', 'Collection point'),
              _legendItem('lib/assets/images/green-go.png', 'Start point'),
              _legendItem('lib/assets/images/red-stop.png', 'End point'),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _legendItem(String imagePath, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(imagePath, width: 24, height: 24),
          const SizedBox(width: 16),
          Text(description),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
