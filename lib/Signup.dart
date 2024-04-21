import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project2/models/profile.dart';
import 'package:toastification/toastification.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

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
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
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
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(errorText: "Invalid Email"),
                ]),
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                onSaved: (email){
                  profile.email = email;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _surnameController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: "Invalid password"),
      
                ]),
                onSaved: (password){
                  profile.password = password;
                },

              ),
              
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    toastification.show(
                          context: context,
                          title: Text('สร้างบัญชีผู้ใช้สำเร็จ'),
                          autoCloseDuration: const Duration(seconds: 5),
                        );
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      print(
                          " email = ${profile.email} password = ${profile.password}");

                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: profile.email!,
                                password: profile.password!)
                            .then((value) {
                          formKey.currentState!.reset();
                          
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }));
                        });
                      } on FirebaseAuthException catch (e) {
                        print(e.code);
                        print(e.message);
                        String message;
                        if (e.code == 'email-already-in-use') {
                          message = "บัญชีนี้มีอยู่แล้ว";
                        } else if (e.message == 'weak-password') {
                          message = "รหัสผ่านต้องมีความยาว 6 ตัวอักษรขึ้นไป";
                        } else {
                          message = e
                              .message!; // ใช้ข้อความข้อผิดพลาดที่ส่งกลับจาก Firebase
                        }
                      }
                    }
                  },
                  child: Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormFieldWithLabel(
      String label, TextEditingController controller) {
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
            contentPadding: EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 10.0), // กำหนดค่า contentPadding ที่เหมาะสม
          ),
        ),
      ],
    );
  }
}
