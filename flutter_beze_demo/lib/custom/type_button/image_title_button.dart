import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_beze_demo/bloc/theme/theme_bloc.dart';
import 'package:provider/provider.dart';

class ImageTitleButton extends StatelessWidget {
  const ImageTitleButton(
      {Key? key,
      required this.onTap,
      required this.image,
      this.size = 40,
      required this.title})
      : super(key: key);
  final Image image;
  final void Function()? onTap;
  final double size;
  final String title;
  @override
  Widget build(BuildContext context) {
    final double width = size;
    return InkWell(
      onTap: onTap,
      child: Container(
          child: Column(
        children: [
          Container(
            height: size,
            width: width,
            child: image,
          ),
          AutoSizeText(
            title,
            style: TextStyle(color: context.watch<ThemeBloc>().state.textColor),
            maxLines: 1,
          )
        ],
      )),
    );
  }
}

class RoundedTitleImageButton extends StatelessWidget {
  const RoundedTitleImageButton({
    Key? key,
    required this.onTap,
    required this.image,
    this.size = 40,
    required this.title,
  }) : super(key: key);
  final ImageProvider<Object> image;
  final void Function()? onTap;
  final double size;
  final String title;

  @override
  Widget build(BuildContext context) {
    final double width = size;
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Container(
              width: width,
              height: size,
              decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover, image: image),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.redAccent,
              ),
            ),
            AutoSizeText(
              title,
              style:
                  TextStyle(color: context.watch<ThemeBloc>().state.textColor),
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}

class CircleTitleImageButton extends StatelessWidget {
  const CircleTitleImageButton(
      {Key? key,
      required this.onTap,
      required this.image,
      this.radius = 20,
      required this.title})
      : super(key: key);
  final ImageProvider<Object> image;
  final void Function()? onTap;
  final double radius;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: image,
              radius: radius,
            ),
            AutoSizeText(
              title,
              style:
                  TextStyle(color: context.watch<ThemeBloc>().state.textColor),
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}
