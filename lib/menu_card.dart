import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String title;
  final List<String> menu;
  final ValueChanged<String>? onMenuChanged;

  const MenuCard({
    required this.title,
    required this.menu,
    this.onMenuChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: menu.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(menu[index]),
                onTap: () {
                  if (onMenuChanged != null) {
                    onMenuChanged!(menu[index]);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
