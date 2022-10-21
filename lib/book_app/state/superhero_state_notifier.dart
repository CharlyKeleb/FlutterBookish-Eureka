import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_projects/book_app/models/superhero.dart';
import 'package:flutter_web_projects/book_app/repositories/superhero_repository.dart';
import 'package:flutter_web_projects/utils/util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'superhero_state.dart';

part 'superhero_state_notifier.freezed.dart';

class SuperHeroStateNotifier extends StateNotifier<SuperHeroState> {
  final SuperHeroRepository _repository;

  SuperHeroStateNotifier({
    required SuperHeroRepository repository,
  })  : _repository = repository,
        super(const SuperHeroState.started());

  Future<void> getSuperHero() async {
    state = const SuperHeroState.loadInProgress();
    try {
      List superHeroList = await _repository.getSuperHeroes();
      List<SuperHero> superheroes =
          superHeroList.map((e) => SuperHero.fromJson(e)).toList();

      state = SuperHeroState.success(superheroes: superheroes);
    } catch (e) {
      if (Util.isConnectionError(e)) {
        state = const SuperHeroState.error(isConnectionError: true);
      } else {
        state = const SuperHeroState.error();
      }
    }
  }
}
