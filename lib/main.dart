import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var product = [
    {"productNumber": 5, "dropLocation": 3, "weight": 8},
    {"productNumber": 6, "dropLocation": 4, "weight": 9},
    {"productNumber": 1, "dropLocation": 2, "weight": 10},
    {"productNumber": 3, "dropLocation": 2, "weight": 2},
    {"productNumber": 2, "dropLocation": 1, "weight": 10},
    {"productNumber": 4, "dropLocation": 1, "weight": 15},
  ];

  Map<dynamic, dynamic> getProdNumber() {
    product
        .sort((x, y) => x["weight"]!.toInt().compareTo(y["weight"]!.toInt()));
    var prod = Map();
    for (int i = 0; i < product.length; i++) {
      prod[product[i]["dropLocation"]] = [];
    }
    for (int i = 0; i < product.length; i++) {
      List p = prod[product[i]["dropLocation"]];
      p.add(product[i]);
      prod[product[i]["dropLocation"]] = p;
    }

    return prod;
  }

  int getContainer() {
    int count = 0;
    for (int i = 0; i < product.length; i++) {
      if (count <= product[i]["dropLocation"]!.toInt()) {
        count = product[i]["dropLocation"]!.toInt();
      }
    }
    return count;
  }

  @override
  void initState() {
    super.initState();
    print(getContainer());
    print("this is ${getProdNumber()}");
    print("object");
  }

  bool _ispressed = false;
  bool _isElevated = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(144, 150, 236, 200),
                    spreadRadius: 4,
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: Color.fromARGB(144, 150, 236, 200),
                    spreadRadius: -4,
                    blurRadius: 5,
                  )
                ]),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _ispressed = !_ispressed;
                  _isElevated = !_isElevated;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: 200,
                height: 200,
                child: Center(
                    child: Text(
                  _ispressed ? "Original" : "Optimize",
                  style: TextStyle(
                      fontSize: 8,
                      color: _isElevated ? Colors.black : Colors.black),
                )),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: _isElevated
                        ? [
                            BoxShadow(
                              color: Colors.grey[500]!,
                              offset: Offset(4, 4),
                              blurRadius: 15,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1)
                          ]
                        : null),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Product Optimizer"),
        ),
        body: AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            child: _ispressed
                ? Center(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListView.builder(
                          itemCount: getContainer(), //4
                          itemBuilder: (BuildContext context, int index) {
                            List productCount = getProdNumber()[index + 1];

                            print("${index}this is list ${productCount}");
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10, top: 15, bottom: 15),
                                child: Card(
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 20,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(144, 150, 236, 200),
                                        boxShadow: [],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Drop Location : ${index + 1} ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        for (int i = 0;
                                            i < productCount.length;
                                            i++)
                                          // for (int j = 0; j < product.length; j++)
                                          //   if (product[j]["dropLocation"] == index)

                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10,
                                                left: 10,
                                                right: 10),
                                            child: Card(
                                              shape: BeveledRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              elevation: 7,
                                              child: Container(
                                                  // height: 40,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .9,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white70,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10.0,
                                                            bottom: 10),
                                                    child: Column(
                                                      children: [
                                                        // Padding(
                                                        //   padding:
                                                        //       const EdgeInsets.all(
                                                        //           8.0),
                                                        //   child: Container(
                                                        //     decoration: BoxDecoration(
                                                        //         border: Border.all(
                                                        //             color: Colors
                                                        //                 .black)),
                                                        //     child: Padding(
                                                        //       padding:
                                                        //           const EdgeInsets
                                                        //               .all(8.0),
                                                        //       child: Row(
                                                        //         children: [
                                                        //           Text(
                                                        //               "Drop Location : "),
                                                        //           Spacer(),
                                                        //           Text(
                                                        //               "${productCount[i]["dropLocation"]}")
                                                        //         ],
                                                        //       ),
                                                        //     ),
                                                        //   ),
                                                        // ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .black)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                      "Weight : "),
                                                                  Spacer(),
                                                                  Text(
                                                                      "${productCount[i]["weight"]}")
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .black)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                      "Product Number : "),
                                                                  Spacer(),
                                                                  Text(
                                                                      "${productCount[i]["productNumber"]}")
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        SizedBox(height: 5)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 212, 221, 246),
                            borderRadius: BorderRadius.circular(10)),
                        child: ListView.builder(
                            itemCount: product.length, //4
                            itemBuilder: (BuildContext context, int index) {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0,
                                              bottom: 10,
                                              left: 10,
                                              right: 10),
                                          child: Card(
                                            shape: BeveledRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            elevation: 20,
                                            child: Container(
                                                // height: 40,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .9,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        223, 255, 255, 255),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10.0,
                                                          bottom: 10),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                    "Drop Location : "),
                                                                Spacer(),
                                                                Text(
                                                                    "${product[index]["dropLocation"]}")
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                    "Weight : "),
                                                                Spacer(),
                                                                Text(
                                                                    "${product[index]["weight"]}")
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                    "Product Number : "),
                                                                Spacer(),
                                                                Text(
                                                                    "${product[index]["productNumber"]}")
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  )));
  }
}
