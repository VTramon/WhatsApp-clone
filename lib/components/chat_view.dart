import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  final ScrollController controller;
  const ChatView({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      children: [
        _ChatCard(
          name: 'Vitor Ramon',
          image: const NetworkImage(
              'https://img.freepik.com/free-photo/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_273609-16959.jpg?w=2000'),
          lastMessage: 'Última menssagem',
          lastMessageTime: DateTime.now(),
        ),
      ],
    );
  }
}

class _ChatCard extends StatelessWidget {
  final String name;
  final String lastMessage;
  final DateTime lastMessageTime;
  final ImageProvider<Object> image;
  const _ChatCard({
    Key? key,
    required this.name,
    required this.image,
    required this.lastMessage,
    required this.lastMessageTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        lastMessage,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      leading: CircleAvatar(
        backgroundImage: image,
      ),
      trailing: Text(
        lastMessageTime.toString(),
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    );
  }
}
