import 'package:flutter/material.dart';

import '../constants/constants.dart';

class LanguageToggleButton extends StatelessWidget {
  final bool isRussian;
  final void Function(bool toRussian) onToggle;

  const LanguageToggleButton({
    super.key,
    required this.isRussian,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    // Sizes
    double containerWidth = 130;
    double containerHeight = 50;
    double flagDiameter = 40;

    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        color: AppColors.creamyIvory.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppColors.antiqueGold.withOpacity(0.6),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // English Flag with tap
          GestureDetector(
            onTap: () {
              if (isRussian) {
                onToggle(false);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: !isRussian ? AppColors.gildedEmerald : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Opacity(
                opacity: isRussian ? 0.3 : 1.0,
                child: CircleAvatar(
                  radius: flagDiameter / 2,
                  backgroundImage: AssetImage(enFlag),  // Please add this asset in your project
                ),
              ),
            ),
          ),

          // Russian Flag with tap
          GestureDetector(
            onTap: () {
              if (!isRussian) {
                onToggle(true);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isRussian ? AppColors.gildedEmerald : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Opacity(
                opacity: isRussian ? 1.0 : 0.3,
                child: CircleAvatar(
                  radius: flagDiameter / 2,
                  backgroundImage: AssetImage(ruFlag),  // Please add this asset in your project
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}