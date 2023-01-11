import 'package:flutter/material.dart';

class ItemTwo extends StatelessWidget {
  const ItemTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Two"),
      ),
       body: Container(
        child: Center(
          child: Text(
            "Item Two"
          ),
        ),
      ),
    );
  }
}
