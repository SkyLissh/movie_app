import "package:flutter/material.dart";
import "package:feather_icons_svg/feather_icons_svg.dart";

import "package:movie_app/constants/constants.dart";
import "package:movie_app/widgets/widgets.dart";

class SearchItem extends StatelessWidget {
  final String title;
  final double rate;
  final DateTime? releaseDate;
  final String? posterPath;
  final VoidCallback? onTap;

  const SearchItem(
      {Key? key,
      required this.title,
      required this.rate,
      this.releaseDate,
      this.posterPath,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width >= 1024 ? 0.7 : 0.9;

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: FractionallySizedBox(
            widthFactor: width,
            child: Card(
                color: kComponentColor,
                child: InkWell(
                    splashColor: kSplashColor,
                    onTap: onTap,
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(children: [
                          Row(children: [
                            ImageCard(
                              margin: const EdgeInsets.only(right: 10.0),
                              height: 130,
                              width: 90,
                              url: posterPath,
                              color: kBackgroundColor,
                              icon: const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: FeatherIcon(
                                  FeatherIcons.film,
                                  color: kSecondaryColor,
                                ),
                              ),
                            ),
                            ItemInfo(
                              title: title,
                              rate: rate,
                              releaseDate: releaseDate,
                            ),
                          ])
                        ]))))));
  }
}
