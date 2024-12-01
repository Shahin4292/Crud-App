import 'package:crud_getx/utils/colors.dart';
import 'package:crud_getx/utils/modify_text.dart';
import 'package:flutter/material.dart';

class CustomSingleNote extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  const CustomSingleNote(
      {super.key,
      required this.title,
      required this.description,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ModifyText(text: date, color: Colors.black, size: 10),
                  InkWell(onTap: () {}, child: const Icon(Icons.delete)),
                ],
              )
            ],
          ),
          title: Text(
            title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          )),
    );
  }
}
