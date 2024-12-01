import 'package:crud_getx/utils/colors.dart';
import 'package:crud_getx/utils/modify_text.dart';
import 'package:flutter/material.dart';

class CustomSingleNote extends StatelessWidget {
  const CustomSingleNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(
          color: Colors.black.withOpacity(0.3),
        ),
      ),
      child: ListTile(
        horizontalTitleGap: 0,
        leading: Container(
          height: 13,
          width: 13,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.backgroundColor),
        ),
        subtitle: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ModifyText(
                text: "Hi There this is a test notes",
                color: Colors.black,
                size: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ModifyText(text: "12/01/24", color: Colors.black, size: 10),
                Icon(Icons.delete),
              ],
            )
          ],
        ),
        title: const ModifyText(
          text: 'Software Developer',
          color: Colors.black,
          size: 16,
        ),
      ),
    );
  }
}
