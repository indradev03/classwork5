import 'package:classwork5/models/book_model.dart';

class BookState {
  final bool isLoading;
  final List<BookModel> books;

  BookState({required this.isLoading, required this.books});

  factory BookState.initial() {
    return BookState(isLoading: false, books: []);
  }

  BookState copyWith({bool? isLoading, List<BookModel>? books}) {
    return BookState(
      isLoading: isLoading ?? this.isLoading,
      books: books ?? this.books,
    );
  }
}
