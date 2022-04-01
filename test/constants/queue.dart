const kOrderMap = {
  'uid': 'uid',
  'position': 1,
  'timestamp': '2022-04-01 17:10:00',
  'status': 'waiting',
};

const kEmptyQueueMap = {
  'uid': 'uid',
  'title': 'title',
  'acronym': 'acronym',
  'priority': 1,
};

const kQueueMap = {
  ...kEmptyQueueMap,
  'orders': [kOrderMap],
};
