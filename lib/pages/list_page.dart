// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_with_api/pages/detail_page.dart';
import 'package:http/http.dart' as http;
import '../cocktail_db/cocktail_db.dart';

class ListPageArgs {
  final String searchText;
  ListPageArgs(this.searchText);
}

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  CocktailDb cocktailDb = const CocktailDb();
  bool loaded = false;

  void loadData(String searchText) async {
    loaded = true;
    try {
      // var url = Uri.parse(
      //     'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=${widget.searchText}');
      var url = Uri.https('www.thecocktaildb.com', '/api/json/v1/1/search.php',
          {'s': searchText});
      var result = await http.get(url);
      if (result.statusCode != 200) {
        if (kDebugMode) {
          print('Error');
        }
      }
      setState(() {
        cocktailDb = CocktailDb.fromJson(result.body);
      });

      if (kDebugMode) {
        print(cocktailDb);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ListPageArgs;
    if (!loaded) {
      loadData(args.searchText);
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: cocktailDb.drinks
                ?.map(
                  (e) => ListTile(
                    leading: e.strDrinkThumb != null
                        ? Image.network(e.strDrinkThumb!)
                        : null,
                    title: Text(e.strDrink ?? 'No name'),
                    onTap: () {
                      Navigator.pushNamed(context, '/detail',
                          arguments: DetailPageArgs(e));
                    },
                  ),
                )
                .toList() ??
            [],
      ),
    );
  }
}
