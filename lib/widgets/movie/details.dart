import "package:flutter/material.dart";

import "package:movie_app/models/models.dart";
import "package:movie_app/widgets/widgets.dart";

class MovieDetails extends StatelessWidget {
  final MovieDetail movie;

  const MovieDetails({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width >= 1024 ? 0.7 : 0.9;
    final genres = movie.genres.map((e) => e.name).toList();

    return Positioned(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: size.height * 0.3,
            ),
            child: FractionallySizedBox(
              widthFactor: width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: Theme.of(context).textTheme.headline3,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    MovieInfo(
                      year: movie.releaseDate?.year,
                      genre: genres.length > 1
                          ? "${genres[0]}/${genres[1]}"
                          : genres[0],
                      duration: movie.runtime,
                    ),
                    MovieRate(rate: movie.voteAverage),
                    Overview(text: movie.overview),
                  ]),
            ),
          ),
          MovieCast(id: movie.id)
        ],
      ),
    );
  }
}
