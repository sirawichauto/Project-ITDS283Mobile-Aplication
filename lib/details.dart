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
        title: Text(''),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'ค้นหาโรงแรม...',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              ),
            ),
          ),
        ),
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
                SizedBox(height: 8.0), // ระยะห่างด้านบน 8.0
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/detail1.png', // ตำแหน่งของไฟล์รูปภาพในโฟลเดอร์ assets
                      width: 150.0,
                      height: 150.0,
                    ),
                    Image.asset(
                      'assets/detail2.png', // ตำแหน่งของไฟล์รูปภาพในโฟลเดอร์ assets
                      width: 150.0,
                      height: 150.0,
                    ),
                    Image.asset(
                      'assets/detail3.png', // ตำแหน่งของไฟล์รูปภาพในโฟลเดอร์ assets
                      width: 150.0,
                      height: 150.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // โค้ดเมื่อกดปุ่ม "จอง" จะมีได้แบบตัวอย่างเท่านั้น
            print('Booking hotel...');
          },
          child: Text('จอง'),
        ),
      ),
    );
  }
}
