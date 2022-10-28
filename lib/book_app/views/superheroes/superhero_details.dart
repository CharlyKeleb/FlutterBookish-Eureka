import 'package:flutter/material.dart';
import 'package:flutter_web_projects/book_app/models/superhero.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class HeroDetails extends StatefulWidget {
  final SuperHero hero;

  const HeroDetails({Key? key, required this.hero}) : super(key: key);

  @override
  HeroDetailsState createState() => HeroDetailsState();
}

class HeroDetailsState extends State<HeroDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width > 1200 ? 320.0 : 40.0,
          vertical: 10.0,
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              floating: false,
              elevation: 0.0,
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.keyboard_backspace,
                  color: Colors.white,
                ),
              ),
              title: Text(
                widget.hero.name!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              expandedHeight: 70.h,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: widget.hero.images!.lg!,
                  child: Image.network(
                    widget.hero.images!.lg!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index > 0) return null;
                  return Column(
                    children: <Widget>[
                      PowerStats(hero: widget.hero),
                      const Divider(thickness: 1),
                      Appearance(hero: widget.hero),
                      const Divider(thickness: 1),
                      Biography(hero: widget.hero),
                      const Divider(thickness: 1),
                      Work(hero: widget.hero),
                      const Divider(thickness: 1),
                      Connections(hero: widget.hero),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PowerStats extends StatelessWidget {
  final SuperHero hero;

  const PowerStats({Key? key, required this.hero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: const Text(
        'PowerStats',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: <Widget>[
        ListTile(
          title: Text(
              "${"Intelligence".toUpperCase()}  ${hero.powerstats!.intelligence!}%"),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 2500,
            percent: hero.powerstats!.intelligence!.toDouble() / 100.0,
            barRadius: const Radius.circular(10.0),
            progressColor: Colors.blue,
          ),
        ),
        ListTile(
          title: Text(
              "${'Strength'.toUpperCase()}  ${hero.powerstats!.strength}%"),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 2500,
            percent: hero.powerstats!.strength!.toDouble() / 100.0,
            barRadius: const Radius.circular(10.0),
            progressColor: Colors.green,
          ),
        ),
        ListTile(
          title: Text("${'Speed'.toUpperCase()}  ${hero.powerstats!.speed}%"),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 2500,
            percent: hero.powerstats!.speed!.toDouble() / 100.0,
            barRadius: const Radius.circular(10.0),
            progressColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
        ListTile(
          title: Text('Durability'.toUpperCase()),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 2500,
            percent: hero.powerstats!.durability!.toDouble() / 100.0,
            barRadius: const Radius.circular(10.0),
            progressColor: Colors.red,
          ),
        ),
        ListTile(
          title: Text("${'Power'.toUpperCase()}  ${hero.powerstats!.power}%"),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 2500,
            percent: hero.powerstats!.power!.toDouble() / 100.0,
            barRadius: const Radius.circular(10.0),
            progressColor: Colors.purple,
          ),
        ),
        ListTile(
          title: Text(
            "${'Combat'.toUpperCase()}  ${hero.powerstats!.intelligence}%",
          ),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 2500,
            percent: hero.powerstats!.combat!.toDouble() / 100.0,
            barRadius: const Radius.circular(10.0),
            progressColor: Colors.amber,
          ),
        ),
      ],
    );
  }
}

class Appearance extends StatelessWidget {
  final SuperHero? hero;

  const Appearance({Key? key, required this.hero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: const Text(
        'Appearance',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: <Widget>[
        ListTile(
          title: Text(
            'Gender'.toUpperCase(),
          ),
          subtitle: Text(hero!.appearance!.gender!),
        ),
        ListTile(
          title: Text(
            'Race'.toUpperCase(),
          ),
          subtitle: Text(
            hero!.appearance!.race == null ? "-" : hero!.appearance!.race!,
          ),
        ),
        ListTile(
          title: Text(
            'Height'.toUpperCase(),
          ),
          subtitle: Text(hero!.appearance!.height
              .toString()
              .replaceAll("[", "")
              .replaceAll("]", "")),
        ),
        ListTile(
          title: Text(
            'Weight'.toUpperCase(),
          ),
          subtitle: Text(hero!.appearance!.weight
              .toString()
              .replaceAll("[", "")
              .replaceAll("]", "")),
        ),
        ListTile(
          title: Text(
            'Hair Color'.toUpperCase(),
          ),
          subtitle: Text(hero!.appearance!.hairColor!),
        ),
        ListTile(
          title: Text(
            'Eye Color'.toUpperCase(),
          ),
          subtitle: Text(hero!.appearance!.eyeColor!),
        ),
      ],
    );
  }
}

class Biography extends StatelessWidget {
  final SuperHero? hero;

  const Biography({Key? key, required this.hero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: const Text(
        'Biography',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: <Widget>[
        ListTile(
          title: Text(
            'Full Name'.toUpperCase(),
          ),
          subtitle: Text(hero!.biography!.fullName!),
        ),
        ListTile(
          title: Text(
            'Alter Ego(s)'.toUpperCase(),
          ),
          subtitle: Text(hero!.biography!.alterEgos!),
        ),
        ListTile(
          title: Text(
            'Aliases'.toUpperCase(),
          ),
          subtitle: Text(hero!.biography!.aliases!
              .toString()
              .replaceAll("[", "")
              .replaceAll("]", "")),
        ),
        ListTile(
          title: Text(
            'Place Of Birth'.toUpperCase(),
          ),
          subtitle: Text(hero!.biography!.placeOfBirth!),
        ),
        ListTile(
          title: Text(
            'Publisher'.toUpperCase(),
          ),
          subtitle: Text(
            hero!.biography!.publisher == null
                ? "-"
                : hero!.biography!.publisher!,
          ),
        ),
        ListTile(
          title: Text(
            'Alignment'.toUpperCase(),
          ),
          subtitle: Text(
            hero!.biography!.alignment!,
          ),
        ),
      ],
    );
  }
}

class Work extends StatelessWidget {
  final SuperHero? hero;

  const Work({Key? key, this.hero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: const Text(
        'Work',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: <Widget>[
        ListTile(
          title: Text(
            'Occupation'.toUpperCase(),
          ),
          subtitle: Text(hero!.work!.occupation!),
        ),
        ListTile(
          title: Text(
            'Base'.toUpperCase(),
          ),
          subtitle: Text(
            (hero!.work!.base!),
          ),
        )
      ],
    );
  }
}

class Connections extends StatelessWidget {
  final SuperHero? hero;

  const Connections({Key? key, this.hero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: const Text(
        'Connections',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: <Widget>[
        ListTile(
          title: Text(
            'Group Affiliation'.toUpperCase(),
          ),
          subtitle: Text(hero!.connections!.groupAffiliation!),
        ),
        ListTile(
          title: Text(
            'Relatives'.toUpperCase(),
          ),
          subtitle: Text(hero!.connections!.relatives!),
        )
      ],
    );
  }
}
