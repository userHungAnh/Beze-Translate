import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  const ImageButton(
      {Key? key, required this.onTap, required this.image, this.size = 40})
      : super(key: key);
  final Image image;
  final void Function()? onTap;
  final double size;
  @override
  Widget build(BuildContext context) {
    final double width = size;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size,
        width: width,
        child: image,
      ),
    );
  }
}

class RoundedImageButton extends StatelessWidget {
  const RoundedImageButton({
    Key? key,
    required this.onTap,
    required this.image,
    this.size = 40,
  }) : super(key: key);
  final ImageProvider<Object> image;
  final void Function()? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    final double width = size;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: size,
        decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover, image: image),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.redAccent,
        ),
      ),
    );
  }
}

class CircleImageButton extends StatelessWidget {
  const CircleImageButton(
      {Key? key, required this.onTap, required this.image, this.radius = 20})
      : super(key: key);
  final ImageProvider<Object> image;
  final void Function()? onTap;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundImage: image,
        radius: radius,
      ),
    );
  }
}
