import 'package:flutter/material.dart';
import 'package:notas/domain/models/note.dart';
import 'package:notas/presentation/components/cards/note_list_view_card.dart';
import 'package:notas/presentation/components/common/rounded_container_with_border.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScrollableNotes extends StatelessWidget {
  final List<Note> notes;
  final ScrollController controller;
  final void Function(BuildContext context, int id) goToEditNotePage;
  final Future<void> Function(BuildContext context, int id) deleteNote;
  final Future<void> Function(BuildContext context, int id) goToViewNotePage;

  const ScrollableNotes({
    super.key,
    required this.notes,
    required this.controller,
    required this.goToEditNotePage,
    required this.deleteNote,
    required this.goToViewNotePage,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: RoundedContainerWithBorder(
        color: Colors.amber[100],
        child: Scrollbar(
          controller: controller,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: controller,
            child: Column(
              children:
                  notes.isNotEmpty
                      ? notes.map((note) {
                        return NoteListViewCard(
                          note: note,
                          goToEditNotePage: goToEditNotePage,
                          deleteNote: deleteNote,
                          goToViewNotePage: goToViewNotePage,
                        );
                      }).toList()
                      : [
                        SizedBox(height: 40.h),
                        Center(
                          child: Text(
                            'Nenhuma nota encontrada!',
                            style: TextStyle(fontSize: 20),
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
