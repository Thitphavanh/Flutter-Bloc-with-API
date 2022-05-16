// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading || state is ProductInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductFinishState) {
          return Scaffold(
            appBar: AppBar(
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
    );
  }
}
