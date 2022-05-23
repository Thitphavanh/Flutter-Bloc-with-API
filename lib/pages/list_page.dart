// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_with_api/cocktail_db/drink.dart';
import 'package:flutter_bloc_with_api/pages/detail_page.dart';

import '../bloc/product_bloc.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) async {
        if (state is ProductError) {
          if (kDebugMode) {
            print(state.message);
          }
          await _showMyDialog(context, state.message);
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading || state is ProductInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductFinishState) {
            return Scaffold(
              appBar: AppBar(
                actions: [
                  DropDownFilter(drinks: state.drinks),
                ],
                elevation: 0,
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
              ),
              body: ListView(
                children: state.drinks
                    .map(
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
                    .toList(),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context, String message) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class DropDownFilter extends StatefulWidget {
  final List<Drink> drinks;

  const DropDownFilter({Key? key, required this.drinks}) : super(key: key);

  @override
  State<DropDownFilter> createState() => _DropDownFilterState();
}

class _DropDownFilterState extends State<DropDownFilter> {
  late List<String?> categorys = [null];
  String? isSelectedFilter;

  @override
  void initState() {
    super.initState();
    categorys.addAll(
      widget.drinks.map((e) => e.strCategory).toSet().toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String?>(
        value: isSelectedFilter,
        items: categorys
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e ?? 'All'),
              ),
            )
            .toList(),
        onChanged: (selected) {
          BlocProvider.of<ProductBloc>(context).add(FilterEvent(selected));
          setState(() {
            isSelectedFilter = selected;
          });
        });
  }
}
