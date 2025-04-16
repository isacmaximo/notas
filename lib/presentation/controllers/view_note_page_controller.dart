import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:notas/domain/models/note.dart';
import 'package:notas/domain/usecases/get_note_by_id_use_case.dart';

class ViewNotePageController extends ChangeNotifier {
  final GetNoteByIdUseCase _getNoteByIdUseCase;

  ViewNotePageController(this._getNoteByIdUseCase);

  Note? currentNote;

  Future<void> loadNote(int id, BuildContext context) async {
    try {
      if (context.mounted) {
        currentNote = await _getNoteByIdUseCase.execute(id);
      }
      log('Nota carregada: $currentNote');
    } catch (e) {
      log('Erro ao carregar nota: ${e.toString()}');
      await EasyLoading.showError('Erro ao carregar nota');
    }
    notifyListeners();
  }

  void goHome(BuildContext context) {
    if (context.mounted) {
      context.go('/');
    }
  }

  @override
  void dispose() {
    currentNote = null;
    super.dispose();
  }
}
