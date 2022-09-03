import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  final ScrollController controller;
  const ChatView({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      children: const [
        _ChatCard(
          name: 'Vitor Ramon',
          image: NetworkImage(
              'https://img.freepik.com/free-photo/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_273609-16959.jpg?w=2000'),
        ),
      ],
    );
  }
}

class _ChatCard extends StatelessWidget {
  final String name;
  final ImageProvider<Object> image;
  const _ChatCard({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      leading: CircleAvatar(
        backgroundImage: image,
      ),
    );
  }
}
