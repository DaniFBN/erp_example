import '../../../../core.dart';

abstract class ICrudRepository<R, P> {
  AsyncResult<R> create(P param);
  AsyncResult<List<R>> read(GetParam param);
  AsyncResult<R> update(R param);
  AsyncResult<bool> delete(int id);
}

class GetItem {
  final String key;
  final String value;

  GetItem(this.key, this.value);
}

class GetParam {
  final List<GetItem> items;

  const GetParam(this.items);
  GetParam.single(String key, String value) : items = [GetItem(key, value)];
  const GetParam.empty() : items = const [];
}
