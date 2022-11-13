import 'package:feather_icons_svg/feather_icons_svg.dart';
import "package:flutter/material.dart";

import "package:movie_app/widgets/widgets.dart";

class SearchBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final void Function(String)? onChanged;

  const SearchBar({Key? key, required this.preferredSize, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width >= 1024 ? 0.7 : 0.9;
    final padding = size.width >= 1024 ? 20.0 : 5.0;

    return TopBar(
      child: FractionallySizedBox(
        widthFactor: width,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: padding),
              child: IconButton(
                icon: const FeatherIcon(FeatherIcons.chevronLeft),
                iconSize: 32,
                splashRadius: 26,
                color: const Color.fromARGB(255, 159, 159, 186),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Expanded(
              child: Hero(
                tag: "search_bar",
                child: SearchField(autoFocus: true, onChanged: onChanged),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
