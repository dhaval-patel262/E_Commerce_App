import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../basicFiles/constants.dart';

Future<int> deleteCart(String userId, int cartId) async {
  final response = await http.delete(
    Uri.parse(KServerPath + 'cart/user_id/'+userId+'/cart_id/' + cartId.toString()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    var cartCount = 0;
    var res = json.decode(response.body);
    res.forEach((abc) {
      cartCount = abc['cartCount'];
    });
    return cartCount == null ? 0 : cartCount;
  } else {
    throw Exception('Failed to delete Product');
  }
}
