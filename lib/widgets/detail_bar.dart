import "package:flutter/material.dart";
import "package:feather_icons_svg/feather_icons_svg.dart";
import "package:bitsdojo_window/bitsdojo_window.dart";

import "package:movie_app/constants/constants.dart";
import "package:movie_app/widgets/widgets.dart";

class DetailBar extends StatelessWidget with PreferredSizeWidget {
  DetailBar({Key? key})
      : preferredSize = const Size.fromHeight(100.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width >= 1024 ? 0.7 : 0.9;

    return TopBar(
      backgroundColor: Colors.transparent,
      child: FractionallySizedBox(
        widthFactor: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const FeatherIcon(FeatherIcons.chevronLeft),
              iconSize: 32,
              splashRadius: 26,
              // padding: const EdgeInsets.only(left: 10),
              onPressed: () {
                if (kIsDesktop) appWindow.title = "Movie App";
                Navigator.pop(context);
              },
            ),
            IconButton(
                splashRadius: 26,
                padding: const EdgeInsets.only(top: 5),
                icon: const FeatherIcon(FeatherIcons.heart, size: 26),
                onPressed: (() => {})),
          ],
        ),
      ),
    );
  }
}
