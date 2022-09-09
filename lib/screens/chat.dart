import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  final String name;
  final ImageProvider image;
  const Chat({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 65,
        title: Text(name),
        leading: Row(
          // mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
            CircleAvatar(
              backgroundImage: image,
              maxRadius: 18,
              minRadius: 18,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.video_camera_front_rounded),
              onPressed: () {},
            ),
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
          ),
          PopupMenuButton(
            // color: Colors.black,
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                child: Text('Contatos'),
              ),
              const PopupMenuItem(
                child: Text('Atualizar'),
              ),
              const PopupMenuItem(
                child: Text('Ajuda'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
