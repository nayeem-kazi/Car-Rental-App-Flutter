
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Home Screen"),
          ),
          body: Column(
            children: <Widget> [
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 200.0,
                  ),
                  items: ['whitedesign.jpg','nayeem pp.jpg', 'design.jpeg'].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.amber
                            ),
                            child: Image.asset("assets/images/"+i),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Container(
                child: CarouselSlider.builder(
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Container(
                        child: Text(itemIndex.toString()
                        ),
                      ),
                  options: CarouselOptions(

                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
