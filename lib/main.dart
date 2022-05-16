import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_with_api/pages/detail_page.dart';
import 'package:flutter_bloc_with_api/pages/list_page.dart';
import 'package:flutter_bloc_with_api/pages/search_page.dart';
import 'bloc/product_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ProductBloc(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const SearchPage(),
          '/list': (context) => const ListPage(),
          '/detail': (context) => const DetailPage(),
        },
      ),
    ),
  );
}
