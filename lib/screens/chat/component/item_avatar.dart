import 'package:flutter/material.dart';
class ItemAvatar extends StatelessWidget {
  final double size;
  final String? image;
  final EdgeInsets margin;
  const ItemAvatar({super.key, this.image,  this.size = 50, this.margin = const EdgeInsets.all(0)});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(image??'https://media.newyorker.com/photos/606cd925407075a363d50dec/master/w_2560%2Cc_limit/Indurti-PersonofColorSomethingHappened.jpg'),
          ),
        ),
      ),
    );
  }
}