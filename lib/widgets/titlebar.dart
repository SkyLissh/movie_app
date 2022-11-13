import "package:flutter/material.dart";
import "package:bitsdojo_window/bitsdojo_window.dart";

class TitleBar extends StatelessWidget {
  const TitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonColors = WindowButtonColors(
      iconNormal: Colors.white,
      mouseOver: const Color.fromARGB(255, 53, 53, 72),
      mouseDown: const Color.fromARGB(255, 48, 48, 70),
      iconMouseOver: Colors.white,
      iconMouseDown: Colors.white,
    );

    final closeButtonColors = WindowButtonColors(
      mouseOver: const Color.fromARGB(255, 230, 72, 72),
      mouseDown: const Color.fromARGB(255, 230, 72, 72),
      iconNormal: Colors.white,
      iconMouseOver: Colors.white,
      iconMouseDown: Colors.white,
    );

    return WindowTitleBarBox(
      child: Row(
        children: [
          Expanded(child: MoveWindow()),
          MinimizeWindowButton(colors: buttonColors),
          MaximizeWindowButton(colors: buttonColors),
          CloseWindowButton(colors: closeButtonColors),
        ],
      ),
    );
  }
}
