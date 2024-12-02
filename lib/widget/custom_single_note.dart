import 'package:crud_getx/controller/note_controller.dart';
import 'package:crud_getx/routes/route_names.dart';
import 'package:crud_getx/utils/colors.dart';
import 'package:crud_getx/utils/modify_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomSingleNote extends StatelessWidget {
  // final String title;
  // final String description;
  // final String date;
  final int index;

  const CustomSingleNote(
      {super.key,
      // required this.title,
      // required this.description,
      // required this.date,
      required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NoteController());
    final note = controller.notes.elementAt(index);
    final createdDateFormat =
        DateFormat.yMMMMd().format(controller.notes[index].createdDate);
    final createdTimeFormat =
        DateFormat.jm().format(controller.notes[index].createdDate);

    final updateDateFormat = DateFormat.yMMMMd()
        .format(controller.notes[index].updatedDate ?? DateTime.now());
    final updateTimeFormat = DateFormat.jm()
        .format(controller.notes[index].updatedDate ?? DateTime.now());
    return InkWell(
      onTap: () {
        Get.toNamed(RouteNames.noteScreen, arguments: {
          "isUpdate": true,
          "note": note,
          "index": index,
        });
      },
      child: Container(
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
                  note.description,
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
                    note.updatedDate != null
                        ? ModifyText(
                            text: '$updateDateFormat - $updateTimeFormat',
                            color: Colors.black,
                            size: 10)
                        : const SizedBox.shrink(),
                    InkWell(
                        onTap: () {
                          print(index);
                          controller.deleteNote(index);
                        },
                        child: const Icon(Icons.delete)),
                  ],
                )
              ],
            ),
            title: Text(
              note.title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            )),
      ),
    );
  }
}
