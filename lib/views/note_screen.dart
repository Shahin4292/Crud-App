import 'package:crud_getx/model/notes_model.dart';
import 'package:crud_getx/utils/colors.dart';
import 'package:crud_getx/utils/modify_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/note_controller.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NoteController());
    final arg = Get.arguments != null
        ? Get.arguments as Map
        : {
            "isUpdate": false,
            "note": null,
          };
    final bool isUpdate = arg["isUpdate"] ?? false;
    final note = arg["note"] == null ? null : arg["note"] as NotesModel;
    final int? index = arg["index"] == null ? null : arg["index"] as int;

    final titleController =
        TextEditingController(text: isUpdate ? note!.title : null);
    final descriptionController =
        TextEditingController(text: isUpdate ? note!.description : null);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.backgroundColor,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.link,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              size: 20,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 20),
        child: ElevatedButton(
          onPressed: () {
            if (titleController.text.isEmpty ||
                descriptionController.text.isEmpty) {
              Get.snackbar('Error', "Title and Description are required?");
            } else {
              isUpdate
                  ? controller.updateNote(
                      index!,
                      NotesModel(
                        title: titleController.text,
                        description: descriptionController.text,
                        createdDate: note!.createdDate,
                        updatedDate: DateTime.now(),
                      ))
                  : controller.addNote(
                      NotesModel(
                        title: titleController.text,
                        description: descriptionController.text,
                        createdDate: DateTime.now(),
                      ),
                    );
              Get.back();
            }
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: AppColors.primaryColor,
              fixedSize: Size(MediaQuery.sizeOf(context).width, 50)),
          child: const ModifyText(
            text: 'Save Changes',
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              maxLines: 2,
              minLines: 1,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Colors.black),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
                // hintStyle: TextStyle(
                //     fontWeight: FontWeight.w700,
                //     fontSize: 30,
                //     color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: TextFormField(
                controller: descriptionController,
                minLines: 30,
                maxLines: 30,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Description",
                  // hintStyle: TextStyle(
                  //     color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
