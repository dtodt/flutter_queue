const kTimestampText = '2022-04-01T17:10:00.000';

const kOrderMap = {
  'id': 'id',
  'position': 1,
  'timestamp': kTimestampText,
  'status': 'waiting',
};

const kEmptyQueueMap = {
  'id': 'id',
  'title': 'title',
  'acronym': 'acronym',
  'priority': 1,
};

const kQueueMap = {
  ...kEmptyQueueMap,
  'orders': [kOrderMap],
};
