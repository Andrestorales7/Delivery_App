import 'package:example_app/components/my_drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // surface = background
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(children: [
        //app logo
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Icon(
            Icons.lock_open,
            size: 80,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),

        //titulo de lista de inicio
        MyDrawerTile(
          text: "I N I C I O",
           icon: Icons.home,
            onTap: () => Navigator.pop(context),
        ),

        //titulo de lista de configuracion
        MyDrawerTile(
          text: "C O N F I G U R A C I O N E S",
           icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder:(context) => const SettingsPage(),
                ),
              ); 
            },
        ),
        const Spacer(),

        //titulo de lista de cierre de sesion 
         MyDrawerTile(
          text: "C E R R A R  S E S I O N",
           icon: Icons.logout,
            onTap: Supabase.instance.client.auth.signOut,
        ),
        const SizedBox(height: 25),

      ],),
    );
  }
}