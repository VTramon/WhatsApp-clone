import 'package:flutter/material.dart';

class CallsView extends StatelessWidget {
  final ScrollController controller;
  const CallsView({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      children: [
        _CallCard(
          name: 'Vitor Ramon',
          image: const NetworkImage(
              'https://img.freepik.com/free-photo/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_273609-16959.jpg?w=2000'),
          time: DateTime.now(),
        ),
      ],
    );
  }
}

class _CallCard extends StatelessWidget {
  final String name;
  final DateTime time;
  final ImageProvider<Object> image;
  const _CallCard(
      {Key? key, required this.name, required this.image, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(
        time.toString(),
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      leading: CircleAvatar(
        backgroundImage: image,
      ),
    );
  }
}
