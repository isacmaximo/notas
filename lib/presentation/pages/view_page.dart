import 'package:flutter/material.dart';
import 'package:notas/presentation/components/common/base_page.dart';
import 'package:notas/presentation/components/common/rounded_container_with_border.dart';
import 'package:notas/presentation/controllers/view_note_page_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewPage extends StatelessWidget {
  final int? id;
  final ViewNotePageController controller;

  const ViewPage({super.key, this.id, required this.controller});

  @override
  Widget build(BuildContext context) {
    if (id != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await controller.loadNote(id!, context);
      });
    }
    return BasePage(
      leading: IconButton(
        onPressed: () => controller.goHome(context),
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
      ),
      title: 'Vizualização',
      child: ListenableBuilder(
        listenable: controller,
        builder:
            (context, child) => RoundedContainerWithBorder(
              width: 100.w,
              height: 100.h,
              color: Colors.white,
              child: RoundedContainerWithBorder(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 2.h),
                      Text(
                        'Título',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      RoundedContainerWithBorder(
                        color: Colors.amber[100],
                        width: 80.w,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          controller.currentNote?.title ?? '',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Descrição',

                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      RoundedContainerWithBorder(
                        color: Colors.amber[100],
                        width: 80.w,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          controller.currentNote?.description ?? '',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
