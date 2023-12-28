import 'package:ecommerce_store/consts/consts.dart';

Widget buildIconButton(String title, IconData icon, Color color) {
  return SizedBox(
    width: 70,
    child: Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 30, color: color), // Kích thước 30
          onPressed: () {
            // Xử lý khi nhấn vào icon
          },
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 12), // Kích thước font chữ
        ),
      ],
    ),
  );
}
