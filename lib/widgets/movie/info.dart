import "package:flutter/material.dart";

class MovieInfo extends StatelessWidget {
  final int? year;
  final String genre;
  final int? duration;

  const MovieInfo({
    Key? key,
    required this.year,
    required this.genre,
    required this.duration,
  }) : super(key: key);

  String formatDuration(int minutes) {
    final d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return "${parts[0]}h ${parts[1].padLeft(2, '0')}m";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Text(
            year == null ? "Unknown" : "$year",
            style: const TextStyle(
                color: Color.fromARGB(255, 171, 171, 206),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          const _Bullet(),
          Text(
            genre,
            style: const TextStyle(
                color: Color.fromARGB(255, 159, 159, 186),
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),
          const _Bullet(),
          Text(
            duration == null ? "Uknown" : formatDuration(duration!),
            style: const TextStyle(
                color: Color.fromARGB(255, 159, 159, 186),
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  const _Bullet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        "•",
        style: TextStyle(
            color: Color.fromARGB(255, 171, 171, 206),
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
