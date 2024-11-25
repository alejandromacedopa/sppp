import 'dart:convert';

import 'package:sppp/src/data/api/ApiConfig.dart';
import 'package:sppp/src/domain/models/Order.dart';
import 'package:sppp/src/domain/utils/ListToString.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as https;

class OrderService {
  Future<String> token;

  OrderService(this.token);

Future<Resource<List<Order>>> getUserOrder(String idclient) async {
  try {
    Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/orders/my-order');
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": await token
    };
    final response = await https.get(url, headers: headers);
    final data = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<Order> order = Order.fromJsonList(data);
      print('Order: ${order}');
      return Success(order);
    } else {
      // ERROR
      return Error(ListToString(data['message']));
    }
  } catch (e) {
    print('Error: $e');
    return Error(e.toString());
  }
}
}
