
import 'package:flutter/material.dart';
class HomeTopTabs extends StatefulWidget {

  HomeTopTabs(this.colorVal);
  int colorVal;

  _HomeTopTabsState createState() => _HomeTopTabsState();
}

class _HomeTopTabsState extends State<HomeTopTabs> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 6);
    _tabController.addListener(_handleTabSelection);
  }
  void _handleTabSelection() {
    setState(() {
      widget.colorVal=0xffff5722;
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:6,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorWeight: 4.0,
            indicatorColor:Color(0xffff5722),
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              Tab(
                icon:Icon(Icons.category, color: _tabController.index == 0
                    ? Color( widget.colorVal)
                    : Colors.grey),
                child:Text('For You',style: TextStyle( color: _tabController.index == 0
                    ?  Color( widget.colorVal)
                    : Colors.grey)),
              ),
              Tab(
                icon: Icon(Icons.bar_chart, color: _tabController.index == 1
                    ? Color( widget.colorVal)
                    : Colors.grey),
                child: Text('Top Charts',style: TextStyle( color: _tabController.index == 1
                    ?  Color( widget.colorVal)
                    : Colors.grey)),
              ),
              Tab(
                icon: Icon(Icons.share, color: _tabController.index == 2
                    ? Color( widget.colorVal)
                    : Colors.grey),
                child: Text('Categories',style: TextStyle( color: _tabController.index == 2
                    ?  Color( widget.colorVal)
                    : Colors.grey)),
              ),
              Tab(
                icon: Icon(Icons.book, color: _tabController.index == 3
                    ? Color( widget.colorVal)
                    : Colors.grey),
                child: Text('Family',style: TextStyle( color: _tabController.index == 3
                    ?  Color( widget.colorVal)
                    : Colors.grey)),
              ),
              Tab(
                icon: Icon(Icons.car_rental, color: _tabController.index == 4
                    ? Color( widget.colorVal)
                    : Colors.grey),
                child: Text('Early Access',style: TextStyle( color: _tabController.index == 4
                    ?  Color( widget.colorVal)
                    : Colors.grey)),
              ),
              Tab(
                icon: Icon(Icons.open_in_browser, color: _tabController.index == 5
                    ? Color( widget.colorVal)
                    : Colors.grey),
                child: Text('Editors choice',style: TextStyle( color: _tabController.index == 5
                    ?  Color( widget.colorVal)
                    : Colors.grey)),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              height: 200.0,
              child: Center(child: Text('Category')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('Family')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('Early Access')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('Editor Choice')),
            ),
          ],
        ),
      ),
    );
  }
}