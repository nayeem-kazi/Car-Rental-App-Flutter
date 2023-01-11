
import 'package:car_rental_app/home.dart';
import 'package:car_rental_app/item1.dart';
import 'package:car_rental_app/item2.dart';
import 'package:car_rental_app/login.dart';
import 'package:car_rental_app/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CRUD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference _products =
  FirebaseFirestore.instance.collection("products");
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  String? searchItem;
  int _selectedIndex = 0;
  _save([DocumentSnapshot? documentSnapshot]) {
    if (documentSnapshot != null) {
      nameController.text = documentSnapshot['name'];
      priceController.text = documentSnapshot['price'].toString();
      idController.text = documentSnapshot['id'].toString();
      typeController.text = documentSnapshot['type'].toString();
    }
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: idController,
                decoration: InputDecoration(
                  hintText: "Enter product id",
                  label: Text("ID"),
                ),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Enter product name",
                  label: Text("NAME"),
                ),
              ),
              TextField(
                controller: typeController,
                decoration: InputDecoration(
                  hintText: "Enter product type",
                  label: Text("TYPE"),
                ),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  hintText: "Enter price",
                  label: Text("PRICE"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: Text("Save"),
                onPressed: () async {
                  final String name1 = nameController.text.toString();
                  final String id1 = int.parse(idController.text).toString();
                  final String type1 = typeController.text.toString();
                  final String price1 =
                  int.parse(priceController.text).toString();
                  if (price1 != null) {
                    await _products.add({"id": id1, "name": name1, "type": type1, "price": price1});
                    idController.text = '';
                    nameController.text = '';
                    typeController.text = '';
                    priceController.text = '';
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:  Text("Saved"),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  _update([DocumentSnapshot? documentSnapshot]) {
    if (documentSnapshot != null) {
      nameController.text = documentSnapshot['name'];
      priceController.text = documentSnapshot['price'].toString();
      idController.text = documentSnapshot['id'].toString();
      typeController.text = documentSnapshot['type'].toString();

    }
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: idController,
                decoration: InputDecoration(
                  hintText: "Enter product id",
                  label: Text("ID"),
                ),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Enter product name",
                  label: Text("NAME"),
                ),
              ),
              TextField(
                controller: typeController,
                decoration: InputDecoration(
                  hintText: "Enter product type",
                  label: Text("TYPE"),
                ),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  hintText: "Enter price",
                  label: Text("PRICE"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: Text("Update"),
                onPressed: () async {
                  final String name1 = nameController.text.toString();
                  final String id1 = int.parse(idController.text).toString();
                  final String type1 = typeController.text.toString();
                  final String price1 =
                  int.parse(priceController.text).toString();
                  if (price1 != null) {
                    _products
                        .doc(documentSnapshot!.id)
                        .update({"id": id1, "name": name1, "type": type1, "price": price1});
                    idController.text = '';
                    nameController.text = '';
                    typeController.text = '';
                    priceController.text = '';
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:  Text("Updated"),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _delete(String productId) async {
    await _products.doc(productId).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content:  Text("Deleted"),
      ),
    );
  }

  //_products.add({name:"abc",price:100});
  //_products.update({name:"abc",price:100});
  //_products.doc(productId).detete();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
            label: "Search",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          switch(index){
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) => ItemOne(),));
              break;
          }
        },
      ),
      drawer: Drawer(

        child: ListView(

          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ItemOne()));

              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ItemTwo()));

              },
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                // Update the state of the app.
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

              },
            ),
            ListTile(
              title: const Text('Sign Up'),
              onTap: () {
                // Update the state of the app.
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));

              },
            ),
            ListTile(
              title: const Text('Login'),
              onTap: () {
                // Update the state of the app.
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScrean()));

              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                // Update the state of the app.
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ItemTwo()));

              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black,
              ),
              child: TextField(
                controller: nameController,
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
                    onPressed: (){
                      searchItem = nameController.text.toString();
                      setState(() {
                        
                      });
                    },
                    icon: Icon(Icons.arrow_forward, color: Colors.white,),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: StreamBuilder(
              stream: _products.where('name',isEqualTo: searchItem).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                      return Card(
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          leading: Text(documentSnapshot['id'],
                          style: TextStyle(fontSize: 25,
                          color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          title: Text(documentSnapshot['name'],
                            style: TextStyle(fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(documentSnapshot['type'].toString(),
                                style: TextStyle(fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),),
                              Text("BDT " + documentSnapshot['price'].toString(),
                                style: TextStyle(fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ],
                          ),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    _update(documentSnapshot);
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    _delete(documentSnapshot.id);
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _save();
        },
      ),
    );
  }
}



