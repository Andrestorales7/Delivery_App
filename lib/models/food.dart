//clase comida
class Food {

  final String name;
  final String descripcion;
  final String imagePath;
  final double price;
  final FoodCategory category;
  List<Addon> availableAddons;

  Food ({
    required this.name,
    required this.descripcion,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });

}

//categorias de comidas

enum FoodCategory {
  burgers,
  salads,
  sides,
  desserts,
  drinks,
}

// complemento de comidas

class Addon {
  String name;
  double price;

  Addon({required this.name, required this.price});
}