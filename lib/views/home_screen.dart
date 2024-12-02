import 'package:crud_getx/controller/note_controller.dart';
import 'package:crud_getx/routes/route_names.dart';
import 'package:crud_getx/utils/colors.dart';
import 'package:crud_getx/utils/modify_text.dart';
import 'package:crud_getx/widget/custom_single_note.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _controller = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.primaryColor,
        onPressed: () => Get.toNamed(RouteNames.noteScreen),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Container(
        color: AppColors.backgroundColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                children: [
                  const ModifyText(
                      text: "My Notes", color: Colors.black, size: 30),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.menu,
                            size: 25,
                          )),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            size: 25,
                          )),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: Obx(
                    () => _controller.notes.isEmpty
                        ? const Center(
                            child: ModifyText(
                              text: "No Notes Available?",
                              color: Colors.black,
                              size: 16,
                            ),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.vertical,
                            primary: false,
                            itemCount: _controller.notes.length,
                            // reverse: true,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final createdDateFormat = DateFormat.yMMMMd()
                                  .format(_controller.notes[index].createdDate);
                              final createdTimeFormat = DateFormat.jm()
                                  .format(_controller.notes[index].createdDate);
                              return CustomSingleNote(
                                  title: _controller.notes[index].title,
                                  description:
                                      _controller.notes[index].description,
                                  date:
                                      '$createdDateFormat - $createdTimeFormat');
                            }),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
