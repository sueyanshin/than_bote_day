// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class DataModel {
  final String title;
  final List<String> content;

  DataModel({
    required this.title,
    required this.content,
  });

  DataModel copyWith({
    String? title,
    List<String>? content,
  }) {
    return DataModel(
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
        title: map['title'] as String,
        content: List<String>.from(
          (map['content'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) =>
      DataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DataModel(title: $title, content: $content)';

  @override
  bool operator ==(covariant DataModel other) {
    if (identical(this, other)) return true;

    return other.title == title && listEquals(other.content, content);
  }

  @override
  int get hashCode => title.hashCode ^ content.hashCode;
}
