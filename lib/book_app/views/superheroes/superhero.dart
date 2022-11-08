import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_web_projects/Theme/theme.dart';
import 'package:flutter_web_projects/book_app/components/loading_indicator.dart';
import 'package:flutter_web_projects/book_app/components/navigate.dart';
import 'package:flutter_web_projects/book_app/models/superhero.dart';
import 'package:flutter_web_projects/book_app/view_models/superhero/superhero_view_model.dart';
import 'package:flutter_web_projects/book_app/views/superheroes/superhero_details.dart';
import 'package:flutter_web_projects/utils/extension.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Superheroes extends StatefulWidget {
  const Superheroes({Key? key}) : super(key: key);

  @override
  State<Superheroes> createState() => _SuperheroesState();
}

class _SuperheroesState extends State<Superheroes>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<SuperHeroViewModel>(context, listen: false)
          .fetchSuperHeroes();
    });
  }

  @override
  Widget build(BuildContext context) {
    SuperHeroViewModel viewModel = Provider.of<SuperHeroViewModel>(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width > 1200 ? 320.0 : 40.0,
        ),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Superhero & Villains',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
              ),
            ).fadeInList(0, false),
            const Text(
              'Let\'s take a look at all Superheroes and Villains from different universe',
              style: TextStyle(),
            ).fadeInList(1, false),
            const SizedBox(height: 20.0),
            Flexible(
              child: viewModel.loading
                  ? loadingIndicator(context)
                  : GridView.builder(
                      itemCount: viewModel.superHero.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.8 / 2.6,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        SuperHero superhero =
                            SuperHero.fromJson(viewModel.superHero[index]);
                        return Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.width > 1200
                                  ? 45.h
                                  : 45.0.h,
                              width: MediaQuery.of(context).size.width > 1200
                                  ? 19.0.w
                                  : 22.0.w,
                              child: GestureDetector(
                                onTap: () {
                                  Navigate.pushPage(
                                    context,
                                    HeroDetails(hero: superhero),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 5,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    child: Hero(
                                      tag: superhero.images!.lg!,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              superhero.images!.lg!,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              superhero.name!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Constants.lightAccent
                                    : Constants.blueAccent,
                              ),
                            ),
                          ],
                        ).fadeInGrid(index);
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    Provider.of<SuperHeroViewModel>(context, listen: false).dispose();
    super.dispose();
  }
}
