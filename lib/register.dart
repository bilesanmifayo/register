import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String firstname = '';
  String lastname = '';
  String username = '';
  String email = '';
  String phone = '';
  String password = '';
  String referedby = '';
  String devicetype = 'Android';
  String registervia = 'Android';
  String countryTid = 'NFYUS';

  Future<void> register() async {
    final url = Uri.parse('https://testenvr2104.cardify.co/api/user/auth/register.php');
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    final body = {
      'firstname': firstname,
      'lastname': lastname,
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
      'referedby': referedby,
      'devicetype': devicetype,
      'registervia': registervia,
      'country_tid': countryTid,
    };

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status']) {
        print('Registration successful: $data');
      } else {
        print('Registration failed: ${data['text']}');
      }
    } else {
      print('Registration failed: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const SizedBox(height: 50,),
            const Text("Sign Up", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
            const Text("Finish creating your cardify account", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF676767)),),
            const SizedBox(height: 15,),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("First Name and Last Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF676767)),),
              const SizedBox(height: 5,),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_2_outlined, size: 20,),
                  hintText: 'First and Last Name',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF6A6A6A)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF205CFF)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  final nameParts = value!.split(' ');
                  firstname = nameParts[0];
                  lastname = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';
                },
              ),
              const SizedBox(height: 10),
              const Text("Username", 
              style: 
              TextStyle(fontSize: 16, fontWeight: FontWeight.bold, 
              color: Color(0xFF676767)),),
              const SizedBox(height: 5,),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.account_circle_outlined, size: 20,),
                  hintText: 'Username', 
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF6A6A6A)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF205CFF)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
                onSaved: (value) => username = value!,
              ),
              const SizedBox(height: 10),
              const Text("Email", 
              style: 
              TextStyle(fontSize: 16, fontWeight: FontWeight.bold, 
              color: Color(0xFF676767)),),
              const SizedBox(height: 5,),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.mail_outline, size: 20,),
                  hintText: 'Email',
                   enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF6A6A6A)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF2152F3),),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email address';
                  }
                  return null;
                },
                onSaved: (value) => email = value!,
              ),
              const SizedBox(height: 10),
              const Text("Phone", 
              style: 
              TextStyle(fontSize: 16, fontWeight: FontWeight.bold, 
              color: Color(0xFF676767)),),
              const SizedBox(height: 5,),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone_outlined, size: 20,),
                  labelText: 'Phone',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF6A6A6A)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF2152F3),),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
                onSaved: (value) => phone = value!,
              ),
              const SizedBox(height: 10,),
              const Text("Passwords", 
              style: 
              TextStyle(fontSize: 16, fontWeight: FontWeight.bold, 
              color: Color(0xFF676767)),),
              const SizedBox(height: 5,),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock, size: 20,),
                  hintText: 'Password',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF6A6A6A)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF2152F3),),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
                onSaved: (value) => password = value!,
              ),
              const SizedBox(height: 10),
              const Text("Referral (Optional)", 
              style: 
              TextStyle(fontSize: 16, fontWeight: FontWeight.bold, 
              color: Color(0xFF676767)),),
              const SizedBox(height: 5,),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_2_outlined, size: 20,),
                  hintText: "Referral's Username",
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF6A6A6A)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF2152F3),),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  ),
                onSaved: (value) => referedby = value!,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    fillColor: MaterialStateProperty.all(const Color(0xFF2152F3)),
                    onChanged: (bool? value) {},
                  ),
                  const Expanded(
                    child: Text('I agree to Cardify Africa\'s Term of Service and Privacy Policy'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
             ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  register();
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF2C5AF0)),
                minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
            ],
          ),
        ),
          ],
      ),
      ),
      ),
    );
  }
}
