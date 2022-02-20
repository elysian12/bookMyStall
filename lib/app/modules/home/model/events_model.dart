class Events {
  final String month;
  final String weekDay;
  final String title;
  final int date;
  final String address;
  bool isFavoutite;
  final String stock;
  final int price;
  final bool newlyAdded;

  Events({
    required this.month,
    required this.weekDay,
    required this.title,
    required this.date,
    required this.address,
    this.isFavoutite = false,
    required this.stock,
    required this.price,
    this.newlyAdded = false,
  });
}
