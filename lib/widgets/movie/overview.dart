import "package:flutter/material.dart";

import "package:movie_app/constants/constants.dart";

class Overview extends StatelessWidget {
  final String text;

  const Overview({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Overview",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: kTextColor,
                ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: kTextColor,
                ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
