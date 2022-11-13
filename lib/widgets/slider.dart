import "package:flutter/material.dart";

import "package:movie_app/constants/constants.dart";

class HorizontalSlider extends StatefulWidget {
  final String? title;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final Function? onSlide;

  const HorizontalSlider({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.onSlide,
    this.title,
  }) : super(key: key);

  @override
  State<HorizontalSlider> createState() => _HorizontalSliderState();
}

class _HorizontalSliderState extends State<HorizontalSlider> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final maxScroll = _scrollController.position.maxScrollExtent - 500;

      if (_scrollController.position.pixels >= maxScroll &&
          widget.onSlide != null) {
        widget.onSlide!();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      height: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                widget.title!,
                style: const TextStyle(
                  fontSize: 20,
                  color: kTextColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              controller: widget.onSlide != null ? _scrollController : null,
              itemCount: widget.itemCount,
              scrollDirection: Axis.horizontal,
              itemBuilder: widget.itemBuilder,
            ),
          ),
        ],
      ),
    );
  }
}
