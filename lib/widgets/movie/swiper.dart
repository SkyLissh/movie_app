import 'package:feather_icons_svg/feather_icons_svg.dart';
import "package:flutter/material.dart";
import "package:carousel_slider/carousel_slider.dart";

import "package:movie_app/models/models.dart";

class MovieSwiper extends StatelessWidget {
  final List<Movie> movies;

  const MovieSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewportFraction = size.width >= 1024 ? 0.5 : 0.7;

    return CarouselSlider.builder(
      itemCount: 10,
      options: CarouselOptions(
        autoPlay: true,
        height: size.height * 0.5,
        enlargeCenterPage: true,
        viewportFraction: viewportFraction,
      ),
      itemBuilder: (_, idx, pageIndex) {
        if (movies.isEmpty) return const _Card();

        final movie = movies[idx];
        final img = size.width >= 768 ? movie.backdropPath : movie.posterPath;
        final imgSize = size.width >= 1024 ? "w780" : "w500";

        return GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            "details",
            arguments: movie.id,
          ),
          child: movie.posterPath == null
              ? const _Card(
                  child: FeatherIcon(
                    FeatherIcons.film,
                    size: 72,
                    color: Color.fromARGB(255, 134, 134, 166),
                  ),
                )
              : _Card(
                  child: Image.network(
                    "https://image.tmdb.org/t/p/$imgSize$img",
                    fit: BoxFit.cover,
                  ),
                ),
        );
      },
    );
  }
}

class _Card extends StatelessWidget {
  final Widget? child;

  const _Card({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            color: const Color.fromARGB(255, 40, 40, 54),
            width: size.width * 0.66,
            child: child,
          ),
        ));
  }
}
