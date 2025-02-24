// import 'package:flutter/material.dart';

// import 'radio_service.dart';
// // import 'radio_service.dart';
// import 'model.dart';

// class RadioScreen extends StatefulWidget {
//   @override
//   _RadioScreenState createState() => _RadioScreenState();
// }

// class _RadioScreenState extends State<RadioScreen> {
//   late Future<List<RadioMODEL>> radioList;

//   @override
//   void initState() {
//     super.initState();
//     radioList = RadioService().fetchRadios(); // Ensure correct type assignment
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Quran Radios")),
//       body: FutureBuilder<List<Radio>>(
//         future: radioList,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text("No data found"));
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 final radio = snapshot.data![index];
//                 return ListTile(
//                   title: Text(radio.name),
//                   subtitle: Text(radio.url),
//                   onTap: () {
//                     // Play the radio stream
//                   },
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
