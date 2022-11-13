import "package:flutter/material.dart";

import "package:movie_app/constants/constants.dart";

class ImageCard extends StatelessWidget {
  final String? text;
  final String? url;
  final Color? color;
  final Widget icon;
  final double height;
  final double width;
  final bool empty;
  final EdgeInsetsGeometry? margin;

  const ImageCard({
    Key? key,
    this.text,
    this.url,
    this.color,
    this.icon = const Icon(Icons.image, size: 42, color: Colors.grey),
    this.height = 190,
    this.width = 130,
    this.empty = false,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      child: Column(
        children: [
          _Card(
              url: url,
              icon: icon,
              width: width,
              height: height,
              color: color,
              empty: empty),
          if (text != null) ...[
            const SizedBox(height: 5),
            Text(
              text!,
              style: const TextStyle(
                color: kTextColor,
                fontSize: 12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ]
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String? url;
  final Widget icon;
  final double height;
  final double width;
  final Color? color;
  final bool empty;

  const _Card({
    Key? key,
    required this.icon,
    required this.height,
    required this.width,
    required this.color,
    required this.empty,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          height: height,
          width: width,
          color: color,
          child: !empty
              ? url == null
                  ? icon
                  : Image.network(
                      url!,
                      fit: BoxFit.cover,
                    )
              : null,
        ),
      ),
    );
  }
}
