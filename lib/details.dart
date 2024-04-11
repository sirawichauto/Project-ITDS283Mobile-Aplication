import 'package:flutter/material.dart';

void main() {
  runApp(HotelDetailsApp());
}

class HotelDetailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Details Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HotelDetailsPage(),
    );
  }
}

class HotelDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียดที่พัก'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // เมื่อคลิกที่ไอคอนค้นหา
              // ใส่โค้ดเพื่อเปิดหน้าค้นหาหรือทำการค้นหาข้อมูล
              print('Search button clicked');
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Image.network(
            'https://example.com/hotel_image.jpg', // URL ของรูปภาพโรงแรม
            fit: BoxFit.cover, // ปรับขนาดรูปภาพให้พอดีกับพื้นที่ที่กำหนด
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'รายละเอียดที่พัก',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'นาซ่า กรุงเทพ 44 ถ. สุขุมวิท 71 แขวงสวนหลวง,กรุงเทพ,ไทย 10250',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // โค้ดเมื่อกดปุ่ม "จอง" จะมีได้แบบตัวอย่างเท่านั้น
                    print('Booking hotel...');
                  },
                  child: Text('จอง'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
