import 'package:chuck_interceptor/chuck.dart';
import 'package:flutter/foundation.dart';
import 'package:macbro/data/models/product/product_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../core/constants/constants.dart';
import '../models/banners/banners_response.dart';
import '../models/category/category_response.dart';
import '../models/featured_list/featured_list_response.dart';
import '../models/token/refresh_token_request.dart';
import '../models/token/refresh_token_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiClient {
  static Chuck alice = Chuck(
    navigatorKey: AppConstants.navigatorKey,
    showNotification: true,
    showInspectorOnShake: false,
    darkTheme: false,
  );

  static get getDio {
    Dio dio = Dio(BaseOptions(followRedirects: false));

    if (kDebugMode) {
      /// chuck interceptor
      dio.interceptors.add(alice.getDioInterceptor());

      /// log
      dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          request: true,
        ),
      );
    }

    return dio;
  }

  static CancelToken cancelToken = CancelToken();

  static ApiClient? _apiClient;

  static ApiClient getInstance({String baseUrl = AppConstants.baseUrl}) {
    if (_apiClient != null) {
      return _apiClient!;
    } else {
      _apiClient = ApiClient(getDio, cancelToken, baseUrl);
      return _apiClient!;
    }
  }

  static void removeApiClient() {
    _apiClient = null;
  }

  factory ApiClient(Dio dio, CancelToken cancelToken, String baseUrl) {
    dio.options = BaseOptions(receiveTimeout: 30000, connectTimeout: 30000);
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  /// Get banner list
  @GET('banner')
  Future<BannersResponse> getBanners(
    @Query('page') int page,
    @Query('limit') int limit,
  );

  /// Get categories and products
  @GET('category')
  Future<CategoryResponse> getCategories(
    @Query('page') int page,
    @Query('limit') int limit,
    @Query('lang') String lang,
  );

  @GET('featured-list/{key}')
  Future<FeaturedListResponse> getFeaturedList(
    @Path('key') String key,
    @Query('lang') String lang,
  );

  @GET('product/{slug}')
  Future<ProductResponse> getProduct(
    @Path('slug') String? slug,
    @Query('lang') String lang,
  );

  @GET('customers/refresh-token')
  Future<RefreshTokenResponse> refreshToken(
    @Body() RefreshTokenRequest request,
  );
}
