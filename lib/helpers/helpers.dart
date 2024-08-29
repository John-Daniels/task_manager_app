int getDaysFromnow(futureDate) {
  var now = DateTime.now();
  // var futureDate = DateTime.now().add(Duration(days: 10));
  var daysUntil = futureDate.difference(now).inDays;
  return daysUntil;
}
