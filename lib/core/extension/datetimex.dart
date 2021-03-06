extension DateTimeX on DateTime {
  String toHumanReadable() {
    final now = DateTime.now();
    var date = '${this.year}-${this.month}-${this.day}';
    if (now.year == this.year) date = '${this.month}-${this.day}';
    if (now.day == this.day + 0) date = '今天';
    if (now.day == this.day + 1) date = '昨天';
    if (now.day == this.day + 2) date = '前天';
    final minute = this.minute > 9 ? this.minute : '0${this.minute}';
    final time = '${this.hour}:$minute';
    return '$date $time';
  }

  bool isInSameDayAs(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }
}
