import "package:flutter/material.dart";

class MovieHeader extends StatelessWidget {
  final String? url;

  const MovieHeader({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.7,
      child: Stack(children: [
        Container(
          width: double.infinity,
          height: size.height * 0.7,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 28, 28, 40),
            image: url != null
                ? DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.dstATop,
                    ),
                    image: NetworkImage(
                      url!,
                    ))
                : null,
          ),
        ),
        Positioned(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromARGB(255, 28, 28, 40),
                  Color.fromARGB(255, 28, 28, 40),
                  Color.fromARGB(245, 28, 28, 40),
                  Color.fromARGB(200, 28, 28, 40),
                  Color.fromARGB(0, 28, 28, 40),
                  Color.fromARGB(0, 28, 28, 40),
                  Color.fromARGB(0, 28, 28, 40),
                  Color.fromARGB(0, 28, 28, 40),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
