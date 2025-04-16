import 'package:notas/data/datasources/local/note_local_datasource.dart';
import 'package:notas/data/repositories/note_repository_impl.dart';
import 'package:notas/domain/usecases/create_note_use_case.dart';
import 'package:notas/domain/usecases/delete_note_use_case.dart';
import 'package:notas/domain/usecases/get_note_by_id_use_case.dart';
import 'package:notas/domain/usecases/get_notes_use_case.dart';
import 'package:notas/domain/usecases/get_total_pages_note_use_case.dart';
import 'package:notas/domain/usecases/update_note_use_case.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> _sharedProviders = [
  Provider(lazy: true, create: (ctx) => CreateNoteUseCase(ctx.read())),
  Provider(lazy: true, create: (ctx) => GetNoteByIdUseCase(ctx.read())),
  Provider(lazy: true, create: (ctx) => DeleteNoteUseCase(ctx.read())),
  Provider(lazy: true, create: (ctx) => UpdateNoteUseCase(ctx.read())),
  Provider(lazy: true, create: (ctx) => GetNotesUseCase(ctx.read())),
  Provider(lazy: true, create: (ctx) => GetTotalPagesNoteUseCase(ctx.read())),
];

List<SingleChildWidget> get providers {
  return [
    //Provider(create: (ctx) => SharedLocalStorage()),
    Provider(create: (ctx) => NoteLocalDataSource()),
    Provider(create: (ctx) => NoteRepositoryImpl(ctx.read())),
    ..._sharedProviders,
  ];
}
