import 'package:example_app/components/my_current_location.dart';
import 'package:example_app/components/my_description_box.dart';
import 'package:example_app/components/my_drawer.dart';
import 'package:example_app/components/my_food_tile.dart';
import 'package:example_app/components/my_silver_app_bar.dart';
import 'package:example_app/components/my_tab_bar.dart';
import 'package:example_app/models/restaurant.dart';
import 'package:example_app/pages/food_page.dart';
import 'package:flutter/material.dart';
import 'package:example_app/models/food.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> 
with SingleTickerProviderStateMixin {

  //controlador de pestanhas
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //solucionar el retorno de lista de comidas que pertenecen a sus especificas categorias

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu){
    return fullMenu.where((food) => food.category == category).toList();
  }
  //retornar lista de comidas en categorias establecidas
  List<Widget> getFoodInThisCategory(List<Food> fullMenu){
    return FoodCategory.values.map((category){

      //obtener la categoria de comida
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

           
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          //obtener comidas individuales
          final food = categoryMenu[index];

          //return food tile UI 
          return FoodTile(
            food: food, 
            onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => FoodPage(food: food)
                )
              ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled) => [
        MySilverAppBar(
          title: MyTabBar(tabController: _tabController),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                indent: 25, 
                endIndent: 25, 
                color: Theme.of(context).colorScheme.secondary,
                ),

                //switch
                MyCurrentLocation(),

                //descripcion box
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu),
          ),
        ),
      ),
    );
  }
}