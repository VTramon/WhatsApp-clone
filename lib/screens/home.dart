import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp_clone/components/chat_view.dart';
import 'package:whatsapp_clone/components/custom_tab_indicator.dart';
import 'package:whatsapp_clone/components/status_view.dart';
import 'package:whatsapp_clone/screens/contacts.dart';

import '../components/calls_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
    _scrollViewController = ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Contacts()),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.background,
        child: const Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              height: _showAppbar ? 56.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: AppBar(
                title: const Text('WhatsApp'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                        child: Text('Menssagens favoritas'),
                      ),
                      const PopupMenuItem(
                        child: Text('Configurações'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF008069),
                          ),
                          child: TabBar(
                            indicator: CustomTabIndicator(
                              colors: const [
                                Colors.white,
                                Colors.white,
                                Colors.white,
                              ],
                              indicatorThickness: 3,
                              tabController: _tabController,
                            ),
                            controller: _tabController,
                            tabs: const [
                              Tab(
                                text: 'Conversas',
                              ),
                              Tab(
                                text: 'Status',
                              ),
                              Tab(
                                text: 'Chamadas',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ChatView(controller: _scrollViewController),
                        StatusView(controller: _scrollViewController),
                        CallsView(controller: _scrollViewController),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
