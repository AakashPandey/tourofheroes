import 'package:states_rebuilder/states_rebuilder.dart';

class HeroList extends StatesRebuilder {
  List<HeroModel> allHeroes = [];
  int count = 6;
  List names = [];

  HeroList() {
    this.allHeroes.add(HeroModel(1, "Narco"));
    this.allHeroes.add(HeroModel(2, "Bombasto"));
    this.allHeroes.add(HeroModel(3, "Celeritas"));
    this.allHeroes.add(HeroModel(4, "Magenta"));
    this.allHeroes.add(HeroModel(5, "Dr IQ"));
    buildNames();
  }

  buildNames() {
    this.names = this.allHeroes.map((n) => n.name.toLowerCase()).toList();
  }

  addHero(String name) {
    HeroModel h = new HeroModel(this.count, name);
    this.allHeroes.add(h);
    this.count++;

    buildNames();
    rebuildStates();
  }

  remHero(HeroModel h) {
    (this.allHeroes.contains(h)) && this.allHeroes.remove(h);

    buildNames();
    rebuildStates();
  }

  editHero(String oh, nh) {
    List names = this.allHeroes.map((n) => n.name).toList();
    int i = names.indexOf(oh);
    if (i != -1) {
      this
          .allHeroes
          .replaceRange(i, i + 1, [HeroModel(this.allHeroes[i].id, nh)]);
      print(this.allHeroes.map((n) => n.name).toList().toString());

      buildNames();
      rebuildStates();
    }
  }

  searchHero(h) {
    List res = [];

    this.names.forEach((n) {
      if (n.toString().startsWith(h.toString().toLowerCase())) {
        res.add(allHeroes[this.names.indexOf(n)]);
      } else if (res.contains(this.names.indexOf(n))) {
        res.remove(this.allHeroes.indexOf(n));
      }
    });

    return res;
  }
}

class HeroModel {
  int id;
  String name;

  HeroModel(this.id, this.name);
}
