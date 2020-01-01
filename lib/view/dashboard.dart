import 'package:flutter/material.dart';
import '../main.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'addhero.dart';

class DashView extends StatefulWidget {
  @override
  _DashViewState createState() => _DashViewState();
}

class _DashViewState extends State<DashView> {
  final _inp = TextEditingController();
  var searchRes;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text('Top Heroes', style: Theme.of(context).textTheme.title),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: StateBuilder(
              models: [allHeroesList],
              builder: (context, _) {
                return GridView.count(
                  primary: false,
                  padding: EdgeInsets.all(20),
                  crossAxisCount: 3,
                  children: List.generate(
                      allHeroesList.allHeroes.length >= 6
                          ? 6
                          : allHeroesList.allHeroes.length, (i) {
                    return InkWell(
                      hoverColor: Colors.red,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child:
                            Center(child: Text(allHeroesList.allHeroes[i].name)),
                        color: (i == 0)
                            ? Colors.blue[50]
                            : Colors.lightBlue[i * 100],
                      ),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AddHeroView(hero: allHeroesList.allHeroes[i]),
                          ),
                        );
                      },
                    );
                  }),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text('Search hero', style: Theme.of(context).textTheme.title),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _inp,
              decoration: InputDecoration(hintText: "Start typing a name"),
              onChanged: (e) {
                if (e == "") {
                  setState(() {
                    searchRes = [];
                  });
                } else {
                  searchRes = allHeroesList.searchHero(e);
                  if (searchRes != -1) {
                    setState(() {});
                  }
                }
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: Container(
                child: searchRes != null
                    ? ListView(
                        children: searchRes.map<Widget>((e) {
                          return Ink(
                            color: Colors.white,
                            child: InkWell(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Text("${e.id}. ${e.name}"),
                              ),
                              onTap: () async {
                                _inp.text = "";
                                setState(() {
                                  searchRes = [];
                                });
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddHeroView(
                                        hero: e),
                                  ),
                                );
                              },
                            ),
                          );
                        }).toList(),
                      )
                    : Container()),
          )
        ],
      ),
    );
  }
}
