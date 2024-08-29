import 'dart:convert';

import 'package:collection/collection.dart';

class Task {
  String id;
  String user;
  String title;
  String? description;
  bool completed;
  DateTime? createdAt;
  DateTime? updatedAt;

  Task({
    required this.id,
    required this.user,
    required this.title,
    this.description,
    required this.completed,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Task(id: $id, user: $user, title: $title, description: $description, completed: $completed, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory Task.fromMap(Map<dynamic, dynamic> data) => Task(
        id: data['_id'] as String,
        user: data['user'] as String,
        title: data['title'] as String,
        description: data['description'] as String?,
        completed: data['completed'] as bool,
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
      );

  Map<String, dynamic> toMap() => {
        '_id': id,
        'user': user,
        'title': title,
        'description': description,
        'completed': completed,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };

  /// Parses the string and returns the resulting Json object as [Task].
  factory Task.fromJson(String data) {
    return Task.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// Converts [Task] to a JSON string.
  String toJson() => json.encode(toMap());

  Task copyWith({
    String? id,
    String? user,
    String? title,
    String? description,
    bool? completed,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Task(
      id: id ?? this.id,
      user: user ?? this.user,
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Task) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      user.hashCode ^
      title.hashCode ^
      description.hashCode ^
      completed.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
