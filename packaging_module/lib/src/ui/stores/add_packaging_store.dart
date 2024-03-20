import 'package:global_dependencies/global_dependencies.dart';

import '../../crud/usecases/add_packaging_usecase.dart';
import '../../domain/helpers/params/add_packaging_param.dart';
import 'states/add_packaging_state.dart';

class AddPackagingStore extends Store<AddPackagingState> {
  final IAddPackagingUsecase _addPackagingUsecase;

  AddPackagingStore(
    this._addPackagingUsecase,
  ) : super(AddPackagingState.initState());

  bool get isSuccess => state is SuccessAddPackagingState;

  Future<void> add(AddPackagingParam param) async {
    setLoading(true);

    final response = await _addPackagingUsecase(param);

    response.fold(
      (ingredient) => update(SuccessAddPackagingState(ingredient)),
      setError,
    );
  }
}
