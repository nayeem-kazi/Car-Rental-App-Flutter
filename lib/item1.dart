import 'package:flutter/material.dart';

class ItemOne extends StatelessWidget {
  const ItemOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
       body: Container(
        child: Column(
          children: <Widget> [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black,
                ),
                child: TextField(

                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Here",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  prefixIcon: Icon(Icons.search, color: Colors.white,),
                    suffixIcon: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.arrow_forward, color: Colors.white,),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
