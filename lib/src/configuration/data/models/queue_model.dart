import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/value_objects/order.dart';

class QueueModel extends QueueEntity {
  QueueModel({
    required String id,
    required String title,
    required String acronym,
    required int priority,
    required List<Order> orders,
  }) : super(
          id: id,
          title: title,
          acronym: acronym,
          priority: priority,
          orders: orders,
        );

  factory QueueModel.empty() => QueueModel(
        id: '',
        title: '',
        acronym: '',
        priority: 0,
        orders: [],
      );

  QueueModel copyWith({
    String? id,
    String? title,
    String? acronym,
    int? priority,
    List<Order>? orders,
  }) {
    return QueueModel(
      id: id ?? this.id,
      title: title ?? this.title,
      acronym: acronym ?? this.acronym,
      priority: priority ?? this.priority,
      orders: orders ?? this.orders,
    );
  }
}
