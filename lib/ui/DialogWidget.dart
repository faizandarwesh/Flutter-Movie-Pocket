import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
        child: Container(
          height: 500.0,
          width: 300.0,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 CircleAvatar(child: Image.asset("assets/images/movie4.jpg",height: 150,),),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('Awesome', style: TextStyle(color: Colors.red),),
              ),
              Padding(padding: EdgeInsets.only(top: 50.0)),
              FlatButton(onPressed: (){
                Navigator.of(context).pop();
              },
                  child: Text('Got It!', style: TextStyle(color: Colors.purple, fontSize: 18.0),))
            ],
          ),
        ),
      ),
    );
  }
}

