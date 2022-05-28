import 'package:flutter/material.dart';

class HomeSearchPage extends StatelessWidget {
  const HomeSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Page'), centerTitle: true, actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ]),
    );
  }
}
