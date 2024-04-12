import 'package:flutter/material.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false; // สร้างตัวแปรสำหรับเก็บค่าของ Remember Me

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // รูปภาพข้างบน
              Image.asset(
                'assets/login.png', // ระบุ path ของรูปภาพใน assets
                height: 150.0, // กำหนดความสูงของรูปภาพ
              ),
              Padding(
                padding: EdgeInsets.all(30),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username', // เพิ่ม labelText เพื่อแสดงข้อความบนกล่องใส่ข้อความ
                  border: OutlineInputBorder(), // เพิ่ม border เพื่อสร้างเส้นขอบรอบกล่องใส่ข้อความ
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // กำหนดขนาดกล่องใส่ข้อความ
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password', // เพิ่ม labelText เพื่อแสดงข้อความบนกล่องใส่ข้อความ
                  border: OutlineInputBorder(), // เพิ่ม border เพื่อสร้างเส้นขอบรอบกล่องใส่ข้อความ
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // กำหนดขนาดกล่องใส่ข้อความ
                ),
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Text('Remember Me'), // เลื่อนข้อความ "Remember Me" ไปด้านซ้ายสุดของ Row
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        _rememberMe = value ?? false; // อัปเดตค่าของ Remember Me
                      });
                    },
                  ),
                  Spacer(), // ใช้ Spacer เพื่อช่วยให้ปุ่ม Register อยู่ด้านขวา
                  ElevatedButton(
                    onPressed: () {
                      // Add your authentication logic here
                      String username = _usernameController.text;
                      String password = _passwordController.text;
                      // Example: validate login credentials
                      if (username == 'admin' && password == 'password') {
                        // Navigate to another screen or perform an action
                        // after successful login
                        print('Login Successful');
                      } else {
                        // Show error message or handle invalid credentials
                        print('Invalid username or password');
                      }
                    },
                    child: Text('register'),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add registration logic here
                      print('Go to home page');
                    },
                    child: Text('Login'),
                  ),
                ),
              ),
              SizedBox(height: 50.0), // Add SizedBox for spacing
            ],
          ),
        ),
      ),
    );
  }
}
