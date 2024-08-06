import 'package:flutter/material.dart';
import '../controllers/book_controller.dart';
import '../models/book.dart';
import 'book_detail_view.dart';

class BookListView extends StatelessWidget {
  final BookController _controller = BookController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,
        title: Text('Books List',style: TextStyle(color: Colors.white),),centerTitle: true,),
      body: FutureBuilder<List<Book>>(
        future: _controller.getBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No books found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Book book = snapshot.data![index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 8,
                  child: GestureDetector( onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailView(book: book),
                      ),
                    );
                  },
                    child: Container(
                      height: 200, // Custom height
                      width: 300, // Custom width
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(book.id.toString(),style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),),
                              Icon(
                                Icons.book,
                                size: 50,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                              Text(book.title,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
