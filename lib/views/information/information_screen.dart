import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/views/dashboard/embed.dart';
import 'package:ecommerce_store/views/information/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class News {
  final String logo;
  final String companyName;
  final String companyInfo;
  final String addressInfo;
  final int starRating;

  News({
    required this.logo,
    required this.companyName,
    required this.companyInfo,
    required this.addressInfo,
    required this.starRating,
  });
}

List<News> newsList = [
  News(
    logo: "assets/images/slider_3.png",
    companyName: 'HTX Dịch vụ nông nghiệp Bình Phước',
    companyInfo:
        'Sản phẩm cung cấp: Sầu riêng mint, Bơ ông Hoàng, hạt điều,...',
    addressInfo: 'Phường Thác Mơ, Tx Phước Long',
    starRating: 4,
  ),
  News(
    logo: "assets/images/slider_3.png",
    companyName: 'Hộ kinh doanh Lê Văn Minh',
    addressInfo: "Phường Tân Xuân, thành phố Đồng Xoài, tỉnh Bình Phước",
    companyInfo:
        'Chuyên cung cấp hật điều nguyên chất, hạt điều vị mật ong đạt chứng nhận Ocop',
    starRating: 5,
  ),
  News(
    logo: "assets/images/slider_4.png",
    companyName: 'Công ty cổ phần fressfood Bp',
    addressInfo: "Xã Tân Tiến, huyện Bù Đốp, tỉnh Bình Phước",
    companyInfo: 'Chuyên cung cấp hoa để bản ban mai, hoa để bàn Phúc Lộc Thọ',
    starRating: 3,
  ),
  News(
    logo: "assets/images/slider_4.png",
    companyName: 'HTX cây ăn trái Minh Thắng',
    addressInfo: "Xã MInh Thắng, Tx Chơn Thành",
    companyInfo: 'Chuyên cung cấp các loại bưởi chất lượng cao',
    starRating: 4,
  ),
];

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  Widget buildNewsCard(News news) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  news.logo,
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.companyName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        Text(news.starRating.toString()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              news.companyInfo,
              style: const TextStyle(fontSize: 14),
            ),
            if (news.addressInfo.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Địa chỉ: ${news.addressInfo}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12),
        color: Colors.grey[200],
        width: context.screenWidth,
        height: context.screenHeight,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 50,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.search),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "search",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildIconButton("Cơ sở sản xuất kinh doanh", Icons.business,
                      Colors.black),
                  buildIconButton(
                      "Vùng sản xuất", Icons.location_on, Colors.green),
                  buildIconButton(
                      "Địa điểm kinh doanh", Icons.map, Colors.pink),
                  buildIconButton("Tìm đối tác", Icons.people, Colors.purple),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    return buildNewsCard(newsList[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const MyWebView());
                },
                child: const Text("Thống kê sản phẩm Ocop"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
