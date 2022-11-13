import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "package:movie_app/constants/constants.dart";
import "package:movie_app/widgets/widgets.dart";

class ItemInfo extends StatelessWidget {
  final String title;
  final DateTime? releaseDate;
  final double rate;

  const ItemInfo({
    Key? key,
    required this.title,
    required this.rate,
    this.releaseDate,
  }) : super(key: key);

  String formatDate(DateTime date) => DateFormat("MMMM d, y").format(date);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 130.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: kTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  releaseDate == null ? "Unknown" : formatDate(releaseDate!),
                  style: const TextStyle(
                    color: kSecondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            MovieRate(rate: rate),
          ],
        ),
      ),
    );
  }
}
