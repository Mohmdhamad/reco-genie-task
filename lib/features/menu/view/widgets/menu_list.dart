import 'package:flutter/material.dart';
import 'package:reco_genie_task/core/data/menu_data.dart';
import 'package:reco_genie_task/features/menu/view/widgets/menu_card.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemCount: MenuData.menu.length,
      itemBuilder: (context, index) {
        return MenuCard(model: MenuData.menu[index]);
      },
    );
  }
}
