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
              "NO HISTORY TO SHOW!\n TOTAL: 0\$",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
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
                "NO HISTORY TO SHOW!\n TOTAL: 0\$",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ));
            } else {
              num TotalPrice = 0;
              void _incrementCounter() {
                for (var element in state.cart) {
                  TotalPrice += element.groceryPrice;
                }
              }

              _incrementCounter();
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "TOTAL: ${TotalPrice.toStringAsFixed(2)}\$",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    height: 350,
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
                                        fontSize: 12, color: Colors.black),
                                  ),
                                  Text(
                                    "${valueOfCart.groceryPrice.toString()}",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ]),
                              ),
                            ),
                          );
                        }),
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
