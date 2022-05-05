import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AppConstants {
  AppConstants._();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static const String baseUrl = 'https://api.client.macbro.uz/v1/';
  static const String authUrl = 'https://api.auth.macbro.uz/';
  static const String android = '7d4a4c38-dd84-4902-b744-0488b80a4c03';
  static const String ios = '7d4a4c38-dd84-4902-b744-0488b80a4c02';
  static const String clientTypeId = '5a3818a9-90f0-44e9-a053-3be0ba1e2c07';
  static const String roleId = 'a1ca1301-4da9-424d-a9e2-578ae6dcde07';
  static const String companyId = 'e568df13-a773-4a83-a874-7dd1756aa88b';
}
