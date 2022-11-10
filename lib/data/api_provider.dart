import 'dart:convert';
import "package:http/http.dart" show Client, Response;
import 'package:minggu10_movie/model/popular_movies.dart';

class ApiProvider {
  String apiKey = '3d92c8f5549af5edfbd8d9b049029bcb';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    Uri url = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey');
    Response response = await client.get(url);

    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
