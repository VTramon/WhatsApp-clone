import 'package:flutter/material.dart';

class VerifyNumber extends StatelessWidget {
  const VerifyNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actionsIconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.onSecondary),
        titleTextStyle: TextStyle(
            fontSize: 20, color: Theme.of(context).colorScheme.background),
        title: const Text('Insira seu número de telefone'),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                child: Text('Ajuda'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                  'O WhatsApp precisa confirmar o seu número de telefone.'),
            ),
            Center(
              child: Text(
                'Qual o seu número?',
                style: TextStyle(color: Colors.blue.shade800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Theme.of(context).colorScheme.background))),
                child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Brasil',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: 50.0,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Theme.of(context).colorScheme.background,
                      ))),
                      child: const Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            '55',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      cursorColor: Theme.of(context).colorScheme.background,
                      cursorHeight: double.maxFinite,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        hintText: 'seu número',
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Theme.of(context).colorScheme.background)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color:
                                    Theme.of(context).colorScheme.background)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
