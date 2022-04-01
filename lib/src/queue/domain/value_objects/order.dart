/// Queue ticket object
class Order {
  final int position;
  final DateTime timestamp;
  final OrderStatus status;

  const Order({
    required this.position,
    required this.timestamp,
    required this.status,
  });
}

/// Current ticket status
enum OrderStatus {
  active,
  done,
  canceled,
  waiting,
}
