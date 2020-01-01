import 'package:flutter/material.dart';
import 'package:heroes/main.dart';
import 'package:heroes/view/addhero.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class HeroesView extends StatefulWidget {
  @override
  _HeroesViewState createState() => _HeroesViewState();
}

class _HeroesViewState extends State<HeroesView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: StateBuilder(
              models: [allHeroesList],
              builder: (context, _) {
                return ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    itemCount: allHeroesList.allHeroes.length,
                    separatorBuilder: (BuildContext context, int t) {
                      return Container(height: 15,);
                    },
                    itemBuilder: (BuildContext context, int i) {
                      return Ink(
                        color: Colors.white,
                        child: InkWell(
                          child: Container(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                      "${allHeroesList.allHeroes[i].id}. ${allHeroesList.allHeroes[i].name}",
                                      style: Theme.of(context).textTheme.body1),
                                  IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      allHeroesList
                                          .remHero(allHeroesList.allHeroes[i]);
                                    },
                                  )
                                ],
                              )),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AddHeroView(hero: allHeroesList.allHeroes[i]),
                              ),
                            );
                          },
                        ),
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
