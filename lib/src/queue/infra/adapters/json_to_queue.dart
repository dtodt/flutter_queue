import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/infra/adapters/json_to_order.dart';

/// Queue json mapper
class JsonToQueue {
  static QueueEntity fromMap(dynamic json) {
    return QueueEntity(
      id: json['id'],
      title: json['title'],
      acronym: json['acronym'],
      priority: json['priority'],
      orders: json.containsKey('orders')
          ? JsonToOrder.fromList(json['orders'] as List)
          : [],
    );
  }

  static List<QueueEntity> fromList(List<dynamic> list) {
    return list.map((json) => fromMap(json)).toList();
  }
}
