import 'package:flutter/material.dart';
import 'home.dart';
import 'Cart.dart';
import 'profile.dart';

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
                SizedBox(width: 15), // Add space between image and text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.king_bed), 
                        Text(
                          'ห้องดีรักต์เตียงคิงส์ไซต์ 1 เตียง',
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.people), 
                        Text(
                          'ผู้เข้าพัก 2 ผู้ใหญ่',
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons
                            .local_dining),
                        Text(
                          'รวมอาหารเช้า',
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.wifi), 
                        Text(
                          'Wifi ฟรี',
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ],
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
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,),
                ),
                SizedBox(height: 15),
                Text(
                  'ชื่อผู้เข้าพัก',
                  style: TextStyle(fontSize: 16.0,
                  color: Colors.grey,),
                ),
                SizedBox(height: 15),
                Text(
                  'สิรวิชญ์ เหลืองไพฑูรย์',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 15),
                Text(
                  'คำขอพิเศษ',
                  style: TextStyle(fontSize: 16.0,
                  color: Colors.grey,),
                ),
                SizedBox(height: 15),
                Text(
                  '---',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 150),
                Text(
                  'ราคารวม                                                 1,363 ฿',
                  style: TextStyle(fontSize: 16.0,
                  fontWeight: FontWeight.bold),
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
        onTap:
            _onItemTapped, // เรียกใช้ _onItemTapped เมื่อแตะที่ไอเท็มใน BottomNavigationBar
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyTripApp()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartApp()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
      default:
        break;
    }
  }
}
