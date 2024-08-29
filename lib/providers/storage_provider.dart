import 'package:get_storage/get_storage.dart';

class StorageProvider {
  static final _box = GetStorage();

  static dynamic get(String key, [Function(Map)? transformer]) {
    dynamic data = _box.read(key);

    if (transformer != null && data != null) {
      return transformer(data);
    } else {
      return data;
    }
  }

  static dynamic index(String key, int? id) {
    return _box.read(key).firstWhere((e) => e['id'] == id);
  }

  static List all(String key, Function(Map) transformer) {
    return (_box.read(key) ?? []).map((e) => transformer(e)).toList();
  }

  static void store(Map data, [Function? transformer]) {
    data.forEach((key, value) {
      _box.write(key, transformer != null ? transformer(value) : value);
    });
  }

  static void create(String key, Map data) {
    List modified = _box.read(key);
    modified.add(data);

    _box.write(key, modified);
  }

  static void set(String key, dynamic value) {
    _box.write(key, value);
  }

  static void update(String key, int id, Map data) {
    List modified = _box.read(key);
    int index = modified.indexWhere((e) => e['id'] == id);
    modified[index] = data;

    _box.write(key, modified);
  }

  static void delete(String key, int id) {
    List modified = _box.read(key);
    modified.removeWhere((e) => e['id'] == id);

    _box.write(key, modified);
  }

  static void clear() {
    _box.remove('user');
    _box.remove('token');
  }
}
