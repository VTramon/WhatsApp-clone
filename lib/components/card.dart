import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final String? subTitle;
  final ImageProvider? image;
  final DateTime time;

  const CustomCard({
    super.key,
    required this.title,
    this.subTitle,
    this.image,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle!),
        leading: CircleAvatar(
          backgroundImage: image,
        ),
        trailing: Text(time.toString()),
      ),
    );
  }
}
