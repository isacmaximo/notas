import 'package:flutter/material.dart';
import 'package:notas/presentation/components/buttons/pageable_buttons.dart';
import 'package:notas/presentation/components/common/base_page.dart';
import 'package:notas/presentation/components/common/button_with_icon.dart';
import 'package:notas/presentation/components/scrollable/scrollable_notes.dart';
import 'package:notas/presentation/controllers/home_page_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatelessWidget {
  final HomePageController controller;

  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return BasePage(
          title: 'Notas',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ScrollableNotes(
                  notes: controller.notes,
                  controller: controller.scrollController,
                  goToEditNotePage: controller.goToEditNotePage,
                  deleteNote: controller.deleteNote,
                  goToViewNotePage: controller.viewNote,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PageableButtons(
                    show: controller.notes.isNotEmpty,
                    canLoadMoreNotes: controller.canLoadMoreNotes(),
                    canLoadMinusNotes: controller.canLoadMinusNotes(),
                    onPressedMore: controller.loadMoreNotes,
                    onPressedLess: controller.loadMinusNotes,
                    page: controller.page.toString(),
                  ),
                  controller.notes.isNotEmpty
                      ? SizedBox(width: 4.w)
                      : SizedBox(),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ButtonWithIcon(
                      icon: Icons.add,
                      text: 'Criar Nova Nota',
                      onPressed: () => controller.goToAddNotePage(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
