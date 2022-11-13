import 'dart:async';

import "package:flutter/material.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:http/http.dart" as http;

import "package:movie_app/helpers/helpers.dart";
import "package:movie_app/models/models.dart";

class MoviesProvider extends ChangeNotifier {
  final _baseUrl = "api.themoviedb.org";
  final _language = "en-US";
  int _popularPage = 0;

  List<Movie> _playing = [];
  List<Movie> _popular = [];
  String _query = "";

  final Map<int, MovieDetail> _movies = {};
  final StreamController<List<Movie>?> _streamController =
      StreamController.broadcast();

  final debouncer = Debouncer(duration: const Duration(milliseconds: 500));

  MoviesProvider() {
    getMoviesPlaying();
    getPopulars();
  }

  List<Movie> get playing => _playing;
  List<Movie> get popular => _popular;
  String get query => _query;
  Stream<List<Movie>?> get suggestions => _streamController.stream;

  Future<String> _getJson(String endpoint, {int? page = 1}) async {
    final url = Uri.https(_baseUrl, endpoint, {
      "api_key": dotenv.env["TMDB_KEY"]!,
      "language": _language,
      "page": "$page"
    });

    final response = await http.get(url);

    return response.body;
  }

  void updateQuery(String query) {
    _query = query;
    notifyListeners();
  }

  void getMoviesPlaying() async {
    final data = await _getJson("3/movie/now_playing");
    _playing = MovieResponse.fromJson(data).results;

    notifyListeners();
  }

  void getPopulars() async {
    _popularPage++;

    final data = await _getJson("3/movie/popular", page: _popularPage);
    final newPopulars = MovieResponse.fromJson(data).results;
    _popular = [..._popular, ...newPopulars];

    notifyListeners();
  }

  Future<MovieDetail> getMovieById(int id) async {
    if (_movies.containsKey(id)) return _movies[id]!;

    final json = await _getJson("3/movie/$id");
    final data = MovieDetail.fromJson(json);

    _movies[id] = data;
    return data;
  }

  Future<List<Cast>> getCast(int id) async {
    final json = await _getJson("3/movie/$id/credits");
    final data = Credits.fromJson(json);

    return data.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(_baseUrl, "3/search/movie", {
      "api_key": dotenv.env["TMDB_KEY"]!,
      "language": _language,
      "query": query
    });

    final response = await http.get(url);
    final data = MovieResponse.fromJson(response.body);

    return data.results;
  }

  void getSuggestions(String query) {
    debouncer.value = "";
    debouncer.onValue = (value) async {
      if (value.isEmpty) {
        _streamController.add(null);
        return;
      }

      final results = await searchMovies(value);
      _streamController.add(results);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = query;
    });

    Future.delayed(const Duration(milliseconds: 301))
        .then((_) => timer.cancel());
  }
}
