import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/page/HomePage/HomePage.dart';

import '../main.dart';
import 'Login/LoginScreen.dart';
import 'Register/RegisterScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final List<Widget> listScreens =
  [
    const HomePage(),
    MyHomePage(title: '',),
    login(),
    Register(),
  ];
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: listScreens.length);
    _tabController?.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
    });
  }
  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.yellow,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTabController(
        length: listScreens.length,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(), children: listScreens
          ),
          bottomNavigationBar: Container(
            color: Colors.transparent,
            child: ClipRRect(
              child: Container(
                //color: Colors.white,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(top: BorderSide(color: Colors.transparent, width: 5)),
                ),
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.white,
                  indicatorColor: Colors.transparent,
                  tabs: [

                    Tab(
                      child: const Text('Trang 1', style: TextStyle(fontSize: 10), textAlign: TextAlign.center,),
                      icon: Icon(CupertinoIcons.home, color: _tabController?.index == 0 ? Colors.red : Colors.grey),
                    ),
                    Tab(
                      child: const Text('Trang 1', style: TextStyle(fontSize: 10), textAlign: TextAlign.center,),
                      icon: Icon(CupertinoIcons.home, color: _tabController?.index == 1 ? Colors.red : Colors.grey),
                    ),
                    Tab(
                      child: const Text('Trang 3', style: TextStyle(fontSize: 10), textAlign: TextAlign.center,),
                      icon: Icon(CupertinoIcons.home, color: _tabController?.index == 2 ? Colors.red : Colors.grey),
                    ),



                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
  }

  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
