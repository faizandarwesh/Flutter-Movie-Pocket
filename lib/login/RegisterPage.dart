import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterPage> {

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Color(0xFFB40284A),title: Text("Register",style: TextStyle(color:Colors.white),),),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                height: 200,
                width: 200,
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: CircleAvatar(radius: 5.0,child: Image.asset("assets/images/profile_image.png",),)
            ),
            SizedBox(height: 16,),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              margin: EdgeInsets.symmetric(horizontal: 32),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xFFB40284A))
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Username",
                    icon: Icon(Icons.account_circle,color: Color(0xFFB40284A),)
                ),
                controller: _usernameController,
              ),
            ),
            SizedBox(height: 16,),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              margin: EdgeInsets.symmetric(horizontal: 32),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xFFB40284A))
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Email Address",
                    icon: Icon(Icons.email,color: Color(0xFFB40284A),)
                ),
                controller: _emailController,
              ),
            ),
            SizedBox(height: 16,),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              margin: EdgeInsets.symmetric(horizontal: 32),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xFFB40284A))
              ),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Password",
                    icon: Icon(Icons.verified_user,color: Color(0xFFB40284A),)
                ),
                controller: _passwordController,
              ),
            ),
            SizedBox(height: 16,),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              margin: EdgeInsets.symmetric(horizontal: 32),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xFFB40284A))
              ),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Confirm Password",
                    icon: Icon(Icons.verified_user,color: Color(0xFFB40284A),)
                ),
                controller: _confirmPasswordController,
              ),
            ),
            SizedBox(height: 32,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              height: 50,
              child:RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Color(0xFFB40284A))),
                onPressed: () {
                  var name = _usernameController.text.toString().trim();
                  var email = _emailController.text.toString().trim();
                  var password = _passwordController.text.toString().trim();
                  var confirmPassword = _confirmPasswordController.text.toString().trim();
                },
                color: Color(0xFFB40284A),
                textColor: Colors.white,
                child: Text("Sign Up".toUpperCase(),
                    style: TextStyle(fontSize: 14)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
