import 'package:queue/src/queue/domain/value_objects/order.dart';

import '../constants/queue.dart';

Order getOrderMock() => Order(
      id: 'id',
      position: 1,
      timestamp: DateTime.parse(kTimestampText),
      status: OrderStatus.waiting,
    );
