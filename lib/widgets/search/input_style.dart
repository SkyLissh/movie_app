import "package:flutter/material.dart";
import "package:feather_icons_svg/feather_icons_svg.dart";

import "package:movie_app/constants/constants.dart";

class InputStyle {
  final bool showSuffix;
  final VoidCallback? onClean;

  const InputStyle({this.showSuffix = false, this.onClean});

  InputDecoration get inputStyle => InputDecoration(
        hintText: "Search",
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        border: InputBorder.none,
        hintStyle: const TextStyle(
          fontSize: 18,
          color: kSecondaryColor,
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: FeatherIcon(
            FeatherIcons.search,
            color: kSecondaryColor,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 24,
          minHeight: 24,
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 24,
          minHeight: 24,
        ),
        suffixIcon: showSuffix
            ? MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: onClean,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: FeatherIcon(FeatherIcons.x, color: kSecondaryColor),
                  ),
                ),
              )
            : null,
      );
}
