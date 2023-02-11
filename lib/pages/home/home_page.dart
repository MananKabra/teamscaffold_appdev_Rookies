import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodonline/pages/model/uder_model.dart';

import '../login/login_page_buyer.dart';

//late UserModel userModel;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  // Future getCurrentUserDataFunction() async {
  //   await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get().then((DocumentSnapshot documentSnapshot) {
  //         if(documentSnapshot.exists){
  //           userModel = UserModel.fromDocument(documentSnapshot);
  //         }
  //         else{
  //           print("Document not in database");
  //         }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.purple
                ),
                accountName: Text("NAME"),
                accountEmail :Text("emailaddress@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.pink,
                ),
              ),
              DrawerItems(
                icon: Icons.person,
                title: Text("Profile"),
              ),
              DrawerItems(
                icon: Icons.add_shopping_cart,
                title: Text("Cart"),
              ),
              DrawerItems(
                icon: Icons.shopping_basket_sharp,
                title: Text("My Order"),
              ),
              DrawerItems(
                icon: Icons.exit_to_app,
                title: Text("Log Out"),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: (){
                  FirebaseAuth.instance.signOut().then((value) => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => LoginPageBuyer()
                      )
                  )
                  );
                },
                icon: Icon(Icons.exit_to_app)
            )
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Material(
                elevation: 7,
                shadowColor: Colors.grey[300],
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none
                      )
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Text('Categories',style: TextStyle(fontSize: 20),),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Categories(),
                  Categories(),
                  Categories()
                ],
              ),
            ),
            ListTile(
              leading: Text('Products',style: TextStyle(fontSize: 20),),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SingleProduct(price: 43, name: 'pizza'),
                  SingleProduct(price: 43, name: 'pizza'),
                  SingleProduct(price: 43, name: 'pizza')
                ],
              ),
            ),
            ListTile(
              leading: Text('Best Sells',style: TextStyle(fontSize: 20),),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SingleProduct(price: 43, name: 'pizza'),
                  SingleProduct(price: 43, name: 'pizza'),
                  SingleProduct(price: 43, name: 'pizza')
                ],
              ),
            ),
          ],
        )
    );
  }
}



class SingleProduct extends StatelessWidget {
  SingleProduct({required this.price, required this.name});

  final int price;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      height: 200,
      width: 150,
      color: Colors.red,
      child: Column(
        children: [
          Image(image: NetworkImage('https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F44%2F2022%2F11%2F17%2Farticle_291139_the-top-10-healthiest-foods-for-kids_-02.jpg&q=60')),
          Text('\$$price'),
          Text(name)
        ],
      ),
    );
  }
}



class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      height: 100,
      width: 170,
      color: Colors.blue,
    );
  }
}


class DrawerItems extends StatelessWidget {
  DrawerItems({required this.title, required this.icon});

  final Text title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon
      ),
      title: title,
    );
  }
}
