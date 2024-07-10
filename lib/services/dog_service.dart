import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/dog.dart';

class DogService {
  final String baseUrl = "https://dog.ceo/api/breeds/image/random";

  Future<Dog> fetchRandomDogImage() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Dog.fromJson(data);
    } else {
      throw Exception('Error al cargar imagen de perrito');
    }
  }
}
