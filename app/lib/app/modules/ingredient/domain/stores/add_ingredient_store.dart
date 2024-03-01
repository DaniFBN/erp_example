import 'package:global_dependencies/global_dependencies.dart';

import '../helpers/params/add_ingredient_param.dart';
import '../repositories/i_ingredient_repository.dart';
import 'states/add_ingredient_state.dart';

class AddIngredientStore extends Store<AddIngredientState> {
  final IIngredientRepository _repository;

  AddIngredientStore(
    this._repository,
  ) : super(AddIngredientState.initState());

  Future<void> add(AddIngredientParam param) async {
    setLoading(true);

    final response = await _repository.add(param);

    response.fold(
      (ingredient) => update(SuccessAddIngredientState(ingredient)),
      setError,
    );
  }
}
