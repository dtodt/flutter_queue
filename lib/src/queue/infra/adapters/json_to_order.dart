import 'package:queue/src/queue/domain/value_objects/order.dart';

/// Order json mapper
class JsonToOrder {
  static Order fromMap(dynamic json) {
    return Order(
      id: json['id'],
      position: json['position'],
      timestamp: DateTime.parse(json['timestamp']),
      status: OrderStatus.values.firstWhere((en) => en.name == json['status']),
    );
  }

  static List<Order> fromList(List<dynamic> list) {
    return list.map((json) => fromMap(json)).toList();
  }

  static Map<String, dynamic> toMap(Order order) {
    return {
      'id': order.id,
      'position': order.position,
      'timestamp': order.timestamp.toIso8601String(),
      'status': order.status.name,
    };
  }

  static List<Map<String, dynamic>> toList(List<Order> list) {
    return list.map((order) => toMap(order)).toList();
  }
}
