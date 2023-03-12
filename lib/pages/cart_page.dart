import 'package:asbeza/bloc/test_bloc.dart';
import 'package:asbeza/bloc/test_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Asbezaa"),
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<GroceryBloc, GroceryState>(
        builder: (context, state) {
          if (state is GroceryInitial) {
            return const Center(
                child: Text(
              "Nothing in the Cart!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ));
          }
          if (state is GroceryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GrocerySuccess) {
            if (state.cart.isEmpty) {
              return const Center(
                  child: Text(
                "Nothing in the cart currently!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ));
            } else {
              num TotalPrice = 0;
              void _incrementCounter() {
                for (var item in state.cart) {
                  TotalPrice += item.groceryPrice;
                }
              }

              _incrementCounter();
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 400,
                    child: ListView.builder(
                        itemCount: state.cart.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          final valueOfCart = state.cart[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                width: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Column(children: [
                                  Image.network(valueOfCart.groceryImage),
                                  const Divider(),
                                  Text(
                                    valueOfCart.groceryTitle,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Price" +
                                        " " +
                                        "${valueOfCart.groceryPrice.toString()}",
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                              ),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Total Price: ${TotalPrice.toStringAsFixed(2)}\$",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          fontFamily: "Poppins"),
                    ),
                  ),
                ],
              );
            }
          }
          return Container();
        },
      ),
    );
  }
}
