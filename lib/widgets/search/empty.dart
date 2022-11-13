import "package:flutter/material.dart";
import "package:feather_icons_svg/feather_icons_svg.dart";

import "package:movie_app/constants/constants.dart";

class EmptySearch extends StatelessWidget {
  final String message;

  const EmptySearch({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const FeatherIcon(FeatherIcons.film,
            size: 76.0, color: kSecondaryColor),
        const SizedBox(height: 10.0),
        Text(
          message,
          style: const TextStyle(
              color: kSecondaryColor,
              fontSize: 28.0,
              fontWeight: FontWeight.w600),
        ),
      ],
    ));
  }
}
