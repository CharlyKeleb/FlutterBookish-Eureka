import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_projects/book_app/repositories/superhero_repository.dart';
import 'package:flutter_web_projects/book_app/state/superhero_state_notifier.dart';

final superheroRepositoryProvider = Provider.autoDispose<SuperHeroRepository>(
  (ref) => SuperHeroRepository(),
);

final superHeroStateNotifierProvider =
    StateNotifierProvider.autoDispose<SuperHeroStateNotifier, SuperHeroState>(
  (ref) {
    final repository = ref.watch(superheroRepositoryProvider);
    return SuperHeroStateNotifier(repository: repository);
  },
);
