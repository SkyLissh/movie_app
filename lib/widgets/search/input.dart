import "package:flutter/material.dart";

import "package:movie_app/widgets/widgets.dart";

class SearchField extends StatefulWidget {
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final bool autoFocus;

  const SearchField(
      {Key? key, this.autoFocus = false, this.onTap, this.onChanged})
      : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _controller = TextEditingController();
  final _showSuffix = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _showSuffix.value = _controller.text.isNotEmpty;
      widget.onChanged?.call(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _showSuffix.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 40, 40, 54),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ValueListenableBuilder(
            valueListenable: _showSuffix,
            builder: (ctx, value, _) {
              return TextField(
                controller: _controller,
                autofocus: widget.autoFocus,
                onTap: widget.onTap,
                decoration: InputStyle(
                  onClean: () => _controller.clear(),
                  showSuffix: value,
                ).inputStyle,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
              );
            }),
      ),
    );
  }
}
