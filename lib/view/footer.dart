// import 'package:flutter/material.dart';
// import 'package:my_portfolio/profile_colors.dart';

// class Footer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final width=MediaQuery.of(context).size.width;
//     final height=MediaQuery.of(context).size.height;
//       return Column(
//         children: [
//           ClipPath(
//             clipper: AppBarClipper(),
//             child: Container(
//               height: height * 0.35,
//               width: width,
//               decoration: BoxDecoration(
//                 border: Border.all(color: ProfileColors.backgroundColor),
//                 color: Colors.red,
//                 boxShadow: [
//                   BoxShadow(
//                       offset: Offset(0.0, 3.0),
//                       color: Color(0xFF3383CD),
//                       blurRadius: 6.0)
//                 ]),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                 ],
//               )
//             ),
//           ),
//         ],
//       );
//   }
// }

// class AppBarClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, 0);
//     path.lineTo(0, 263);
//     path.quadraticBezierTo(size.width / 4, 0, size.width / 2, 0);
//     path.quadraticBezierTo(size.width - size.width / 4, 0, size.width, 263);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }