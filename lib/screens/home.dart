import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp_clone/components/chat_view.dart';
import 'package:whatsapp_clone/components/custom_tab_indicator.dart';

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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              height: _showAppbar ? 56.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: AppBar(
                title: const Text('WhatsApp'),
                actions: [
                  _AppBarIconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                  _AppBarIconButton(
                    icon: const Icon(Icons.more_vert_rounded),
                    onPressed: () {},
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
                        const Center(child: Text('Contatos')),
                        const Center(child: Text('Chamadas')),
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

class _AppBarIconButton extends StatelessWidget {
  final void Function() onPressed;
  final Icon icon;
  const _AppBarIconButton(
      {Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
    );
  }
}
