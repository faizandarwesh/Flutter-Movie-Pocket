import 'dart:convert';
import 'package:eshoppy/models/Movie.dart';
import 'package:eshoppy/models/MovieDetails.dart';
import 'package:http/http.dart';
import 'package:eshoppy/utils/Constants.dart';
import 'package:eshoppy/models/MovieTrailer.dart';

class Webservice {

  Future<List<Result>> getMovies(String endpoint) async {

    final String url = "https://api.themoviedb.org/3/movie/$endpoint?api_key=${Constants.API_KEY}&language=en-US&page=1";
    Response response = await get(url);

    if (response.statusCode == 200) {
      return Movie.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<MovieDetails> getMovieDetails(int movieId) async{

    final String url = "https://api.themoviedb.org/3/movie/$movieId?api_key=${Constants.API_KEY}&language=en-US&append_to_response=credits";
    Response response = await get(url);

    if (response.statusCode == 200) {
      print("getMovieDetails : ${response.body}");
      print("jsonDecode : ${MovieDetails.fromJson(jsonDecode(response.body))}");
      return MovieDetails.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load movie details');
    }
  }

  Future<String> getVideos(int movieId) async{

    final String url = "https://api.themoviedb.org/3/movie/$movieId/videos?api_key=${Constants.API_KEY}&language=en-US";
    Response response = await get(url);

    if (response.statusCode == 200) {
      return MovieTrailer.fromJson(jsonDecode(response.body)).results[0].key;
    } else {
      throw Exception('Failed to load movie trailer');
    }
  }
}