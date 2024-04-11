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
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: 'Username',
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        _rememberMe = value ?? false; // อัปเดตค่าของ Remember Me
                      });
                    },
                  ),
                  Text('Remember Me'), // เพิ่ม Text สำหรับแสดงข้อความ "Remember Me"
                ],
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
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
