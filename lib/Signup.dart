import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(SignUpApp());
}

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 64, 51, 236),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTextFormFieldWithLabel('ชื่อ', _usernameController),
            SizedBox(height: 10.0),
            _buildTextFormFieldWithLabel('นามสกุล', _surnameController),
            SizedBox(height: 10.0),
            _buildTextFormFieldWithLabel('ที่อยู่อีเมล', _emailController),
            SizedBox(height: 10.0),
            _buildTextFormFieldWithLabel('หมายเลขโทรศัพท์', _phoneController),
            SizedBox(height: 10.0),
            _buildTextFormFieldWithLabel('ประเทศ/ภูมิภาค', _countryController),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // เปลี่ยนเส้นทางการเรียกหน้า
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()), // LoginPage() เป็นหน้า Login ที่คุณสร้างขึ้น
                  );
                  
                  String username = _usernameController.text;
                  String surname = _surnameController.text;
                  String email = _emailController.text;
                  String phone = _phoneController.text;
                  String country = _countryController.text;

                  print('ชื่อ: $username');
                  print('นามสกุล: $surname');
                  print('ที่อยู่อีเมล: $email');
                  print('หมายเลขโทรศัพท์: $phone');
                  print('ประเทศ/ภูมิภาค: $country');
                },
                child: Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormFieldWithLabel(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 4), // ลดระยะห่างให้กล่องเหลี่ยมเล็กลง
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: label,
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0), // กำหนดค่า contentPadding ที่เหมาะสม
          ),
        ),
      ],
    );
  }
}
