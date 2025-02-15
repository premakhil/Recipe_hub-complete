// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/screens/home/cook.dart';
import 'package:untitled/screens/home/cusines.dart';
import 'package:untitled/screens/home/inventory/inventoryMain.dart';
import 'package:untitled/screens/home/side_menu.dart';
import 'package:untitled/services/database.dart';
import 'package:untitled/shared/Constants.dart';
import 'package:untitled/shared/classes.dart';
import 'package:untitled/shared/loading.dart';
import 'package:untitled/shared/search.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final User? user = _auth.currentUser;

class home extends StatefulWidget {
  @override
  State<home> createState() => new _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: sideMenu(),
      appBar: AppBar(
        // title: Text('Recipe Hub'),

        actions: [
          InkWell(
              onTap: () => {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Inventory()))
                  },
              child: Container(
                  child: Lottie.network(
                      'https://assets1.lottiefiles.com/packages/lf20_2mny7oza.json')))
          // IconButton(
          //     onPressed: () {

          //       Navigator.push(context,CupertinoPageRoute(builder:(context)=>Inventory() ));
          //     },
          //     icon: Icon(
          //       Icons.add_shopping_cart,
          //       color: Colors.black,
          //     ))
        ],

        backgroundColor: appYellow,
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              searchBar(),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Color(0xffEAE8E8),
              //   ),
              //   margin: EdgeInsets.all(10),
              //   height: 48,
              //   width: 390,
              //   child: TextField(
              //     decoration: InputDecoration(
              //         suffixIcon: Icon(Icons.search),
              //         enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(color: Color(0xffEAE8E8)),
              //         ),
              //         hintText: 'Search',
              //         hintStyle: TextStyle(
              //           fontSize: 15.0,
              //           color: Color(0xff707070),
              //         ),
              //         border: InputBorder.none),
              //   ),
              // ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            //  recipes R=await DatabaseService(uid:user!.uid).getRecipe(RecipeId:RecipeId) ;

                            // Navigator.push(context,MaterialPageRoute(builder: (context) =>  cookPage(currentRecipe:R)));

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CuisinesPage(Cuisine: "Indian")));
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: new DecorationImage(
                                    image: AssetImage('assets/indian.jpg'),
                                    // Text('indian'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                            child: Text("Indian",
                                // style: GoogleFonts.dosis(fontSize: 20),
                                // style: TextStyle(fontFamily: ''),
                                style: TextStyle(
                                  // fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ))),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        // DatabaseService(uid:user!.uid).getRecipeWithCuisine(Cuisine: "American");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CuisinesPage(Cuisine: "American")));
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: new DecorationImage(
                                    image: AssetImage('assets/american.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(height: 5),
                          Center(
                              child: Text("American",
                                  style: TextStyle(
                                    // fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ))),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CuisinesPage(Cuisine: "Chinese")));
                            // Navigator.push(context,MaterialPageRoute(builder:(context)=>CuisinesPage() ));
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: new DecorationImage(
                                    image: AssetImage('assets/chinese.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        SizedBox(height: 5),
                        Center(
                            child: Text("Chinese",
                                style: TextStyle(
                                  // fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ))),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CuisinesPage(Cuisine: "Italian")));
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: new DecorationImage(
                                    image: AssetImage('assets/italian.jpeg'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        SizedBox(height: 5),
                        Center(
                            child: Text("Italian",
                                style: TextStyle(
                                  // fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                )
                                // style: TextStyle(fontFamily: 'Dosis', fontSize: 20),
                                )),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CuisinesPage(Cuisine: "Japanese"))),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: new DecorationImage(
                                    image: AssetImage('assets/japanese.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text("Japanese",
                              style: TextStyle(
                                // fontSize: 13,
                                fontWeight: FontWeight.w500,
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 375.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                        ),
                        items: [
                          Container(
                            margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage('assets/chef.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage('assets/recipes.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage('assets/buddhabowl.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage('assets/dalgona.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage('assets/brown.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 15,
                ),
                width: double.infinity,
                height: ht * 0.21,
                // margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  color: appYellow,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, ht * 0.01),
                      child: Center(
                          child: Text("Recently Cooked",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 22))),
                    ),
                    FutureBuilder(
                        future: DatabaseService(uid: user!.uid).getHistory(),
                        builder: (context, historySnap) {
                          if (historySnap.data == null)
                            return Expanded(child: LoadHistory());
                          var result = historySnap.data as List?;
                          List<recipeModel>? historyList =
                              result![0] as List<recipeModel>?;
                          int length = min(2, historyList!.length);
                          // print(length);
                          return Expanded(
                              child: Align(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                              width: wt * 0.95,
                              child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.6,
                                  ),
                                  itemCount: length,
                                  itemBuilder: (BuildContext context, int i) {
                                    return InkWell(
                                      onTap: () async {
                                        recipeModel R = await DatabaseService(
                                                uid: user!.uid)
                                            .getRecipe(
                                                RecipeId:
                                                    historyList[i].RecipeId);
                                        // R.isLike=await DatabaseService(uid:user!.uid).isFavorite(RecipeId:Recipes?[i].id as String);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => cookPage(
                                                    currentRecipe: R)));
                                      },
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 0.1 * ht,
                                              width: wt * 0.25,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        historyList[i].img),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                historyList[i].title,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ]),
                                    );
                                  }),
                            ),
                          ));
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
