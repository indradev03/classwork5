import 'package:classwork5/models/author_model.dart';
import 'package:uuid/uuid.dart';

class BookModel {
  final String bookId;
  final String bookName;
  final String isbnNumber;
  final double bookPrice;
  final AuthorModel author;

  BookModel({
    String? bookId,
    required this.bookName,
    required this.isbnNumber,
    required this.bookPrice,
    required this.author,
  }) : bookId = bookId ?? const Uuid().v4();
}
