import 'package:flutter_test/flutter_test.dart';
import 'package:notas/domain/models/note.dart';

void main() {
  group('Testar os métodos da classe Note:', () {
    test('Verificar se o objeto inicia normalmente', () {
      var note = Note(
        id: 1,
        title: 'Título',
        description: 'Descrição',
        createdAt: '2023-01-01',
        hour: '12:00',
      );

      expect(note.id, 1);
      expect(note.title, 'Título');
      expect(note.description, 'Descrição');
      expect(note.createdAt, '2023-01-01');
      expect(note.hour, '12:00');
    });

    test('Verificar se o objeto aceita valores nulos', () {
      var note = Note(
        id: null,
        title: null,
        description: null,
        createdAt: null,
        hour: null,
      );

      expect(note.id, null);
      expect(note.title, null);
      expect(note.description, null);
      expect(note.createdAt, null);
      expect(note.hour, null);
    });

    test('Testar o copyWith', () {
      var note = Note(
        id: 1,
        title: 'Título',
        description: 'Descrição',
        createdAt: '2023-01-01',
        hour: '12:00',
      );

      var note2 = note.copyWith(
        id: 2,
        title: 'Título 2',
        description: 'Descrição 2',
        createdAt: '2023-01-02',
        hour: '13:00',
      );

      expect(note2.id, 2);
      expect(note2.title, 'Título 2');
      expect(note2.description, 'Descrição 2');
      expect(note2.createdAt, '2023-01-02');
      expect(note2.hour, '13:00');
      expect(note2.id, 2);
      expect(note2.title, 'Título 2');
      expect(note2.description, 'Descrição 2');
      expect(note2.createdAt, '2023-01-02');
      expect(note2.hour, '13:00');
    });

    test('Testar o toMap', () {
      var note = Note(
        id: 1,
        title: 'Título',
        description: 'Descrição',
        createdAt: '2023-01-01',
        hour: '12:00',
      );

      var map = note.toMap();
      expect(map['id'], 1);
      expect(map['title'], 'Título');
      expect(map['description'], 'Descrição');
      expect(map['createdAt'], '2023-01-01');
      expect(map['hour'], '12:00');
    });

    test('Testar o fromMap', () {
      var map = {
        'id': 1,
        'title': 'Título',
        'description': 'Descrição',
        'createdAt': '2023-01-01',
        'hour': '12:00',
      };

      var note = Note.fromMap(map);

      expect(note.id, 1);
      expect(note.title, 'Título');
      expect(note.description, 'Descrição');
      expect(note.createdAt, '2023-01-01');
      expect(note.hour, '12:00');
    });

    test('Testar o toJson', () {
      var note = Note(
        id: 1,
        title: 'Título',
        description: 'Descrição',
        createdAt: '2023-01-01',
        hour: '12:00',
      );

      var json = note.toJson();

      expect(
        json,
        '{'
        '"id":1,'
        '"title":"Título",'
        '"description":"Descrição",'
        '"createdAt":"2023-01-01",'
        '"hour":"12:00"'
        '}',
      );
    });

    test('Testar o fromJson', () {
      var json =
          '{'
          '"id":1,'
          '"title":"Título",'
          '"description":"Descrição",'
          '"createdAt":"2023-01-01",'
          '"hour":"12:00"'
          '}';

      var note = Note.fromJson(json);

      expect(note.id, 1);
      expect(note.title, 'Título');
      expect(note.description, 'Descrição');
      expect(note.createdAt, '2023-01-01');
      expect(note.hour, '12:00');
    });
  });
}
