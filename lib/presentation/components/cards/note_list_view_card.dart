import 'package:flutter/material.dart';
import 'package:notas/domain/models/note.dart';
import 'package:notas/presentation/components/common/menu_item_with_icon.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NoteListViewCard extends StatelessWidget {
  final Note note;
  final void Function()? onTap;
  final void Function(BuildContext context, int id) goToEditNotePage;
  final Future<void> Function(BuildContext context, int id) deleteNote;
  final Future<void> Function(BuildContext context, int id) goToViewNotePage;

  const NoteListViewCard({
    super.key,
    required this.note,
    this.onTap,
    required this.goToEditNotePage,
    required this.deleteNote,
    required this.goToViewNotePage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5.w),
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          contentPadding: EdgeInsets.only(
            left: 5.w,
            right: 0.w,
            top: 1.h,
            bottom: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.black),
          ),
          trailing: PopupMenuButton<String>(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            position: PopupMenuPosition.under,

            borderRadius: BorderRadius.all(Radius.circular(10)),
            onSelected: (value) async {
              if (value == 'view') {
                goToViewNotePage(context, note.id!);
              } else if (value == 'edit') {
                goToEditNotePage(context, note.id!);
              } else if (value == 'delete') {
                await deleteNote(context, note.id!);
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'view',
                  child: MenuItemWithIcon(
                    icon: Icons.remove_red_eye,
                    iconColor: Colors.blueGrey,
                    text: 'Ver',
                  ),
                ),
                PopupMenuItem(
                  value: 'edit',
                  child: MenuItemWithIcon(
                    icon: Icons.edit,
                    iconColor: Colors.deepPurple,
                    text: 'Editar',
                  ),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: MenuItemWithIcon(
                    icon: Icons.delete,
                    iconColor: Colors.red,
                    text: 'Deletar',
                  ),
                ),
              ];
            },
          ),
          tileColor: Colors.amber[500],
          title: Text(
            note.title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'Data: ${note.createdAt ?? '...'}\nHora: ${note.hour ?? '...'}',
            style: TextStyle(fontSize: 15.sp),
          ),
        ),
      ),
    );
  }
}
