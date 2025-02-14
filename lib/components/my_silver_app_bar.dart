import 'package:example_app/pages/cart_page.dart';
import 'package:flutter/material.dart';

class MySilverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySilverAppBar({
    super.key,
    required this.child,
    required this.title,
    });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        //boton de carrito
        IconButton(onPressed: (){
          //ir a la pagina del carrito
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context)=> const CartPage(),
            ),
          );

        }, 
        icon: const Icon(Icons.shopping_cart_outlined),
        )
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text("The Black Dog"),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}