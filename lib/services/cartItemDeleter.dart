
import 'package:http/http.dart' as http;

import '../constants.dart';

Future<http.Response> deleteCart(int userId,int productId) {
  return http.delete(
    Uri.parse(KServerPath + 'cart/user_id/1/product_id/0'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}


