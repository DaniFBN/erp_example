import '../../../../core.dart';

class CrudConfig {
  final String createUrl;
  final String readUrl;
  final String updateUrl;
  final String deleteUrl;

  const CrudConfig({
    required this.createUrl,
    required this.readUrl,
    required this.updateUrl,
    required this.deleteUrl,
  });

  const CrudConfig.sameUrl(String url)
      : createUrl = url,
        updateUrl = url,
        readUrl = url,
        deleteUrl = url;
}

abstract class Mapper<R, P> {
  R fromMap(Map<String, dynamic> data);
  Map<String, dynamic> addToMap(P param);
  Map<String, dynamic> updateToMap(R param);
}

class CrudRepository<R extends Object, P> extends Repository
    implements ICrudRepository<R, P> {
  final IHttpService _http;
  final CrudConfig _config;
  final Mapper<R, P> _mapper;

  const CrudRepository({
    required IHttpService http,
    required CrudConfig config,
    required Mapper<R, P> mapper,
  })  : _http = http,
        _config = config,
        _mapper = mapper;

  @override
  AsyncResult<R> create(P param) async {
    return await execute<R>(() async {
      final response = await _http.post(
        _config.createUrl,
        data: _mapper.addToMap(param),
      );

      final data = _mapper.fromMap(
        Map<String, dynamic>.from(response.data),
      );

      return data;
    });
  }

  @override
  AsyncResult<bool> delete(int id) async {
    return await execute<bool>(() async {
      await _http.delete('${_config.deleteUrl}/$id');

      return true;
    });
  }

  @override
  AsyncResult<List<R>> read(GetParam param) async {
    return await execute<List<R>>(() async {
      final queryParams = <String, String>{};
      for (final item in param.items) {
        queryParams.addAll({item.key: item.value});
      }

      final response = await _http.get(
        _config.readUrl,
        queryParams: queryParams,
      );

      final data = List<Map<String, dynamic>>.from(response.data);

      final handledData = data.map(_mapper.fromMap).toList();

      return handledData;
    });
  }

  @override
  AsyncResult<R> update(R param) async {
    return await execute<R>(() async {
      final response = await _http.post(
        _config.createUrl,
        data: _mapper.updateToMap(param),
      );

      final data = _mapper.fromMap(
        Map<String, dynamic>.from(response.data),
      );

      return data;
    });
  }
}
