import 'package:movies_clean_arch_mvvm/core/app_imports.dart';

const cacheDuration = Duration(minutes: 10);

abstract class LocalDataSource {
  Future<List<MovieResponse>> getHomeData({required String key});

  Future<void> saveHomeDataToCache({required String key,required List<MovieResponse> movies});

  void clearCache();

  void clearKeyFromCache({required String key});
}

class LocalDataSourceImpl implements LocalDataSource {
  Map<String, CacheItem> cacheMap = {};

  @override
  Future<void> saveHomeDataToCache({required String key,required List<MovieResponse> movies}) async {
    cacheMap[key] = CacheItem(data: movies);
  }

  @override
  Future<List<MovieResponse>> getHomeData({required String key}) async {
    CacheItem? cacheItem = cacheMap[key];
    if (cacheItem != null && cacheItem.isValid(60 * 1000)) {
      ///return data from cache
      return await cacheItem.data;
    } else {
      ///return data from api
      return throw Exception('No data in cache');
    }
  }

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void clearKeyFromCache({required String key}) {
    cacheMap.remove(key);
  }
}

class CacheItem {
  final dynamic data;
  int cachedTime = DateTime.now().millisecondsSinceEpoch;

  CacheItem({required this.data});
}

extension CacheItemExtension on CacheItem {
  bool isValid(int expiredTime) {
    int currentTime = DateTime.now().millisecondsSinceEpoch;

    return currentTime - cachedTime <= expiredTime;
  }
}
