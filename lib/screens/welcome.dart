import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp_clone/screens/home.dart';
import 'package:whatsapp_clone/screens/verify_number.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Bem-vindo(a) ao WhatsApp',
                style: TextStyle(
                  fontSize: 28,
                  color: Theme.of(context).colorScheme.background,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                width: 300,
                height: 300,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  // color: Colors.black,
                ),
                child: Image.asset(
                  'assets/welcomebg.png',
                  width: 1000,
                  fit: BoxFit.cover,
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.background)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const VerifyNumber(),
                  ));
                },
                child: const Text('CONCORDAR E CONTINUAR'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
