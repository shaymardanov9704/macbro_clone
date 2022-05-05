
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:macbro/base/base_repository.dart';
import 'package:macbro/data/provider/server_error.dart';

import '../../models/product/single_product_response.dart';
import '../../provider/api_client.dart';
import '../../provider/response_handler.dart';

class FavoriteRepository extends BaseRepository{

  ApiClient? apiClient;

  FavoriteRepository({required this.apiClient});

  Future<ResponseHandler<SingleProductResponse>> _fetchProduct(
      String id) async {
    SingleProductResponse response;
    try {
      response = (await apiClient!.getProduct(id,'ru'));
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getProduct(String id) async {
    final response = await _fetchProduct(id);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }
}