// import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Appbar tutorial'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// DONE: SingleTickerProviderStateMixin used with TabBar
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'tổng hợp'),
    Tab(text: 'du lịch'),
    Tab(text: 'ẩm thực'),
    Tab(text: 'người Nhật'),
    Tab(text: 'vănh hoá'),
    Tab(text: 'sinhh hoạt'),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  TabController _appBarTabController;
  @override
  void initState() {
    _appBarTabController = TabController(length: myTabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _appBarTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: When click on the search icon, appear a search box that can search the content
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: null)
        ],
        backgroundColor: Colors.orange,
        title: Text(widget.title),
        // chuyển từ tab này sang tab khác cần aninmation ticker
        // https://api.flutter.dev/flutter/scheduler/Ticker-class.html
        bottom: TabBar(
            // default là click
            mouseCursor: SystemMouseCursors.allScroll,
            indicatorPadding: EdgeInsets.all(4),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.red,
            isScrollable: true,
            controller: _appBarTabController,
            tabs: myTabs),
        // TODO: Silver appbar here
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          // DONE: Khi thêm  title này vào sẽ nhìn thấy chữ chồng lên nhau
          // cho biết flexible space nằm ở dưới tabbar. vì nếu nằm trên thì click vào sẽ print
          title: Text('duc'),
          // show behind the title when expanded
          background: RaisedButton(onPressed: () {
            print('clicked');
          }),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
