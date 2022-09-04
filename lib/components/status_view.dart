import 'package:flutter/material.dart';

class StatusView extends StatelessWidget {
  final ScrollController controller;
  const StatusView({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: _MyStatus(
            image: NetworkImage(
              'https://img.freepik.com/free-photo/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_273609-16959.jpg?w=2000',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Atualizações recentes',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        _OtherStatus(
          name: 'name',
          image: const NetworkImage(
            'https://img.freepik.com/free-photo/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_273609-16959.jpg?w=2000',
          ),
          time: DateTime.now(),
        ),
      ],
    );
  }
}

class _MyStatus extends StatelessWidget {
  // final String name;
  final ImageProvider<Object> image;
  const _MyStatus({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Meus status'),
      subtitle: const Text('Toque para atualizar seu status'),
      leading: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
            child: CircleAvatar(backgroundImage: image),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                color: Theme.of(context).colorScheme.background,
                border: Border.all(color: Colors.white, width: 3),
              ),
              // color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.all(1.0),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _OtherStatus extends StatelessWidget {
  final String name;
  final DateTime time;
  final ImageProvider<Object> image;
  const _OtherStatus(
      {Key? key, required this.name, required this.image, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(
        time.toString(),
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      leading: CircleAvatar(
        backgroundImage: image,
      ),
    );
  }
}
