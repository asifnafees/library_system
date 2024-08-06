import '../models/book.dart';
import '../services/api_service.dart';

class BookController {
  final ApiService _apiService = ApiService();

  Future<List<Book>> getBooks() async {
    return await _apiService.fetchBooks();
  }

  Future<Book> getBookById(int id) async {
    return await _apiService.fetchBookById(id);
  }

  Future<Book> createBook(Book book) async {
    return await _apiService.createBook(book);
  }

  Future<void> updateBook(Book book) async {
    return await _apiService.updateBook(book);
  }

  Future<void> deleteBook(int id) async {
    return await _apiService.deleteBook(id);
  }
}
