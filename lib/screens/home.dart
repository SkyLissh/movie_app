import "package:flutter/material.dart";
import "package:feather_icons_svg/feather_icons_svg.dart";
import "package:provider/provider.dart";

import "package:movie_app/constants/constants.dart";
import "package:movie_app/widgets/widgets.dart";
import "package:movie_app/providers/providers.dart";

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playing = Provider.of<MoviesProvider>(context).playing;
    final popular = Provider.of<MoviesProvider>(context).popular;
    // final popular = [];

    final getPopulars = Provider.of<MoviesProvider>(context).getPopulars;

    final size = MediaQuery.of(context).size;
    final width = size.width >= 1024 ? 0.5 : 0.9;

    return Scaffold(
        appBar: UserBar(preferredSize: Size.fromHeight(kAppBarHeight)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FractionallySizedBox(
                widthFactor: width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 50.0),
                  child: Hero(
                    tag: "search_bar",
                    child: SearchField(
                      onTap: () => Navigator.pushNamed(context, "search"),
                    ),
                  ),
                ),
              ),
              MovieSwiper(movies: playing),
              HorizontalSlider(
                  title: "Populars",
                  itemCount: popular.isEmpty ? 10 : popular.length,
                  onSlide: getPopulars,
                  itemBuilder: (_, idx) {
                    if (popular.isEmpty) {
                      return const ImageCard(
                        empty: true,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                      );
                    }

                    final movie = popular[idx];
                    final url = movie.posterPath != null
                        ? "https://image.tmdb.org/t/p/w500${movie.posterPath}"
                        : null;

                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        "details",
                        arguments: movie.id,
                      ),
                      child: ImageCard(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        text: movie.title,
                        url: url,
                        color: kComponentColor,
                        icon: const FeatherIcon(
                          FeatherIcons.film,
                          size: 42,
                          color: kSecondaryColor,
                        ),
                      ),
                    );
                  })
            ],
          ),
        ));
  }
}
