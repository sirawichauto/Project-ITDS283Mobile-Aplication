import 'package:flutter/material.dart';

void main() {
  runApp(MyTripApp());
}

class MyTripApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Trip',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyTripPage(),
    );
  }
}

class MyTripPage extends StatefulWidget {
  @override
  _MyTripPageState createState() => _MyTripPageState();
}

class _MyTripPageState extends State<MyTripPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserved'),
        backgroundColor: Color.fromARGB(255, 59, 56, 235),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Mytrips',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/mytrip2.png',
                  width: 150.0,
                  height: 150.0,
                ),
                SizedBox(width: 10), // Add space between image and text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ห้องดีรักต์เตียงคิงส์ไซต์ 1 เตียง',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      'ประเภทเตียง 1 เตียงคิงไซส์',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      'ผู้เข้าพัก 2 ผู้ใหญ่',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      'รวมอาหารเช้า',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      'Wifi ฟรี',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ข้อมูลผู้เข้าพัก',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 15),
                Text(
                  'ชื่อผู้เข้าพัก',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 15),
                Text(
                  'สิรวิชญ์ เหลืองไพฑูรย์',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 15),
                Text(
                  'คำขอพิเศษ',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 15),
                Text(
                  '---',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 150),
                Text(
                  'ราคารวม',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Mytrips',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
