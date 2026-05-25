import 'package:classwork5/models/author_model.dart';
import 'package:classwork5/models/book_model.dart';
import 'package:classwork5/view_models/book_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookScreen extends ConsumerStatefulWidget {
  const BookScreen({super.key});

  @override
  ConsumerState<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends ConsumerState<BookScreen> {
  final bookNameController = TextEditingController();
  final isbnController = TextEditingController();
  final priceController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  AuthorModel? selectedAuthor;

  @override
  void dispose() {
    bookNameController.dispose();
    isbnController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bookState = ref.watch(bookProvider);
    final bookVM = ref.read(bookProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text("Book Screen"), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: _formKey,

          child: Column(
            children: [
              // BOOK NAME
              TextFormField(
                controller: bookNameController,
                decoration: const InputDecoration(
                  labelText: "Book Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? "Enter book name" : null,
              ),

              const SizedBox(height: 10),

              // ISBN
              TextFormField(
                controller: isbnController,
                decoration: const InputDecoration(
                  labelText: "ISBN",
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? "Enter ISBN" : null,
              ),

              const SizedBox(height: 10),

              // PRICE
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Price",
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? "Enter price" : null,
              ),

              const SizedBox(height: 10),

              // AUTHOR DROPDOWN
              DropdownButtonFormField<AuthorModel>(
                value: selectedAuthor,
                decoration: const InputDecoration(
                  labelText: "Author",
                  border: OutlineInputBorder(),
                ),

                items: bookVM.authors
                    .map(
                      (a) =>
                          DropdownMenuItem(value: a, child: Text(a.authorName)),
                    )
                    .toList(),

                onChanged: (value) {
                  setState(() {
                    selectedAuthor = value;
                  });
                },

                validator: (value) => value == null ? "Select author" : null,
              ),

              const SizedBox(height: 15),

              // ADD BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final book = BookModel(
                        bookName: bookNameController.text,
                        isbnNumber: isbnController.text,
                        bookPrice: double.parse(priceController.text),
                        author: selectedAuthor!,
                      );

                      ref.read(bookProvider.notifier).addBook(book);

                      bookNameController.clear();
                      isbnController.clear();
                      priceController.clear();

                      setState(() {
                        selectedAuthor = null;
                      });
                    }
                  },
                  child: const Text("Add Book"),
                ),
              ),

              const SizedBox(height: 20),

              // LIST
              Expanded(
                child: bookState.books.isEmpty
                    ? const Center(child: Text("No Books Found"))
                    : Column(
                        children: [
                          // CLEAR
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {
                                ref.read(bookProvider.notifier).clearBooks();
                              },
                              child: const Text("Clear All"),
                            ),
                          ),

                          Expanded(
                            child: ListView.builder(
                              itemCount: bookState.books.length,
                              itemBuilder: (context, index) {
                                final book = bookState.books[index];

                                return Card(
                                  child: ListTile(
                                    title: Text(book.bookName),
                                    subtitle: Text(
                                      "ISBN: ${book.isbnNumber}\n"
                                      "Price: ${book.bookPrice}\n"
                                      "Author: ${book.author.authorName}",
                                    ),

                                    trailing: IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        bookVM.removeBook(index);
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
