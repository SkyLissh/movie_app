import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:movie_app/constants/constants.dart";
import "package:movie_app/providers/providers.dart";
import "package:movie_app/models/models.dart";
import "package:movie_app/widgets/widgets.dart";

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final suggestions = Provider.of<MoviesProvider>(context).suggestions;
    final getSuggestions = Provider.of<MoviesProvider>(context).getSuggestions;

    return Scaffold(
      appBar: SearchBar(
        preferredSize: Size.fromHeight(kAppBarHeight),
        onChanged: (value) => getSuggestions(value),
      ),
      body: StreamBuilder(
          stream: suggestions,
          builder: (_, snapshot) {
            if (snapshot.data == null) {
              return const EmptySearch(message: "Search for a movie");
            }

            if (snapshot.data!.isEmpty) {
              return const EmptySearch(message: "No results found");
            }

            return _ListItem(movies: snapshot.data!);
          }),
    );
  }
}

class _ListItem extends StatelessWidget {
  final List<Movie> movies;

  const _ListItem({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      padding: const EdgeInsets.only(bottom: 15.0, top: 5.0),
      itemBuilder: (context, index) {
        final movie = movies[index];
        final imgUrl = movie.posterPath != null
            ? "https://image.tmdb.org/t/p/w500${movie.posterPath}"
            : null;

        return SearchItem(
          title: movie.title,
          rate: movie.voteAverage,
          releaseDate: movie.releaseDate,
          posterPath: imgUrl,
          onTap: () => Navigator.pushNamed(
            context,
            "details",
            arguments: movie.id,
          ),
        );
      },
    );
  }
}
