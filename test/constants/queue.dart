const kIdText = 'id';
const kTimestampText = '2022-04-01T17:10:00.000';

const kOrderMap = {
  'id': kIdText,
  'position': 1,
  'timestamp': kTimestampText,
  'status': 'waiting',
};

const kEmptyQueueMap = {
  'id': kIdText,
  'title': 'title',
  'acronym': 'acronym',
  'priority': 1,
};

const kQueueMap = {
  ...kEmptyQueueMap,
  'orders': [kOrderMap],
};
