import 'package:crud_getx/routes/route_names.dart';
import 'package:crud_getx/utils/colors.dart';
import 'package:crud_getx/utils/modify_text.dart';
import 'package:crud_getx/widget/custom_single_note.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      primary: false,
                      itemCount: 15,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => const CustomSingleNote(
                        title: 'shahin',
                        description:
                            'kksdkfsdfkksdjfskdfjdkfjsdkfjkfjskfjsdkfjsdkfjddsfueioruweiruierujfdfjdkgjlsdfsdkfk',
                        date: '23/33/33',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
