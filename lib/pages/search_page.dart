import 'package:flutter/material.dart';
import 'package:flutter_bloc_with_api/pages/list_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: textController),
          TextButton(
            child: const Text('Search'),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/list',
                arguments: ListPageArgs(textController.text),
              );
            },
          ),
        ],
      ),
    );
  }
}
