import '../../entities/ingredient_entity.dart';

sealed class AddIngredientState {
  const AddIngredientState();

  factory AddIngredientState.initState() {
    return const InitialAddIngredientState();
  }
}

class InitialAddIngredientState extends AddIngredientState {
  const InitialAddIngredientState();
}

class SuccessAddIngredientState extends AddIngredientState {
  final IngredientEntity ingredient;

  const SuccessAddIngredientState(this.ingredient);
}
