import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_web_projects/Theme/theme.dart';
import 'package:flutter_web_projects/book_app/components/error/error_widget.dart';
import 'package:flutter_web_projects/book_app/provider/superhero_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

class Superheroes extends HookConsumerWidget {
  const Superheroes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var superHeroState = ref.watch(superHeroStateNotifierProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.watch(superHeroStateNotifierProvider).maybeWhen(
              orElse: () {},
              started: () {
                ref
                    .watch(superHeroStateNotifierProvider.notifier)
                    .getSuperHero();
              },
            );
      });
      return () {};
    });

    return Scaffold(
      body: superHeroState.maybeWhen(
        orElse: () => const Center(child: CircularProgressIndicator()),
        error: (isConnectionError) => MyErrorWidget(
          refreshCallBack: () =>
              ref.watch(superHeroStateNotifierProvider.notifier).getSuperHero(),
          isConnection: isConnectionError ?? false,
        ),
        success: (superheroes) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal:
                  MediaQuery.of(context).size.width > 1200 ? 320.0 : 40.0,
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
                ),
                const Text(
                  'Let\'s take a look at all Superheroes and Villains from different universe',
                  style: TextStyle(),
                ),
                const SizedBox(height: 20.0),
                Flexible(
                  child: GridView.builder(
                    itemCount: 30,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.8 / 2.3,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width > 1200
                                ? 36.h
                                : 35.0.h,
                            width: MediaQuery.of(context).size.width > 1200
                                ? 19.0.w
                                : 22.0.w,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 5,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        superheroes[index].images!.lg!,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            superheroes[index].name!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Constants.blueAccent,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
