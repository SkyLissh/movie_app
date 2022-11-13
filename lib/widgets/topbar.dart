import "package:flutter/material.dart";

import "package:movie_app/constants/constants.dart";
import "package:movie_app/widgets/widgets.dart";

class TopBar extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;

  const TopBar({Key? key, required this.child, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: double.infinity,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      flexibleSpace: Column(
        children: [
          if (kIsDesktop) ...[
            const SizedBox(height: 32, child: TitleBar())
          ] else ...[
            const SizedBox(height: 20)
          ],
          Expanded(child: child),
        ],
      ),
    );
  }
}
