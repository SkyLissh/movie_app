import "package:flutter/material.dart";

import "package:movie_app/constants/constants.dart";
import "package:movie_app/widgets/widgets.dart";

class UserBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  UserBar({Key? key, required this.preferredSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width >= 1024 ? 0.5 : 0.9;

    return TopBar(
      child: FractionallySizedBox(
        widthFactor: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Hello, Skylissh!",
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Let's find a movie for you",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 159, 159, 186),
                    ),
                  ),
                ],
              ),
            ),
            const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                "https://pbs.twimg.com/profile_images/1558193606049005571/dVXzv6Sc_400x400.jpg",
              ),
            )
          ],
        ),
      ),
    );
  }
}
