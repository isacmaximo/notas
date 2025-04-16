import 'package:go_router/go_router.dart';
import 'package:notas/presentation/controllers/add_note_page_controller.dart';
import 'package:notas/presentation/controllers/home_page_controller.dart';
import 'package:notas/presentation/controllers/view_note_page_controller.dart';
import 'package:notas/presentation/pages/add_note_page.dart';
import 'package:notas/presentation/pages/home_page.dart';
import 'package:notas/presentation/pages/view_page.dart';
import 'package:provider/provider.dart';

GoRouter router() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder:
            (context, state) => HomePage(
              controller: HomePageController(
                context.read(),
                context.read(),
                context.read(),
              ),
            ),
      ),
      GoRoute(
        path: '/add-note',
        builder: (context, state) {
          int? id;
          String? idString = state.uri.queryParameters['id'];

          if (idString != null) {
            id = int.parse(idString);
          }

          return AddNotePage(
            controller: AddNotePageController(
              context.read(),
              context.read(),
              context.read(),
            ),
            id: id,
          );
        },
      ),
      GoRoute(
        path: '/view-note',
        builder: (context, state) {
          int? id;
          String? idString = state.uri.queryParameters['id'];

          if (idString != null) {
            id = int.parse(idString);
          }

          return ViewPage(
            controller: ViewNotePageController(context.read()),
            id: id,
          );
        },
      ),
    ],
  );
}
