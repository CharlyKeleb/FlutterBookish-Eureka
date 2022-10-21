part of 'superhero_state_notifier.dart';


@freezed
class SuperHeroState with _$SuperHeroState {
  const factory SuperHeroState.started() = SuperHeroStateStarted;

  const factory SuperHeroState.loadInProgress() = SuperHeroStateLoadInProgress;

  const factory SuperHeroState.success({
    required List<SuperHero> superheroes,
  }) = SuperHeroStateSuccess;

  const factory SuperHeroState.error({bool? isConnectionError}) = SuperHeroStateError;
}