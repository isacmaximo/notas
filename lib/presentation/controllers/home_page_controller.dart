import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:notas/core/utils/popup_utils.dart';
import 'package:notas/domain/models/note.dart';
import 'package:notas/domain/usecases/delete_note_use_case.dart';
import 'package:notas/domain/usecases/get_notes_use_case.dart';
import 'package:notas/domain/usecases/get_total_pages_note_use_case.dart';

class HomePageController extends ChangeNotifier {
  final GetNotesUseCase _getNotesUseCase;
  final DeleteNoteUseCase _deleteNoteUseCase;
  final GetTotalPagesNoteUseCase _getTotalPagesNoteUseCase;

  HomePageController(
    this._getNotesUseCase,
    this._deleteNoteUseCase,
    this._getTotalPagesNoteUseCase,
  ) {
    getNotes();
  }

  final ScrollController scrollController = ScrollController();

  List<Note> notes = [];

  int page = 1;
  int pageSize = 10;
  int totalPages = 1;

  bool canLoadMoreNotes() {
    return page < totalPages;
  }

  Future<void> getNotes() async {
    List<Note> result = await _getNotesUseCase.execute(page, pageSize);
    totalPages = await _getTotalPagesNoteUseCase.execute(pageSize);
    notes = result;
    notifyListeners();
  }

  bool canLoadMinusNotes() {
    return page > 1;
  }

  Future<void> loadMoreNotes() async {
    page++;
    await getNotes();
    notifyListeners();
  }

  Future<void> loadMinusNotes() async {
    if (page > 1) {
      page--;
      await getNotes();
      notifyListeners();
    }
  }

  Future<void> viewNote(BuildContext context, int id) {
    if (context.mounted) {
      context.go('/view-note?id=$id');
    }
    return Future.value();
  }

  void goToAddNotePage(BuildContext context) {
    if (context.mounted) {
      context.go('/add-note');
    }
  }

  void goToEditNotePage(BuildContext context, int id) {
    if (context.mounted) {
      context.go('/add-note?id=$id');
    }
  }

  Future<void> deleteNote(BuildContext context, int id) async {
    try {
      await PopupUtils.showYesNoPopup(
        context,
        'Atenção!',
        'Deseja realmente deletar essa nota?',
        () async {
          await _deleteNoteUseCase.execute(id);
          page = 1;
          await getNotes();
          if (context.mounted) {
            context.pop();
          }
          await EasyLoading.showSuccess('Nota deletada com sucesso!');
        },
        () {
          if (context.mounted) {
            context.pop();
          }
        },
      );
      notifyListeners();
    } catch (e) {
      await EasyLoading.showError('Erro ao deletar nota');
    }
    notifyListeners();
  }

  void clearNotes() {
    notes.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
