import 'package:flutter_advanced/data/network/error_handler.dart';
import 'package:flutter_advanced/data/response/responses.dart';

const cacheHomeKey = 'CacheHomeKey';
const cacheHomeDuration = 60 * 1000;

abstract class LocalDataSource {
  Future<HomeDataResponse> getHomeData();

  Future<void> saveHomeDataResponseToCache(HomeDataResponse homeDataResponse);

  void clearCache();

  void removeFromCache(String key);
}

class LocalDataSourceImpl implements LocalDataSource {
  Map<String, CachedItem> cacheMap = {};

  // runtime cache

  @override
  Future<HomeDataResponse> getHomeData() async {
    CachedItem? cachedItem = cacheMap[cacheHomeKey];
    print(cachedItem);
    if (cachedItem != null &&
        cachedItem.isValid(expirationTimeInMillSeconds: cacheHomeDuration)) {
      return cachedItem.data;
    } else {
      throw (ErrorHandler.handle(DataSources.cacheError));
    }
  }

  @override
  Future<void> saveHomeDataResponseToCache(
      HomeDataResponse homeDataResponse) async {
    cacheMap[cacheHomeKey] = CachedItem(homeDataResponse);
  }

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }
}

class CachedItem {
  dynamic data;
  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);
}

extension CachedItemExtention on CachedItem {
  bool isValid({required int expirationTimeInMillSeconds}) {
    int currentTimeInMillSeconds = DateTime.now().millisecondsSinceEpoch;
    bool isValid =
        currentTimeInMillSeconds - cacheTime <= expirationTimeInMillSeconds;
    print(isValid);
    return isValid;
  }
}
