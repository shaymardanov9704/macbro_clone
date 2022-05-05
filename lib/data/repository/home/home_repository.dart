import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:macbro/data/models/featured_list/featured_list_response.dart';
import 'package:macbro/data/models/new/new_response.dart';
import 'package:macbro/data/models/product/single_product_response.dart';

import '../../../base/base_repository.dart';
import '../../models/banners/banners_response.dart';
import '../../models/category/category_response.dart';
import '../../provider/api_client.dart';
import '../../provider/response_handler.dart';
import '../../provider/server_error.dart';

class HomeRepository extends BaseRepository {
  ApiClient? apiClient;

  HomeRepository({required this.apiClient}) : assert(apiClient != null);

  Future<ResponseHandler<BannersResponse>> _fetchBanners({
    required int page,
    required int limit,
  }) async {
    BannersResponse response;
    try {
      response = await apiClient!.getBanners(1, 100);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getBanners() async {
    final response = await _fetchBanners(limit: 100, page: 1);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

  Future<ResponseHandler<CategoryResponse?>> _fetchCategoryWithProducts(
      {int page = 1, int limit = 100}) async {
    CategoryResponse response;
    try {
      response = await apiClient!.getCategories(page, limit, 'ru');
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getCategories() async {
    final response = await _fetchCategoryWithProducts();
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? 'Error',
      );
    }
  }

  Future<ResponseHandler<FeaturedListResponse>> _fetchNewProducts() async {
    FeaturedListResponse response;
    try {
      response = (await apiClient!.getFeaturedList("rasprodazha", 'ru'));
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getFeaturedList() async {
    final response = await _fetchNewProducts();
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }


}
