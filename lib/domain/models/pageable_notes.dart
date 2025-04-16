import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:notas/domain/models/note.dart';

class PageableNotes {
  int? page;
  int? pageSize;
  List<Note>? notes;

  PageableNotes({this.page, this.pageSize, this.notes});

  PageableNotes copyWith({int? page, int? pageSize, List<Note>? notes}) {
    return PageableNotes(
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'pageSize': pageSize,
      'notes': notes?.map((x) => x.toMap()).toList(),
    };
  }

  factory PageableNotes.fromMap(Map<String, dynamic> map) {
    return PageableNotes(
      page: map['page'] != null ? map['page'] as int : null,
      pageSize: map['pageSize'] != null ? map['pageSize'] as int : null,
      notes:
          map['notes'] != null
              ? List<Note>.from(
                (map['notes'] as List<dynamic>).map<Note?>(
                  (x) => Note.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PageableNotes.fromJson(String source) =>
      PageableNotes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PageableNotes(page: $page, pageSize: $pageSize, notes: $notes)';

  @override
  bool operator ==(covariant PageableNotes other) {
    if (identical(this, other)) return true;

    return other.page == page &&
        other.pageSize == pageSize &&
        listEquals(other.notes, notes);
  }

  @override
  int get hashCode => page.hashCode ^ pageSize.hashCode ^ notes.hashCode;
}
