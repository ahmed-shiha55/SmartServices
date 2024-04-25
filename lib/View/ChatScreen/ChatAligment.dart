// import 'package:flutter/material.dart';


// import 'package:intl/intl.dart';

// class ChatWidgetSend extends StatelessWidget {
//   final String message;
//   final String date;

//   ChatWidgetSend({Key? key, required this.message , required  this.date}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//         padding: EdgeInsets.only(left: 10, bottom: 15, top: 15, right: 12),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//             bottomRight: Radius.circular(30),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start

//           children: [
//             Text(
//               message,
//               style: const TextStyle(color: Colors.black),
//             ),
//             const SizedBox(height: 7),
//             Text(
//               '${date}', // Format the time
//               style: const TextStyle(color: Colors.black26),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ChatWidgetRecieve extends StatelessWidget {
//    final String message;
//   final String date;

//   ChatWidgetRecieve({Key? key, required this.message, required  this.date}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//         padding: EdgeInsets.only(left: 12, bottom: 15, top: 15, right: 10),
//         decoration: BoxDecoration(
//           color: Colors.blue[900],
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//             bottomLeft: Radius.circular(30),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end, // Align items to the start

//           children: [
//             Text(
//               message,
//               style: const TextStyle(color: Colors.white),
//             ),
//             const SizedBox(height: 7),
//             Text(
//               '${DateFormat('hh:mm a').format(message.createdAt)}', // Format the time
//               style: const TextStyle(color: Colors.white70),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
