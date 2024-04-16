import 'package:flutter/material.dart';

void main() {
  runApp(CartApp());
}

class CartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cart',
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

  bool _isChecked = false; // Add this line to track checkbox state

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
              'Cart',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/cart1.png',
                  width: 200.0,
                  height: 100.0,
                ),
                
                SizedBox(width: 10), // Add space between image and text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Text(
                      'นาซ่า กรุงเทพ',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow), // ดาวที่ 1
                        Icon(Icons.star, color: Colors.yellow), // ดาวที่ 2
                        Icon(Icons.star, color: Colors.yellow), // ดาวที่ 3
                        Icon(Icons.star, color: Colors.yellow), // ดาวที่ 4
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Icon(
                            Icons.location_on,
                            size: 20,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          'Bangkok',
                          style: TextStyle(fontSize: 14.0, color: Colors.blue),
                        ),
                      ],
                    ),
                    
                  ],
                ),
                
              ],
            ),
            
          ),
          
          Padding(
  padding: EdgeInsets.only(left: 20.0), // ให้มีการขยับเข้ามาจากขอบด้านข้าง 20.0
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Checkbox(
            value: _isChecked,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value ?? false;
              });
            },
          ),
          SizedBox(width: 8.0), // เพิ่มระยะห่างระหว่าง Checkbox กับข้อความ
          Text('1 x Deluxe Room'), // เพิ่มข้อความ "Deluxe" ด้านข้าง Checkbox
        ],
      ),
      
    ],
  ),
),

Padding(
  padding: EdgeInsets.symmetric(horizontal: 35.0), // ให้มีการขยับเข้ามาจากขอบด้านข้าง 35.0
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('12 Mar - 13 Mar, 2024 (1 night)'), // ข้อความ "12 Mar - 13 Mar, 2024 (1 night)" อยู่ด้านล่างของ Row
      SizedBox(height: 4.0), // เพิ่มระยะห่างระหว่างข้อความและ icon ฿
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 50),
           // เพิ่มระยะห่างระหว่าง icon และข้อความ
          Text(
            '1250 ฿',
            textAlign: TextAlign.center, 
          ),
           // เพิ่มข้อความ 1250
        ],
        
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
