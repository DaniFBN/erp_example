import '../../../domain/entities/packaging_entity.dart';

sealed class AddPackagingState {
  const AddPackagingState();

  factory AddPackagingState.initState() {
    return const InitialAddPackagingState();
  }
}

class InitialAddPackagingState extends AddPackagingState {
  const InitialAddPackagingState();
}

class SuccessAddPackagingState extends AddPackagingState {
  final PackagingEntity ingredient;

  const SuccessAddPackagingState(this.ingredient);
}
