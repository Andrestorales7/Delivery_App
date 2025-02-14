import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context){
    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text("Su Ubicacion"),
      content: const TextField(
        decoration:  InputDecoration(
          hintText: "Buscar Ubicacion..."
        ),
      ),
      actions: [
        //boton de cancelar
        MaterialButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancelar"),
          ),

        //boton de guardar
        MaterialButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Guardar"),
          )

      ],
    ),
    );
  }

    @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Entregar ahora", style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                //direccion
                Text("Area 3, Manzana S Lote 5",
                style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
                ),
                ),
                  
                //menu desplegable
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }
}