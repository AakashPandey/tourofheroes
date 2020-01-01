import 'package:flutter/material.dart';
import '../model/herodata.dart';
import '../main.dart';

class AddHeroView extends StatefulWidget {
  static const String routeName = "/addhero";
  final HeroModel hero;

  AddHeroView({Key key, @required this.hero}) : super(key: key);

  @override
  _AddHeroViewState createState() => _AddHeroViewState();
}

class _AddHeroViewState extends State<AddHeroView> {
  final _inp = TextEditingController();
  String _firstLetter = "";

  @override
  void initState() {
    super.initState();
    if (widget.hero != null) {
      _inp.text = widget.hero.name;
      _firstLetter = widget.hero.name[0];
    }
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
          iconTheme: IconThemeData(color: Colors.blue),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text('Tour of Heroes',
              style: Theme.of(context).textTheme.headline),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(widget.hero != null ? 'Edit hero' : 'Add a hero',
                  style: Theme.of(context).textTheme.title),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    child: Text(
                      _firstLetter,
                      style: Theme.of(context).textTheme.body2,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                      child: TextField(
                    controller: _inp,
                    decoration: InputDecoration(hintText: 'Enter hero name'),
                    onChanged: (e) {
                      if (e == "") {
                        setState(() {
                          _firstLetter = "";
                        });
                      } else if (_firstLetter != e[0])
                        setState(() {
                          _firstLetter = e[0];
                        });
                    },
                  ))
                ],
              )),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            if (_inp.text != "" && widget.hero == null) {
              allHeroesList.addHero(_inp.text);
              Navigator.of(context).pop();
            } else if (_inp.text != "") {
              allHeroesList.editHero(widget.hero.name, _inp.text);
              Navigator.of(context).pop();
            }
          },
        ),
      ),
    );
  }
}
