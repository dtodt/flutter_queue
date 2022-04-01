import 'package:queue/src/queue/domain/value_objects/order.dart';

/// The queue entity.
class QueueEntity {
  final String id;
  final String title;
  final String acronym;
  final int priority;
  final List<Order> orders;

  const QueueEntity({
    required this.id,
    required this.title,
    required this.acronym,
    required this.priority,
    required this.orders,
  });
}
