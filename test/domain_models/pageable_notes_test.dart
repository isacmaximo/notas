import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:notas/domain/models/note.dart';
import 'package:notas/domain/models/pageable_notes.dart';

void main() {
  group('Testar todos os métodos da classe PageableNotes', () {
    test('Verificar se o objeto inicia normalmente', () {
      var note = Note(
        id: 1,
        title: 'Título',
        description: 'Descrição',
        createdAt: '2023-01-01',
        hour: '12:00',
      );

      var pageable = PageableNotes(page: 1, pageSize: 10, notes: [note]);

      expect(pageable.page, 1);
      expect(pageable.pageSize, 10);
      expect(pageable.notes?.length, 1);
      expect(pageable.notes?.first.title, 'Título');
    });

    test('Verificar se o objeto aceita valores nulos', () {
      var pageable = PageableNotes();

      expect(pageable.page, null);
      expect(pageable.pageSize, null);
      expect(pageable.notes, null);
    });

    test('Testar o copyWith', () {
      var pageable = PageableNotes(page: 1, pageSize: 10, notes: []);
      var copy = pageable.copyWith(page: 2, pageSize: 20);

      expect(copy.page, 2);
      expect(copy.pageSize, 20);
      expect(copy.notes, []);
    });

    test('Testar o toMap', () {
      var note = Note(
        id: 1,
        title: 'Título',
        description: 'Descrição',
        createdAt: '2023-01-01',
        hour: '12:00',
      );

      var pageable = PageableNotes(page: 1, pageSize: 10, notes: [note]);

      var map = pageable.toMap();
      expect(map['page'], 1);
      expect(map['pageSize'], 10);
      expect(map['notes'], isA<List>());
      expect(map['notes'].first['title'], 'Título');
    });

    test('Testar o fromMap', () {
      var map = {
        'page': 1,
        'pageSize': 10,
        'notes': [
          {
            'id': 1,
            'title': 'Título',
            'description': 'Descrição',
            'createdAt': '2023-01-01',
            'hour': '12:00',
          },
        ],
      };

      var pageable = PageableNotes.fromMap(map);

      expect(pageable.page, 1);
      expect(pageable.pageSize, 10);
      expect(pageable.notes?.first.title, 'Título');
    });

    test('Testar o toJson', () {
      var note = Note(
        id: 1,
        title: 'Título',
        description: 'Descrição',
        createdAt: '2023-01-01',
        hour: '12:00',
      );

      var pageable = PageableNotes(page: 1, pageSize: 10, notes: [note]);

      var jsonStr = pageable.toJson();

      var decoded = json.decode(jsonStr);
      expect(decoded['page'], 1);
      expect(decoded['notes'].first['title'], 'Título');
    });

    test('Testar o fromJson', () {
      var jsonStr = json.encode({
        'page': 1,
        'pageSize': 10,
        'notes': [
          {
            'id': 1,
            'title': 'Título',
            'description': 'Descrição',
            'createdAt': '2023-01-01',
            'hour': '12:00',
          },
        ],
      });

      var pageable = PageableNotes.fromJson(jsonStr);

      expect(pageable.page, 1);
      expect(pageable.pageSize, 10);
      expect(pageable.notes?.first.title, 'Título');
    });
  });
}
