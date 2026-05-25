import 'package:uuid/uuid.dart';

class AuthorModel {
  final String authorId;
  final String authorName;

  AuthorModel({String? authorId, required this.authorName})
    : authorId = authorId ?? const Uuid().v4();
}
