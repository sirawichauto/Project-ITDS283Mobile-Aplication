import 'package:flutter/material.dart';
import 'home.dart';
import 'booking.dart';
import 'location.dart';

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart), // ไอคอนตระกร้า
            onPressed: () {
              // เปลี่ยนหน้าไปยังหน้า Booking
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookingPage()),
              );

              // พิมพ์ข้อความเมื่อปุ่มตะกร้าถูกกด
              print('Shopping cart button pressed');
            },
          ),
        ],
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
      body: SingleChildScrollView(
        child: Padding(
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
              SizedBox(height: 8.0), // Add spacing between rows
              Text(
                'นาซ่า กรุงเทพ 44 ถ. สุขุมวิท 71 แขวงสวนหลวง,กรุงเทพ,ไทย 10250',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0), // Add spacing between rows
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Image.asset(
                      'assets/detail1.png',
                      width: 300.0,
                      height: 200.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.0), // Add spacing between rows
              // Add spacing between rows
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Image.asset(
                        'assets/detail2.png',
                        width: 200.0,
                        height: 200.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 3.0), // Add spacing between images
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Image.asset(
                        'assets/detail3.png',
                        width: 200.0,
                        height: 200.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0), // Add spacing between rows
              Text(
                'ห้องพัก',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0), // Add spacing between text and button
              Text(
                'ห้องอาหาร',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0), // Add spacing between text and button
              Text(
                'สำหรับธุรกิจและประชุม',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0), // Add spacing between text and button
              Text(
                'พื้นที่ส่วนกลาง',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0), // Add spacing between text and button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wifi ส่วนกลาง',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapSample()),
                      );
                      // Handle location button press
                      print('Location button pressed');
                    },
                    icon: Icon(Icons.location_on),
                    label: Text('Location'),
                  ),
                ],
              ),
              SizedBox(height: 8.0), // Add spacing between text and button
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow), // ดาวที่ 1
                  Icon(Icons.star, color: Colors.yellow), // ดาวที่ 2
                  Icon(Icons.star, color: Colors.yellow), // ดาวที่ 3
                  Icon(Icons.star, color: Colors.yellow), // ดาวที่ 4
                  Icon(Icons.star, color: Colors.yellow), // ดาวที่ 5
                  SizedBox(width: 120.0),
                  Text(
                    '1,363 /ห้อง /คืน ฿',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookingPage()),
            );

            print('Booking hotel...');
          },
          child: Text('Booking'),
        ),
      ),
    );
  }
}
