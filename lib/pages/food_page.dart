import 'package:example_app/components/my_button.dart';
import 'package:example_app/models/food.dart';
import 'package:example_app/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({
    super.key,
    required this.food,
    }){
      //inizializar addons para que sean falsos
      for (Addon addon in food.availableAddons){
        selectedAddons[addon] = false;
      }

    }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  //metodo de agregar al carrito
  void addToCart(Food food, Map<Addon, bool> selectedAddons){

    //cerrar la pagina para volver al menu
    Navigator.pop(context);

    //format the selected addons

    List<Addon> currentlySelectedAddons = [];
    for(Addon addon in widget.food.availableAddons){
      if(widget.selectedAddons[addon]==true){
        currentlySelectedAddons.add(addon);
      }
    }

    //
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);

  }

  @override
  Widget build(BuildContext context) {
    return Stack( children: [
      //scafold UI

      Scaffold( 
      body:  SingleChildScrollView(
        child: Column(
          
          children: [
        
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Imagen de la comida
                  Image.asset(widget.food.imagePath),
              
                  //food name
                 Text(widget.food.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                   ),
                  ),
        
                  //Precio de la comida
                  Text(
                  // ignore: unnecessary_string_escapes, prefer_interpolation_to_compose_strings
                  'Gs' + widget.food.price.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height:10),
              
                  //descripcion de la comida
                  Text(widget.food.descripcion),
                  const SizedBox(height: 10),
        
                  Divider(color: Theme.of(context).colorScheme.secondary),
        
                  const SizedBox(height: 10),
        
                  // addons
                  Text("Agrega-dos",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16,
                     fontWeight: FontWeight.bold,
                    ),
                  ),
        
                  const SizedBox(height:10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: widget.food.availableAddons.length,
                      itemBuilder: (context, index){
                        //obtener addons individuales
                        Addon addon = widget.food.availableAddons[index];
                                
                        //return check box UI
                        return CheckboxListTile(
                          title: Text(addon.name),
                          subtitle: Text('Gs ${addon.price}',style: TextStyle(color: Theme.of(context).colorScheme.primary), ),
                          value: widget.selectedAddons[addon], 
                          onChanged: (bool? value){
                            setState(() {
                              widget.selectedAddons[addon] = value!;
                            });
                          }
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
        
            //boton de agregar al carrito
            MyButton(
              onTap: () => addToCart(widget.food, widget.selectedAddons), 
              text: "Agregar al Carrito",
            ),

            const SizedBox(height: 25),

        
          ],
        ),
      ),
    ),

      //Back button
      SafeArea(
        child: Opacity(
          opacity: 0.7,
          child: Container(
          margin: const EdgeInsets.only(left: 25),
          decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,
          shape: BoxShape.circle,
          ),
          child: IconButton( 
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      )

    ],);
  }
}