import 'package:classwork5/models/author_model.dart';
import 'package:classwork5/models/book_model.dart';
import 'package:classwork5/state/book_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookProvider = NotifierProvider<BookViewModel, BookState>(() {
  return BookViewModel();
});

class BookViewModel extends Notifier<BookState> {
  final List<AuthorModel> authors = [
    AuthorModel(authorName: 'J.K Rowling'),
    AuthorModel(authorName: 'Dan Brown'),
    AuthorModel(authorName: 'Paulo Coelho'),
    AuthorModel(authorName: 'Robert Kiyosaki'),
  ];

  @override
  BookState build() {
    return BookState.initial();
  }

  Future<void> addBook(BookModel book) async {
    state = state.copyWith(isLoading: true);

    await Future.delayed(const Duration(seconds: 1));

    final updatedBooks = [...state.books, book];

    state = state.copyWith(isLoading: false, books: updatedBooks);
  }

  void removeBook(int index) {
    final updatedBooks = List<BookModel>.from(state.books)..removeAt(index);

    state = state.copyWith(books: updatedBooks);
  }

  void clearBooks() {
    state = state.copyWith(books: []);
  }
}
