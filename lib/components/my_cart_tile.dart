import 'package:example_app/components/my_quantity_selector.dart';
import 'package:example_app/models/cart_item.dart';
import 'package:example_app/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //imagen de la comida
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      fit: BoxFit.cover,
                     cartItem.food.imagePath, 
                      height: 100,
                      width: 100,
                  ),
                ),
              
                const SizedBox(width: 20),
                
                //nombre y precio
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //nombre de la comida
                    Text(cartItem.food.name),
              
                    //precio de la comida
                    Text('Gs ${cartItem.food.price}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary
                    ),
                    ),
              
                  ],
                ),

                const Spacer(),
              
                //aumentar o disminuir cantidad
                QuantitySelector(
                  quantity: cartItem.quantity, 
                  food: cartItem.food, 
                  onDecrement: () {
                    restaurant.removeFromCart(cartItem);
                  }, 
                  onIncrement: () {
                    restaurant.addToCart(cartItem.food, cartItem.selectedAddons);
                  },
                )
              ],
                        ),
            ),
          //addons
          SizedBox(
            height: cartItem.selectedAddons.isEmpty ? 0: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
              children: cartItem.selectedAddons.map(
                (addon) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FilterChip(label: Row(
                    children: [
                      //addon name
                      Text(addon.name),
                  
                      //addon price
                      Text(' + (${addon.price}) Gs'
                      ),
                    ],
                  ),
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary
                    )
                  ),
                  onSelected: (value){},
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 12,
                  ),
                  ),
                ),
                )
                .toList(),
            ),
          )

        ],
      ),
    ),);
  }
}