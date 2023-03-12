import 'package:flutter/material.dart';

import 'package:mobile_number/mobile_number.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _mobileNumber = '';
  List<SimCard> _simCard = <SimCard>[];

  @override
  void initState() {
    super.initState();
    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      } else {}
    });

    initMobileNumberState();
  }

  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    try {
      _mobileNumber = (await MobileNumber.mobileNumber)!;
      _simCard = (await MobileNumber.getSimCards)!;
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }
    if (!mounted) return;

    setState(() {});
  }

  Widget fillCards() {
    List<Widget> widgets = _simCard
        .map((SimCard sim) => Text(
            'Sim Card Number: (${sim.countryPhonePrefix}) - ${sim.number}\nCarrier Name: ${sim.carrierName}\nCountry Iso: ${sim.countryIso}\nDisplay Name: ${sim.displayName}\nSim Slot Index: ${sim.slotIndex}\n\n'))
        .toList();
    return Column(children: widgets);
  }

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
            child: Text(
              "Phone Number:" + "+$_mobileNumber",
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



// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mobile_number/mobile_number.dart';

// import 'dart:async';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   String _mobileNumber = '';
//   List<SimCard> _simCard = <SimCard>[];

//   @override
//   void initState() {
//     super.initState();
//     MobileNumber.listenPhonePermission((isPermissionGranted) {
//       if (isPermissionGranted) {
//         initMobileNumberState();
//       } else {}
//     });

//     initMobileNumberState();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initMobileNumberState() async {
//     if (!await MobileNumber.hasPhonePermission) {
//       await MobileNumber.requestPhonePermission;
//       return;
//     }
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       _mobileNumber = (await MobileNumber.mobileNumber)!;
//       _simCard = (await MobileNumber.getSimCards)!;
//     } on PlatformException catch (e) {
//       debugPrint("Failed to get mobile number because of '${e.message}'");
//     }

//     if (!mounted) return;

//     setState(() {});
//   }

//   Widget fillCards() {
//     List<Widget> widgets = _simCard
//         .map((SimCard sim) => Text(
//             'Sim Card Number: (${sim.countryPhonePrefix}) - ${sim.number}\nCarrier Name: ${sim.carrierName}\nCountry Iso: ${sim.countryIso}\nDisplay Name: ${sim.displayName}\nSim Slot Index: ${sim.slotIndex}\n\n'))
//         .toList();
//     return Column(children: widgets);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Asbezaa Calculator"),
//         backgroundColor: Colors.black,
//       ),
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 30,
//           ),
//           Image.network(
//               "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQybfZDCOylNw3wPpQ9r0F9khF0mXeRcSzx5A&usqp=CAU"),
//           const SizedBox(
//             height: 30,
//           ),
//           Container(
//             margin: EdgeInsets.fromLTRB(34, 40, 0, 0),
//             width: 300,
//             height: 100,
//             child: const Text(
//               'Name: Betemariam Abenet Berhane Zegiorgis Yohhanes...............Adam',
//               style: TextStyle(
//                   fontSize: 20,
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           Container(
//             margin: EdgeInsets.fromLTRB(34, 0, 0, 0),
//             width: 300,
//             height: 55,
//             child: Text(
//               "Phone Number:" + _mobileNumber,
//               style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
