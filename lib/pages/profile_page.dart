import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // @override
  // void initState() {
  //   super.initState();
  //   getContactPermission();
  // }

  // void getContactPermission() async {
  //   if (await Permission.contacts.isGranted) {
  //     //contacts
  //   } else {
  //     await Permission.contacts.request();
  //   }
  // }

  // void fetchContacts() async {
  //   ContactsService.getContacts();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Asbezaa Calculator"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQybfZDCOylNw3wPpQ9r0F9khF0mXeRcSzx5A&usqp=CAU"),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(34, 40, 0, 0),
            width: 300,
            height: 100,
            child: const Text(
              'Name: Betemariam Abenet Berhane Zegiorgis Yohhanes...............Adam',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(34, 0, 0, 0),
            width: 300,
            height: 55,
            child: const Text(
              'Phone Number:                 0909099909',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
