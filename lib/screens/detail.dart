import 'package:bitsdojo_window/bitsdojo_window.dart';
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:movie_app/constants/constants.dart";

import "package:movie_app/models/models.dart";
import "package:movie_app/providers/providers.dart";
import "package:movie_app/widgets/widgets.dart";

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context)?.settings.arguments as int;
    final size = MediaQuery.of(context).size;

    final getMovieById = Provider.of<MoviesProvider>(
      context,
      listen: false,
    ).getMovieById;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DetailBar(),
      body: SingleChildScrollView(
          child: FutureBuilder<MovieDetail>(
              future: getMovieById(id),
              builder: (_, snapshot) {
                if (!snapshot.hasData) {
                  return SizedBox(
                    height: size.height,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }

                final movie = snapshot.data!;
                if (kIsDesktop) appWindow.title = movie.title;
                final img =
                    size.width >= 1024 ? movie.backdropPath : movie.posterPath;

                final url =
                    img != null ? "https://image.tmdb.org/t/p/w500$img" : null;

                return Stack(
                  children: [
                    MovieHeader(url: url),
                    MovieDetails(movie: movie),
                  ],
                );
              })),
    );
  }
}
