import 'package:example_app/components/my_receipt.dart';
import 'package:example_app/models/restaurant.dart';
import 'package:example_app/services/database/supabase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  final SupabaseService db = SupabaseService();


  @override
  void initState() {
    super.initState();

    //si vamos a esta pagina, guardar el registro
    String receipt = context.read<Restaurant>().displayCartReceipt();
     db.saveOrderToDatabase(receipt);
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Delivery en progreso..."),
      backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: const Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }

  //custom botton nav bar - message / call delivery driver
  Widget _buildBottomNavBar(BuildContext context){
    return Container(
      height: 100,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      )
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          //profile pic of driver
          Container(decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface,
            shape: BoxShape.circle,
            ),
            child: IconButton(onPressed: () {}, 
            icon: Icon(Icons.person)),
          ),
          const SizedBox(width: 10),
          //detalles del conductor
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Andres Torales", 
              style: TextStyle(fontWeight: FontWeight.bold, 
              fontSize: 18,
              color: Theme.of(context).colorScheme.inversePrimary),
              ),
              Text("Conductor", style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),)
            ],
          ),

          const Spacer(),
          
          Row(
            children: [
              //boton de mensaje
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {}, 
                  icon: Icon(Icons.message),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(width: 10),

              //boton de llamada
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {}, 
                  icon: Icon(Icons.call),
                  color: Colors.green,
                ),
              ),


            ],
          )

          

        ],
      ),
    );
  }
}