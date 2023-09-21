import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util/app_color_palette.dart';
import '../../../util/base_styles.dart';

class CustomTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Color selectedColor;

  CustomTab({
    required this.label,
    required this.isSelected,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        children: [
          Text(label),
          const SizedBox(width: 10),
          Container(
            width: 35.0,
            height: 25.0,
            decoration: BoxDecoration(
              color: isSelected ? selectedColor : AppColorPalette.violet,
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('12'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
