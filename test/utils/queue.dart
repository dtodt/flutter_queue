import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/value_objects/order.dart';

import '../constants/queue.dart';

Order getOrderMock() => Order(
      id: 'id',
      position: 1,
      timestamp: DateTime.parse(kTimestampText),
      status: OrderStatus.waiting,
    );

QueueEntity getQueueMock() => QueueEntity(
      id: 'id',
      title: 'title',
      acronym: 'acronym',
      priority: 1,
      orders: [
        getOrderMock(),
      ],
    );

QueueEntity getEmptyQueueMock() => QueueEntity(
      id: 'id',
      title: 'title',
      acronym: 'acronym',
      priority: 1,
      orders: [],
    );
