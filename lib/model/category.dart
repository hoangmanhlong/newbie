class Category {

  final String name;
  final String iconUrl;
  final int boxColor;

  const Category(
      {required this.name, required this.iconUrl, required this.boxColor});

  static List<Category> getCategories() {
    List<Category> categories = [];

    categories.add(const Category(
      name: 'Salad',
      iconUrl: 'assets/images/plate.svg',
      boxColor: 0xff9DCEFF,
    ));

    categories.add(const Category(
      name: 'Cake',
      iconUrl: 'assets/images/pancakes.svg',
      boxColor: 0xffEEA4CE,
    ));

    categories.add(const Category(
      name: 'Pie',
      iconUrl: 'assets/images/pie.svg',
      boxColor: 0xff9DCEFF,
    ));

    categories.add(const Category(
      name: 'Smoothies',
      iconUrl: 'assets/images/orange-snacks.svg',
      boxColor: 0xffEEA4CE,
    ));

    return categories;
  }
}
