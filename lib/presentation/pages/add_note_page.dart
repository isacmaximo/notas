import 'package:flutter/material.dart';
import 'package:notas/core/utils/input_validators.dart';
import 'package:notas/presentation/components/common/base_page.dart';
import 'package:notas/presentation/components/common/button_with_icon.dart';
import 'package:notas/presentation/components/common/common_input.dart';
import 'package:notas/presentation/components/common/rounded_container_with_border.dart';
import 'package:notas/presentation/controllers/add_note_page_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddNotePage extends StatelessWidget {
  final int? id;
  final AddNotePageController controller;

  const AddNotePage({super.key, this.id, required this.controller});

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
      title: id != null ? 'Editar Nota' : 'Criar Nota',
      child: RoundedContainerWithBorder(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 2.h),
                CommonInput(
                  hintText: 'Título da nota...',
                  labelText: 'Título',
                  controller: controller.titleController,
                  validator: InputValidators.validateRequiredField,
                ),
                SizedBox(height: 2.h),
                CommonInput(
                  hintText: 'Descrição da nota...',
                  labelText: 'Descrição',
                  controller: controller.descriptionController,
                  validator: InputValidators.validateRequiredField,
                  maxLines: 10,
                ),
                SizedBox(height: 2.h),
                SizedBox(
                  width: id != null ? 32.w : 24.w,
                  child: ButtonWithIcon(
                    icon: id != null ? Icons.edit_note : Icons.post_add_sharp,
                    text: id != null ? 'Atualizar' : 'Criar',
                    onPressed:
                        id != null
                            ? () async => await controller.updateNote(context)
                            : () async => await controller.createNote(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
