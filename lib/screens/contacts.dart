import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  Contacts({super.key});

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton(
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
      body: ListView.builder(
        controller: controller,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 15,
        itemBuilder: (context, index) {
          if (index == 0) {
            return ListTile(
              onTap: null,
              title: const Text('Novo contato'),
              leading: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(
                    bottom: 6.0,
                    top: 6.0,
                    left: 6.0,
                    right: 8.0,
                  ),
                  child: Icon(
                    Icons.person_add,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }

          if (index == 1) {
            return const Text('Contatos no WhatsApp');
          }

          return const Testing();
        },
      ),
    );
  }
}

class Testing extends StatelessWidget {
  const Testing({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
      ),
    );
  }
}
