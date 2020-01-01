import 'package:flutter/material.dart';
import '../view/dashboard.dart';
import '../view/heroes.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  bool _showFab = false;
  TabController _tc;

  fabHandle() {
    (_tc.index == 0) ? _showFab = false : _showFab = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _tc = TabController(length: 2, vsync: this, initialIndex: 0);
    _tc.addListener(fabHandle);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text('Tour of Heroes',
                style: Theme.of(context).textTheme.headline),
            bottom: TabBar(isScrollable: true, controller: _tc, tabs: [
              Tab(
                child: Text("Dashboard",
                    style: Theme.of(context).textTheme.subhead),
              ),
              Tab(
                child:
                    Text("Heroes", style: Theme.of(context).textTheme.subhead),
              ),
            ]),
          ),
          body: TabBarView(
            controller: _tc,
            children: <Widget>[
              new DashView(),
              new HeroesView(),
            ],
          ),
          floatingActionButton: (_showFab)
              ? FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    Navigator.pushNamed(context, '/addhero');
                  },
                )
              : null),
    );
  }
}
