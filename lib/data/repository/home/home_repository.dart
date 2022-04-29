import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:macbro/core/constants/constants.dart';
import 'package:macbro/data/models/new/new_response.dart';
import 'package:macbro/ui/main/home/widgets/new.dart';

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
    required String shipperId,
    required int page,
    required int limit,
  }) async {
    BannersResponse response;
    try {
      response = await apiClient!.getBanners(shipperId, page, limit);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getBanners({required String shipperId}) async {
    final response =
    await _fetchBanners(shipperId: shipperId, limit: 100, page: 1);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

  Future<ResponseHandler<CategoryResponse?>> _fetchCategoryWithProducts(
      {required String shipperId, int page = 1, int limit = 1000}) async {
    CategoryResponse response;
    try {
      response = await apiClient!
          .getCategoryWithProduct(shipperId, page, limit, true, false);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getCategoryWithProducts({required String shipperId}) async {
    final response = await _fetchCategoryWithProducts(shipperId: shipperId);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }



  Future<ResponseHandler<News>> _fetchNewProducts({required String shipperId,
    int page = 1,
    int limit = 1000})async{
    News response;
    try {
      response = (await apiClient!
          .getNew(shipperId,'')) as News;
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response as News?;
  }

  Future<dynamic> getNewProducts( {required String shipperId})async{
    final response =
    await _fetchNewProducts(shipperId: shipperId);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }
}