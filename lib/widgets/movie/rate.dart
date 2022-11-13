import "package:flutter/material.dart";

class MovieRate extends StatelessWidget {
  final double rate;

  const MovieRate({Key? key, required this.rate}) : super(key: key);

  Icon _rateStars(int index) {
    final mid = rate.round() / 2;

    if (index >= mid) {
      return const Icon(
        Icons.star_border_rounded,
        color: Color.fromARGB(255, 171, 171, 206),
      );
    } else if (index > mid - 1 && index < mid) {
      return const Icon(
        Icons.star_half_rounded,
        color: Color.fromARGB(255, 235, 208, 112),
      );
    }

    return const Icon(
      Icons.star_rounded,
      color: Color.fromARGB(255, 235, 208, 112),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ...List.generate(5, (idx) => _rateStars(idx)),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(children: [
          Text(rate.toStringAsFixed(1),
              style: const TextStyle(
                  color: Color.fromARGB(255, 235, 208, 112),
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          const Text("/10",
              style: TextStyle(
                  color: Color.fromARGB(255, 171, 171, 206),
                  fontSize: 16,
                  fontWeight: FontWeight.normal)),
        ]),
      ),
    ]);
  }
}
