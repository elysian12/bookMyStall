class CityModel {
  final String img;
  final String label;
  bool isSelected;

  CityModel({
    required this.img,
    required this.label,
    this.isSelected = false,
  });
}
