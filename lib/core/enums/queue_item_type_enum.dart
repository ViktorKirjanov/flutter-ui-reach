enum QueueItemType { Message, Campaign }

extension ParseToString on QueueItemType {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
