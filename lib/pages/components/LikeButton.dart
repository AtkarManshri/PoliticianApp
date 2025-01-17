import 'package:flutter/material.dart';
class LikeButton extends StatelessWidget {

  final bool isLiked;
  void Function()? onTap;
 LikeButton({super.key, required this.isLiked , required this.onTap});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:Icon(
        Icons.thumb_up_alt_outlined,
        color: isLiked?Colors.blue:Colors.grey,
      )
    );
  }
}
