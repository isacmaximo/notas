import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:notas/core/utils/custom_data.dart';
import 'package:notas/domain/models/note.dart';
import 'package:notas/domain/usecases/create_note_use_case.dart';
import 'package:notas/domain/usecases/get_note_by_id_use_case.dart';
import 'package:notas/domain/usecases/update_note_use_case.dart';

class AddNotePageController extends ChangeNotifier {
  final CreateNoteUseCase _createNoteUseCase;
  final UpdateNoteUseCase _updateNoteUseCase;
  final GetNoteByIdUseCase _getNoteByIdUseCase;

  AddNotePageController(
    this._createNoteUseCase,
    this._updateNoteUseCase,
    this._getNoteByIdUseCase,
  );

  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Note? currentNote;

  Future<void> loadNote(int id, BuildContext context) async {
    try {
      if (context.mounted) {
        currentNote = await _getNoteByIdUseCase.execute(id);
        if (currentNote != null) {
          setCurrentNote(currentNote!);
        }
      }
    } catch (e) {
      log('Erro ao carregar nota: ${e.toString()}');
      await EasyLoading.showError('Erro ao carregar nota');
    }
    notifyListeners();
  }

  void getCurrentNoteUpdated() {
    final now = DateTime.now();
    int? currentNoteId = currentNote?.id;
    currentNote = Note(
      id: currentNoteId,
      title: titleController.text,
      description: descriptionController.text,
      createdAt: CustomData.dateTimeToDateBr(now),
      hour: CustomData.dateTimeToHourBr(now),
    );
  }

  Future<void> createNote(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        getCurrentNoteUpdated();
        await _createNoteUseCase.execute(currentNote!).whenComplete(() {
          clearCurrentNote();
        });
        await EasyLoading.showSuccess('Nota criada com sucesso!');
        if (context.mounted) {
          FocusScope.of(context).unfocus();
        }
      } catch (e) {
        log('Erro ao criar nota: ${e.toString()}');
        await EasyLoading.showError('Erro ao criar nota');
      }
    }
    notifyListeners();
  }

  Future<void> updateNote(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        getCurrentNoteUpdated();
        await Future.wait([
          _updateNoteUseCase.execute(currentNote!),
          _getNoteByIdUseCase.execute(currentNote!.id!).then((note) {
            setCurrentNote(note);
          }),
        ]);
        await EasyLoading.showSuccess('Nota atualizada com sucesso!');
        if (context.mounted) {
          FocusScope.of(context).unfocus();
        }
      } catch (e) {
        log('Erro ao atualizar nota: ${e.toString()}');
        await EasyLoading.showError('Erro ao atualizar nota');
      }
    }
    notifyListeners();
  }

  Future<void> getNoteById(int id) async {
    try {
      final note = await _getNoteByIdUseCase.execute(id);
      setCurrentNote(note);
    } catch (e) {
      log('Erro ao buscar nota: ${e.toString()}');
      await EasyLoading.showError('Erro ao buscar nota');
    }
    notifyListeners();
  }

  void setCurrentNote(Note note) {
    currentNote = note;
    titleController.text = note.title ?? '';
    descriptionController.text = note.description ?? '';
  }

  void goHome(BuildContext context) {
    clearCurrentNote();
    if (context.mounted) {
      context.go('/');
    }
  }

  void clearCurrentNote() {
    currentNote = null;
    titleController.clear();
    descriptionController.clear();
  }
}
