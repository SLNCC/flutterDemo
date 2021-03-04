import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/home_page.dart';
import 'package:flutter_application_1/Idea/idea_page.dart';
import 'package:flutter_application_1/Market/market_page.dart';
import 'package:flutter_application_1/My/my_page.dart';
import 'package:flutter_application_1/Notice/notice_page.dart';

import '../global_config.dart';
import 'navigation_icon_view.dart';

class Index extends StatefulWidget {
  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> with TickerProviderStateMixin  {
  int _currentIndex = 0; 
  StatefulWidget _currentPage;
  List<StatefulWidget> _pageList;
  List<NavigationIconView> items;

  @override
  void initState() {
    super.initState();
    items = <NavigationIconView>[
      new NavigationIconView(
        icon: Icon(Icons.assignment),
        title: "首页",
        vsync: this,
      ),
      new NavigationIconView(
        icon: Icon(Icons.all_inclusive),
        title: "想法",
        vsync: this,
      ),
      new NavigationIconView(
        icon: Icon(Icons.add_shopping_cart),
        title: "市场",
        vsync: this,
      ),
      new NavigationIconView(
        icon: Icon(Icons.add_alert),
        title: "通知",
        vsync: this,
      ),
      new NavigationIconView(
        icon: Icon(Icons.perm_identity),
        title: "我的",
        vsync: this,
      ),
    ];
    
    _pageList = <StatefulWidget>[
      new HomePage(),
      new IdeaPage(),
      new MarketPage(),
      new NoticePage(),
      new MyPage()
    ];
     _currentPage = _pageList[_currentIndex];
  }

  void _onItemTapped(int index) {

    setState(() {
      _currentIndex = index;
      _currentPage = _pageList[_currentIndex]; 
    });

  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      items: items.map((e) => e.item).toList(),
      currentIndex: _currentIndex,
      selectedFontSize: 14.0,
      unselectedFontSize: 14.0,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.blue,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        this._onItemTapped(index);
      },
    );
    return MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: _currentPage,
        ),
        bottomNavigationBar: bottomNavigationBar,

      ),
      theme: GlobalConfig.themeData,
    );
  }
}

