import 'package:eshoppy/login/RegisterPage.dart';
import 'package:eshoppy/ui/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _emailTextController = TextEditingController();
  var _passwordTextController = TextEditingController();

  void showSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(value)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Color(0xFFB40284A),title: Text("Login Page",style: TextStyle(color:Colors.white),),),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: EdgeInsets.symmetric(horizontal: 32,vertical: 16),
                color: Colors.black26,
                height: 200,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Image.asset("assets/images/logo.png",height: 200,),

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
                controller: _emailTextController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Email Address",
                    icon: Icon(Icons.email,color: Color(0xFFB40284A),)
                ),
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
                controller: _passwordTextController,
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Password",
                    icon: Icon(Icons.verified_user,color: Color(0xFFB40284A),)
                ),
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
                 /* if(_emailTextController.text.isEmpty && _passwordTextController.text.isEmpty){
                    showSnackBar("Please fill the required fields");
                  }
                  else {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return HomeScreen();
                    }));
                  }*/
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return HomeScreen();
                  }));
                },
                color: Color(0xFFB40284A),
                textColor: Colors.white,
                child: Text("Sign In".toUpperCase(),
                    style: TextStyle(fontSize: 14)),
              ),
            ),
            SizedBox(height: 32,),
            GestureDetector(
              onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return RegisterPage();
                  }));
          },
          child: new Text("Don't have account? Register Now",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Color(0xFFB40284A)),),
        )
          ],
        ),
      ),
    );
  }
}


