// import 'package:ecommerce_store/consts/consts.dart';
// import 'package:ecommerce_store/views/dashboard/embed.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class News {
//   final String logo;
//   final String companyName;
//   final String companyInfo;
//   final int starRating;

//   News({
//     required this.logo,
//     required this.companyName,
//     required this.companyInfo,
//     required this.starRating,
//   });
// }

// List<News> newsList = [
//   News(
//     logo: 'assets/company_logo1.png',
//     companyName: 'Công ty ABC',
//     companyInfo: 'Thông tin về Công ty ABC...',
//     starRating: 4,
//   ),
//   News(
//     logo: 'assets/company_logo2.png',
//     companyName: 'Công ty XYZ',
//     companyInfo: 'Thông tin về Công ty XYZ...',
//     starRating: 5,
//   ),
//   // Thêm các bài tin khác nếu cần
// ];

// class Information extends StatelessWidget {
//   const Information({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       color: Colors.grey[200],
//       width: context.screenWidth,
//       height: context.screenHeight,
//       child: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               height: 50,
//               color: Colors.white,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                         suffixIcon: Icon(Icons.search),
//                         fillColor: Colors.white,
//                         filled: true,
//                         hintText: "search",
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Tiêu Đề Tin Tức',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: newsList.length,
//                 itemBuilder: (context, index) {
//                   return buildNewsCard(newsList[index]);
//                 },
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Get.to(() => const MyWebView());
//               },
//               child: const Text("DashBoard"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildNewsCard(News news) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Image.asset(
//                   news.logo,
//                   width: 50,
//                   height: 50,
//                 ),
//                 SizedBox(width: 10),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       news.companyName,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Icon(Icons.star, color: Colors.yellow),
//                         Text(news.starRating.toString()),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             Text(
//               news.companyInfo,
//               style: TextStyle(fontSize: 14),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
