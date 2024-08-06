import 'package:flutter/material.dart';
import '../controllers/book_controller.dart';
import '../models/book.dart';

class BookDetailView extends StatelessWidget {
  final Book book;
  final BookController _controller = BookController();

  BookDetailView({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:Colors.blueAccent.withOpacity(.5),
          title: Text(book.title,style: TextStyle(color: Colors.white),),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container( decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(.5)
        ),
          child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Padding(
             padding: const EdgeInsets.only(left: 22.0),
             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('Title: ${book.title}', style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w900)),
               SizedBox(height: 8),
               Text('Author: ${book.author}', style: TextStyle(fontSize: 18,color: Colors.yellowAccent,fontWeight: FontWeight.w700)),
               SizedBox(height: 100),
               Text('Description: ${book.description}', style: TextStyle(fontSize: 16,color: Colors.white)),
               SizedBox(height: 300),],),
           ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [  ElevatedButton(
            onPressed: () {
              // Implement update book functionality
            },
            child: Text('Update Book'),
          ),
            ElevatedButton(
              onPressed: () async {
                await _controller.deleteBook(book.id);
                Navigator.pop(context);
              },
              child: Text('Delete Book'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),],)
          ],
        ),)
      ),
    );
  }
}
