
import 'package:collection/collection.dart';
import 'package:example_app/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier{
  //list of food menu
  final List<Food> _menu = [
    //burgers
    Food(
     name: "Cheeseburger Clasico",
     descripcion: "Hamburguesa clásica con jugosa carne a la parrilla, queso derretido, lechuga fresca, tomate y una deliciosa salsa especial, todo en un esponjoso pan recién horneado.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/burgers/cheese_burger.jpeg",
     price: 25000,
     category: FoodCategory.burgers,
     availableAddons: [
      Addon(name: "Extra queso", price: 4500),
      Addon(name: "Bacon", price: 4500),
      Addon(name: "Aguacate", price: 4500)
     ]
    ),

    Food(
     name: "Hamburguesa Vegana",
     descripcion: "Hamburguesa vegana con una sabrosa mezcla de vegetales, acompañada de lechuga, tomate y una salsa especial en pan artesanal.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/burgers/vegie_burger.jpeg",
     price: 35000,
     category: FoodCategory.burgers,
     availableAddons: [
      Addon(name: "Queso Vegano", price: 4500),
      Addon(name: "Champiñones", price: 4500),
      Addon(name: "Aguacate", price: 4500)
     ]
    ),

    Food(
     name: "BBQ Bacon",
     descripcion: "Hamburguesa BBQ Bacon con jugosa carne a la parrilla, crujiente tocino, queso derretido y salsa barbacoa, servida en un pan suave y esponjoso.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/burgers/bacon_burger.jpeg",
     price: 32000,
     category: FoodCategory.burgers,
     availableAddons: [
      Addon(name: "Queso Cheddar", price: 4500),
      Addon(name: "Extra Bacon", price: 4500),
      Addon(name: "Salsa Especial", price: 4500)
     ]
    ),

    Food(
     name: "Aloha Burger",
     descripcion: "Hamburguesa Aloha con jugosa carne a la parrilla, piña caramelizada, queso derretido, lechuga fresca y una deliciosa salsa especial, todo en un pan suave y esponjoso.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/burgers/aloha_burger.jpeg",
     price: 28000,
     category: FoodCategory.burgers,
     availableAddons: [
      Addon(name: "Piña Extra", price: 4500),
      Addon(name: "Extra Bacon", price: 4500),
      Addon(name: "Glaseado teriyaki", price: 4500)
     ]
    ),

    Food(
     name: "Hamburgesa Azul",
     descripcion:"Hamburguesa Luna Azul con jugosa carne a la parrilla, queso azul cremoso, cebolla caramelizada y un toque de blueberry que realza su sabor, todo en un pan artesanal suave.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/burgers/blue_burger.jpeg",
     price: 34000,
     category: FoodCategory.burgers,
     availableAddons: [
      Addon(name: "Queso Azul", price: 4500),
      Addon(name: "Extra BlueBerry", price: 4500),
      Addon(name: "Cebolla Caramelizada", price: 4500)
     ]
    ),

    //salads
    Food(
     name: "Ensalada Caesar",
     descripcion:"Ensalada César clásica con crujiente lechuga romana, aderezo cremoso, crutones dorados y queso parmesano rallado, perfecta para disfrutar en cualquier momento.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/salads/caesar_salad.png",
     price: 34000,
     category: FoodCategory.salads,
     availableAddons: [
      Addon(name: "Crutones Dorados", price: 4500),
      Addon(name: "Aderezo cremoso", price: 4500),
      Addon(name: "Queso Parmesano", price: 4500)
     ]
    ),

    Food(
     name: "Ensalada Griega",
     descripcion:"Fresca y deliciosa combinación de tomate, pepino, cebolla morada, aceitunas negras y queso feta, aderezada con aceite de oliva y orégano.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/salads/greek_salad.png",
     price: 34000,
     category: FoodCategory.salads,
     availableAddons: [
      Addon(name: "Aceitunas Negras", price: 4500),
      Addon(name: "Tomate Cherry", price: 4500),
      Addon(name: "Queso Feta", price: 4500)
     ]
    ),

    Food(
     name: "Ensalada de Quinua",
     descripcion:"Nutritiva mezcla de quinoa, vegetales frescos, aguacate y un toque de limón, perfecta para una opción ligera y saludable.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/salads/quinoa_salad.png",
     price: 34000,
     category: FoodCategory.salads,
     availableAddons: [
      Addon(name: "Aguacate Extra", price: 4500),
      Addon(name: "Aceitunas", price: 4500),
      Addon(name: "Tomate Cherry", price: 4500)
     ]
    ),

    Food(
     name: "Ensalada de Sesamo",
     descripcion:"Crujiente mezcla de lechugas frescas, pollo a la plancha, zanahoria rallada y semillas de sésamo, acompañada de un aderezo asiático especial.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/salads/sesame_salad.png",
     price: 34000,
     category: FoodCategory.salads,
     availableAddons: [
      Addon(name: "Cebolla", price: 4500),
      Addon(name: "Choclo", price: 4500),
      Addon(name: "Zanahoria", price: 4500)
     ]
    ),

    Food(
     name: "Ensalada Suroeste",
     descripcion:"Sabrosa combinación de lechuga, pollo sazonado, maíz, frijoles negros, tomate y aguacate, con un aderezo cremoso de chipotle.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/salads/southwest_salad.png",
     price: 34.000,
     category: FoodCategory.salads,
     availableAddons: [
      Addon(name: "Frijoles", price: 4500),
      Addon(name: "Aderezo Cremoso", price: 4500),
      Addon(name: "Aguacate", price: 4500)
     ]
    ),

    //sides
    Food(
     name: "Pan de Ajo",
     descripcion:"Deliciosas rebanadas de pan crujiente, untadas con mantequilla de ajo y hierbas, perfectas para acompañar cualquier platillo.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/sides/garlic_bread.png",
     price: 22000,
     category: FoodCategory.sides,
     availableAddons: [
      Addon(name: "Salsa de Ajo", price: 3500),
      Addon(name: "Salsa Picante", price: 4500),
      Addon(name: "Salsa Ranchera", price: 7500)
     ]
    ),

    Food(
     name: "Papas Especiales",
     descripcion:"Papas fritas cubiertas con queso derretido, bacon crujiente, cebollas y salsa, creando una combinación irresistible de sabores.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/sides/loadedfries.png",
     price: 25000,
     category: FoodCategory.sides,
     availableAddons: [
      Addon(name: "Queso Cheddar", price: 5500),
      Addon(name: "Salsa de Ajo", price: 4500),
      Addon(name: "Bacon", price: 7500)
     ]
    ),

    Food(
     name: "Macarrones con Queso",
     descripcion:"Cremoso y suave macarrones con queso, una guarnición reconfortante que aporta un toque extra de sabor y textura.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/sides/mac_side.png",
     price: 27000,
     category: FoodCategory.sides,
     availableAddons: [
      Addon(name: "Queso Parmesano", price: 5500),
      Addon(name: "Queso Cheddar", price: 4500),
      Addon(name: "Mantequilla", price: 7500)
     ]
    ),

    Food(
     name: "Anillos de Cebolla",
     descripcion:"Cebollas empanadas y fritas hasta quedar doradas y crujientes, perfectas para sumergir en tu salsa favorita.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/sides/onion_rings.png",
     price: 27000,
     category: FoodCategory.sides,
     availableAddons: [
      Addon(name: "Salsa de ajo", price: 5500),
      Addon(name: "Queso Cheddar", price: 4500),
      Addon(name: "Salsa Ranchera", price: 7500)
     ]
    ),

    Food(
     name: "Batatas Dulces",
     descripcion:"Rodajas o trozos de batata frita o al horno, con un toque natural dulce que equilibra perfectamente con platos salados.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/sides/sweet_potato.png",
     price: 27000,
     category: FoodCategory.sides,
     availableAddons: [
      Addon(name: "Salsa Picante", price: 5500),
      Addon(name: "Salsa Especial", price: 4500),
      Addon(name: "Salsa Ranchera", price: 5500)
     ]
    ),
    //desserts

    Food(
     name: "Floresta Negra",
     descripcion:"Un delicioso pastel de capas suaves de bizcocho de chocolate, relleno con crema batida, cerezas frescas y un toque de licor, creando una combinación de sabores irresistibles.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/desserts/black_forest.png",
     price: 24000,
     category: FoodCategory.desserts,
     availableAddons: [
      Addon(name: "Virutas de chocolate", price: 5500),
      Addon(name: "Cerezas en almibar", price: 4500),
      Addon(name: "Nuez picada", price: 5500)
     ]
    ),

    Food(
     name: "Helado con Brownie",
     descripcion:"Cremoso helado servido junto a trozos de suave brownie de chocolate, una mezcla perfecta de frío y caliente que hará las delicias de cualquier amante del chocolate.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/desserts/brownie_ice.png",
     price: 24000,
     category: FoodCategory.desserts,
     availableAddons: [
      Addon(name: "Chips de chocolate", price: 5500),
      Addon(name: "Cobertura de Caramelo", price: 4500),
      Addon(name: "Frambuesas frescas", price: 5500)
     ]
    ),

    Food(
     name: "Pastel de Cafe",
     descripcion:"Un pastel esponjoso con un toque de café, ideal para los que disfrutan de la combinación entre lo dulce y el sabor amargo del café, acompañado de una capa suave de crema.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/desserts/cafe_cake.png",
     price: 24000,
     category: FoodCategory.desserts,
     availableAddons: [
      Addon(name: "Crema batida", price: 5500),
      Addon(name: "Chocolate rallado", price: 4500),
      Addon(name: "Almendras caramelizadas", price: 5500)
     ]
    ),

    Food(
     name: "Ferrero Cake",
     descripcion:"Pastel indulgente con capas de chocolate, avellanas y crema, inspirado en el famoso bombón Ferrero Rocher, para un sabor delicioso y sofisticado.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/desserts/ferrero_cake.png",
     price: 24000,
     category: FoodCategory.desserts,
     availableAddons: [
      Addon(name: "Avellanas tostadas", price: 5500),
      Addon(name: "Chocolate derretido", price: 4500),
      Addon(name: "Chips de chocolate", price: 5500)
     ]
    ),

    Food(
     name: "Volcan de Chocolate",
     descripcion:"Un pequeño pastel de chocolate que, al cortarlo, revela un centro derretido de chocolate caliente, brindando una explosión de sabor en cada bocado.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/desserts/volcan_choc.png",
     price: 24000,
     category: FoodCategory.desserts,
     availableAddons: [
      Addon(name: "Helado de vainilla", price: 5500),
      Addon(name: "Cobertura de frambuesa", price: 4500),
      Addon(name: "Frutos rojos", price: 5500)
     ]
    ),
    
    //drinks
    Food(
     name: "Caipiriña",
     descripcion:"Cóctel brasileño a base de cachaça, azúcar y lima machacada, una bebida vibrante y dulce.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/drinks/caipirinha.png",
     price: 35000,
     category: FoodCategory.drinks,
     availableAddons: [
      Addon(name: "Frutilla", price: 2500),
      Addon(name: "Maracuya", price: 2500),
      Addon(name: "Menta Fresca", price: 2500)
     ]
    ),

    Food(
     name: "Mojito",
     descripcion:"Cóctel refrescante con ron blanco, menta, azúcar, jugo de lima y agua con gas, perfecto para una experiencia refrescante y ligeramente alcohólica.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/drinks/mojito.png",
     price: 35000,
     category: FoodCategory.drinks,
     availableAddons: [
      Addon(name: "Rodajas de lima", price: 3500),
      Addon(name: "Menta fresca", price: 2500),
      Addon(name: "Jarabe de fresa", price: 4500)
     ]
    ),

    Food(
     name: "Té Helado",
     descripcion:"Té helado, generalmente preparado con té negro o verde, endulzado o no, servido frío con hielo, una opción ligera y refrescante.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/drinks/ice_tea.png",
     price: 25000,
     category: FoodCategory.drinks,
     availableAddons: [
      Addon(name: "Rodajas de Limon", price: 2500),
      Addon(name: "Hoja de menta", price: 2500),
      Addon(name: "Frutos rojos", price: 2500)
     ]
    ),

    Food(
     name: "Smoothie",
     descripcion:"Bebida espesa y cremosa hecha con frutas frescas o congeladas, jugos y a veces yogur o leche, perfecta para un snack saludable.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/drinks/smoothie.png",
     price: 25000,
     category: FoodCategory.drinks,
     availableAddons: [
      Addon(name: "Granola", price: 3500),
      Addon(name: "Semillas de chia", price: 2500),
      Addon(name: "Frutas frescas", price: 4500)
     ]
    ),

    Food(
     name: "Limonada",
     descripcion:"Bebida refrescante hecha con jugo de limón, agua y azúcar, ideal para disfrutar en un día caluroso.",
     imagePath: "/home/andres/flutter-workspace/example_app/assets/images/drinks/lemonade.png",
     price: 15000,
     category: FoodCategory.drinks,
     availableAddons: [
      Addon(name: "Rodajas de limon", price: 2500),
      Addon(name: "Menta fresca", price: 2500),
      Addon(name: "Caramelo", price: 3500)
     ]
    ),
  ];
  //user cart
  final List<CartItem> _cart = [];
  //direccion del delivery para editar manualmente
  String _deliveryAddress = 'Area 3 Manzana S';

  /*

  G E T T E R S

  */ 

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAdress => _deliveryAddress;

  /*

  O P E R A T I O N S

  */
  

  //agregar al carrito
  void addToCart(Food food, List<Addon> selectedAddons){
    //ver si ya hay alguna comida en el carrito con la misma comida y addons seleccionados
    CartItem? cartItem = _cart.firstWhereOrNull((item){
      //ver si los elementos de comida son iguales
      bool isSameFood = item.food == food;

      //ver si la lista de addons seleccionados son iguales
      bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;

    });
    //si el item ya existe en el carrito, aumentar su cantidad
    if (cartItem != null){
      cartItem.quantity++;

    }
    //si no es asi, agregaremos otro item al carrito
    else{
      _cart.add(CartItem(
        food: food, selectedAddons: 
        selectedAddons)
      );
    }
    notifyListeners();
  }

  //remover del carrito
  void removeFromCart(CartItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);
    if(cartIndex != -1){
      if (_cart[cartIndex].quantity > 1){
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //suma total del carrito
  double getTotalPrice(){
    double total = 0.0;
    for (CartItem cartItem in _cart){
      double itemTotal = cartItem.food.price;

      for(Addon addon in cartItem.selectedAddons){
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //numero total de itenes en el carrito
  int getTotalItemCount(){
    int totalItemCount = 0;

    for(CartItem cartItem in _cart){
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //limpiar carrito
  void clearCart(){
    _cart.clear();
    notifyListeners();
  }
  //actualizar la direccion del delivery
  void updateDeliveryAddress(String newAddress){
    _deliveryAddress = newAddress;
    notifyListeners();
  }
  
  /*

  H E L P E R S

  */

  //generar recibo
  String displayCartReceipt(){
    final receipt = StringBuffer();
    receipt.writeln("Recibo de compra.");
    receipt.writeln();

    //format the date to include up to seconds only
    String formattedDate = 
    DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");

    for(final cartItem in _cart){
      receipt.writeln("${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty){
        receipt.writeln("    Agrega-dos: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total de itenes: ${getTotalItemCount()}");
    receipt.writeln("Precio total: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();

  }

  //format double value a dinero
  String _formatPrice(double price){
    return "Gs ${price.toStringAsFixed(2)}";
  }

  //format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons.map((addon) => "${addon.name} (${_formatPrice(addon.price)})").join(", ");
  }
  
}