import 'package:asbeza/bloc/test_event.dart';
import 'package:asbeza/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:asbeza/pages/profile_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/test_bloc.dart';
import '../bloc/test_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Asbezaa"),
        backgroundColor: Colors.black,
        actions: [
          Container(
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
              icon: const Icon(Icons.account_circle_outlined),
            ),
          )
        ],
      ),
      body: BlocBuilder<GroceryBloc, GroceryState>(
        builder: (context, state) {
          if (state is GroceryInitial) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 0.0, bottom: 40, top: 20),
                  child: Image.asset('assets/images/cp.png'),
                ),
                const Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Calcuate your አስቤዛ from wherever you are!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "poppins",
                        fontSize: 30,
                        color: Colors.black),
                  ),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(200, 80),
                      alignment: Alignment.center),
                  onPressed: () {
                    BlocProvider.of<GroceryBloc>(context)
                        .add(const GroceryFetchEvent());
                  },
                  icon: const Icon(Icons.browse_gallery_outlined),
                  label: const Text(
                    "Browse Groceries",
                    style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                  ),
                ),
                const Spacer()
              ]),
            );
          }
          if (state is GrocerySuccess) {
            //print(state.grocery[0].groceryTitle);
            return Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 48,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        "Good Morning",
                        style: TextStyle(fontFamily: "poppins"),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        "Lets calculate some fresh አስቤዛ for you!",
                        style: TextStyle(fontFamily: "poppins", fontSize: 25),
                      ),
                    ),
                    Divider(),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        "Common አስቤዛ",
                        style: TextStyle(fontFamily: "poppins"),
                      ),
                    ),
                    Container(
                      height: 490,
                      child: ListView.builder(
                          itemCount: state.grocery.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            final groceries = state.grocery[index];
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
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.network(groceries.groceryImage),
                                        const Divider(),
                                        Text(
                                          groceries.groceryTitle,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontFamily: "Poppins"),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Price " +
                                              "${groceries.groceryPrice.toString()}",
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            BlocProvider.of<GroceryBloc>(
                                                    context)
                                                .add(CartEvent(
                                                    grocery: groceries));
                                          },
                                          child: const Text("Add to Cart"),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.black),
                                        ),
                                      ]),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ],
            );
          }
          if (state is GroceryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartPage()),
          );
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
