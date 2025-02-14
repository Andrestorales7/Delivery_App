import 'package:example_app/components/my_button.dart';
import 'package:example_app/components/my_cart_tile.dart';
import 'package:example_app/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:example_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child){
        //cart
        final userCart = restaurant.cart;

        //scaffold UI
        return Scaffold(
          appBar: AppBar(
            title: const Text("Carrito"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              //limpiar carrito
              IconButton(onPressed: () {
                showDialog(context: context, builder: (context) => AlertDialog(
                  title: const Text("Estas seguro de que quieres limpiar el carrito?"),
                  actions: [
                    //boton de cancelar
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child:const Text("Cancelar"),
                    ),

                    //confirmar
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        restaurant.clearCart();
                      },
                      child:const Text("Confirmar"),
                    ),

                  ],
                ),
                );
              },
               icon: const Icon(Icons.delete),
               )
            ],
            ),
            body: Column(
              children: [
                //lista del carrito

                Expanded(
                  child: Column(
                    children: [
                      userCart.isEmpty 
                      ? const Expanded(
                        child: Center(child: Text("El carrito esta vacio..."))) 
                      :Expanded(
                        child: ListView.builder(
                          itemCount: userCart.length,
                          itemBuilder: (context, index) {
                  
                            //get individual cart item
                            final cartItem = userCart[index];
                  
                            //return cart tile UI
                            return MyCartTile(cartItem: cartItem);
                            
                          }
                        ),
                      ),
                    ],
                  ),
                ),
                //boton para pagar
                MyButton(
                  onTap: () => Navigator.push(
                    context, MaterialPageRoute(
                      builder:(context) => const PaymentPage()
                  )),
                  text: 'Ir a pagar'),
                const SizedBox(height: 20),
              ],
            ),
        );

      },
    );
  }
}