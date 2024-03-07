import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CachedImageView extends StatelessWidget {
  final String image;
  final BoxFit? fit;
  final String placeholder;
  final String error;
  final double radius;
  final bool isErrorIcon;
  final double? height,
      width,
      errorHeight,
      errorWidth,
      placeHolderHeight,
      placeHolderWidth;

  const CachedImageView(
      {Key? key,
        required this.image,
        this.fit = BoxFit.cover,
        this.placeholder = "assets/images/loading_shimmer.gif",
        this.error = "assets/images/image_not_found.png",
        this.height,
        this.errorHeight,
        this.errorWidth,
        this.radius=18,
        this.isErrorIcon = false,
        this.placeHolderWidth,
        this.placeHolderHeight,
        this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) => Image.asset(
        placeholder,
        fit: BoxFit.fill,
        height: placeHolderHeight,
        width: placeHolderWidth,
      ),
      errorWidget: (_, __, ___) {
        return isErrorIcon == false
            ? Image.asset(
          error,
          fit: BoxFit.fill,
          height: errorHeight,
          width: errorWidth,
        )
            :  CircleAvatar(
          radius: radius,
          backgroundColor: Colors.grey,
          child: Icon(
            PhosphorIcons.user as IconData?,
            size: 20,
            color: Colors.black,
          ),
        );
      },
      fit: fit,
      height: height,
      width: width,
    );
  }
}