import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Screen'), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            // BOOK NAME
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Book Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // ISBN
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'ISBN Number',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // PRICE
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Book Price',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // AUTHOR DROPDOWN
            DropdownButtonFormField<String>(
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

              onChanged: (value) {},
            ),

            const SizedBox(height: 20),

            // ADD BUTTON
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {},

                child: const Text('Add Book'),
              ),
            ),

            const SizedBox(height: 20),

            // BOOK LIST UI
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

                      trailing: IconButton(
                        onPressed: () {},

                        icon: const Icon(Icons.delete, color: Colors.red),
                      ),
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
