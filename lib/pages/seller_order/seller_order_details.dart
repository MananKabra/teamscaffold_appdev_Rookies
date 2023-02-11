import 'package:flutter/material.dart';

class SellerOrderDetails extends StatefulWidget {
  const SellerOrderDetails({Key? key}) : super(key: key);

  @override
  State<SellerOrderDetails> createState() => _SellerOrderDetailsState();
}

class _SellerOrderDetailsState extends State<SellerOrderDetails> {

  TextEditingController foodName = TextEditingController();
  TextEditingController foodPrice = TextEditingController();
  TextEditingController nos = TextEditingController();

  String foodType = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: foodName,
                  decoration: InputDecoration(
                    hintText: 'food name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
                TextFormField(
                  controller: foodPrice,
                  decoration: InputDecoration(
                    hintText: 'food price',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
                TextFormField(
                  controller: nos,
                  decoration: InputDecoration(
                    hintText: 'no fo servings',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
                Column(
                  children: [
                    RadioListTile(
                      title: Text("Breakfast"),
                      value: "breakfast",
                      groupValue: foodType,
                      onChanged: (value){
                        setState(() {
                          foodType = value.toString();
                        });
                      },
                    ),

                    RadioListTile(
                      title: Text("Lunch"),
                      value: "lunch",
                      groupValue: foodType,
                      onChanged: (value){
                        setState(() {
                          foodType = value.toString();
                        });
                      },
                    ),

                    RadioListTile(
                      title: Text("Snacks"),
                      value: "snacks",
                      groupValue: foodType,
                      onChanged: (value){
                        setState(() {
                          foodType = value.toString();
                        });
                      },
                    ),

                    RadioListTile(
                      title: Text("Dinner"),
                      value: "dinner",
                      groupValue: foodType,
                      onChanged: (value){
                        setState(() {
                          foodType = value.toString();
                        });
                      },
                    ),

                    RadioListTile(
                      title: Text("Other"),
                      value: "other",
                      groupValue: foodType,
                      onChanged: (value){
                        setState(() {
                          foodType = value.toString();
                        });
                      },
                    ),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


