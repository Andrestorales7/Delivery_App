import 'package:example_app/models/food.dart';
import 'package:flutter/material.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    super.key,
    required this.food,
    required this.onTap
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                //detalles de las comidas en texto
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      Text(food.price.toString(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(food.descripcion,
                      style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ],
                  )
                ),
                const SizedBox(width: 15),
                //imagen de la comida
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    fit: BoxFit.cover,
                    food.imagePath, height: 120, width: 120,
                  ),
                ),
              ],
            ),
          ),
        ),
        //linea divisoria
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        )
      ],
    );
  }
}