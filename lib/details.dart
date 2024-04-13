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
            'https://example.com/hotel_image.jpg',
            fit: BoxFit.cover,
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
                SizedBox(height: 8.0), // Add spacing between rows
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/detail1.png',
                      width: 300.0,
                      height: 300.0,
                    ),
                  ],
                ),
                SizedBox(height: 8.0), // Add spacing between rows
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/detail2.png',
                        width: 150.0,
                        height: 150.0,
                      ),
                    ),
                    SizedBox(width: 8.0), // Add spacing between images
                    Expanded(
                      child: Image.asset(
                        'assets/detail3.png',
                        width: 150.0,
                        height: 150.0,
                      ),
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
            print('Booking hotel...');
          },
          child: Text('จอง'),
        ),
      ),
    );
  }
}
