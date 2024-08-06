import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book.dart';

class ApiService {
  final String baseUrl = 'https://freetestapi.com/api/v1/books';

  Future<List<Book>> fetchBooks() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((book) => Book.fromJson(book)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<Book> fetchBookById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return Book.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load book');
    }
  }

  Future<Book> createBook(Book book) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(book.toJson()),
    );
    if (response.statusCode == 201) {
      return Book.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create book');
    }
  }

  Future<void> updateBook(Book book) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${book.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(book.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update book');
    }
  }

  Future<void> deleteBook(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete book');
    }
  }
}
