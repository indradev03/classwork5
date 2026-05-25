import 'package:flutter/material.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  // CONTROLLERS
  final bookNameController = TextEditingController();
  final isbnController = TextEditingController();
  final priceController = TextEditingController();

  String? selectedAuthor;

  @override
  void dispose() {
    bookNameController.dispose();
    isbnController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Screen'), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            // BOOK NAME
            TextField(
              controller: bookNameController,
              decoration: const InputDecoration(
                labelText: 'Book Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // ISBN
            TextField(
              controller: isbnController,
              decoration: const InputDecoration(
                labelText: 'ISBN Number',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // PRICE
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Book Price',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // AUTHOR DROPDOWN
            DropdownButtonFormField<String>(
              value: selectedAuthor,
              decoration: const InputDecoration(
                labelText: 'Author',
                border: OutlineInputBorder(),
              ),

              items: const [
                DropdownMenuItem(
                  value: 'J.K Rowling',
                  child: Text('J.K Rowling'),
                ),
                DropdownMenuItem(value: 'Dan Brown', child: Text('Dan Brown')),
                DropdownMenuItem(
                  value: 'Paulo Coelho',
                  child: Text('Paulo Coelho'),
                ),
              ],

              onChanged: (value) {
                setState(() {
                  selectedAuthor = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // ADD BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // PRINT VALUES (for testing)
                  print(bookNameController.text);
                  print(isbnController.text);
                  print(priceController.text);
                  print(selectedAuthor);
                },
                child: const Text('Add Book'),
              ),
            ),

            const SizedBox(height: 20),

            // BOOK LIST UI (STATIC)
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Book ${index + 1}'),
                      subtitle: const Text(
                        'ISBN: 12345\nPrice: Rs 500\nAuthor: J.K Rowling',
                      ),
                      trailing: const Icon(Icons.delete, color: Colors.red),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
