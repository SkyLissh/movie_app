import "package:flutter/material.dart";
import "package:feather_icons_svg/feather_icons_svg.dart";
import "package:provider/provider.dart";

import "package:movie_app/constants/constants.dart";
import "package:movie_app/providers/providers.dart";
import "package:movie_app/widgets/widgets.dart";

class MovieCast extends StatelessWidget {
  final int id;

  const MovieCast({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getCast = Provider.of<MoviesProvider>(context, listen: false).getCast;

    return FutureBuilder(
      future: getCast(id),
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return HorizontalSlider(
            title: "Cast",
            itemCount: 10,
            itemBuilder: (_, idx) => const ImageCard(empty: true),
          );
        }

        return HorizontalSlider(
          title: "Cast",
          itemCount: snapshot.data!.length,
          itemBuilder: (_, idx) {
            final cast = snapshot.data![idx];
            final url = cast.profilePath != null
                ? "https://image.tmdb.org/t/p/w500${cast.profilePath}"
                : null;

            return ImageCard(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              text: cast.name,
              url: url,
              color: kComponentColor,
              icon: const FeatherIcon(
                FeatherIcons.user,
                size: 42,
                color: kSecondaryColor,
              ),
            );
          },
        );
      },
    );
  }
}
