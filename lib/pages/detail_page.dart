import 'package:flutter/material.dart';
import 'package:flutter_bloc_with_api/cocktail_db/drink.dart';

class DetailPageArgs {
  final Drink drink;
  DetailPageArgs(this.drink);
}

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailPageArgs;
    final drink = args.drink;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Text(drink.strDrink ?? 'No name'),
          Image.network(drink.strDrinkThumb ??
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5VOIJTKhQNgBLepC2ZrFqrEJ4s8fKh0FySbaKu-kQk9IHaRPOo8h6nQ6oglSQX4GxciM&usqp=CAU'),
        ],
      ),
    );
  }
}
