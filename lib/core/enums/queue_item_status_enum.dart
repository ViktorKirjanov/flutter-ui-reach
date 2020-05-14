enum QueueItemStatus { Processing, Completed }

extension ParseToString on QueueItemStatus {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
