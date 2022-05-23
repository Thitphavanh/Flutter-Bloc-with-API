import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_with_api/repository/product_repository.dart';
import 'package:flutter_bloc_with_api/pages/detail_page.dart';
import 'package:flutter_bloc_with_api/pages/list_page.dart';
import 'package:flutter_bloc_with_api/pages/search_page.dart';
import 'package:flutter_bloc_with_api/repository/provider.dart';
import 'bloc/product_bloc.dart';
import 'repository/mock_provider.dart';
import 'repository/product_db_provider copy.dart';

void main() {
  Provider provider;
  if (kDebugMode) {
    provider = MockProvider();
  } else {
    provider = ProductDBProvider();
  }
  runApp(
    BlocProvider(
      create: (context) => ProductBloc(
        ProductRepository(provider),
      ),
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
