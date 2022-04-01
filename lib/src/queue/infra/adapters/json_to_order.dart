import 'package:queue/src/queue/domain/value_objects/order.dart';

/// Order json mapper
class JsonToOrder {
  static Order fromMap(dynamic json) {
    return Order(
      uid: json['uid'],
      position: json['position'],
      timestamp: DateTime.parse(json['timestamp']),
      status: OrderStatus.values.firstWhere((en) => en.name == json['status']),
    );
  }

  static List<Order> fromList(List<dynamic> list) {
    return list.map((json) => fromMap(json)).toList();
  }
}
