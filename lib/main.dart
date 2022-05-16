import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_with_api/cocktail_db/cocktail_db.dart';
import 'package:flutter_bloc_with_api/pages/detail_page.dart';
import 'package:flutter_bloc_with_api/pages/list_page.dart';
import 'package:flutter_bloc_with_api/pages/search_page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const SearchPage(),
        '/list': (context) => const ListPage(),
        '/detail': (context) => const DetailPage(),

      },
    ),
  );
}
