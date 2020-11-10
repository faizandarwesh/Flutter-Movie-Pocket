
import 'package:eshoppy/models/Movie.dart';
import 'package:eshoppy/network/WebService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'DetailScreen.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Webservice webservice = new Webservice();

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 2;
    final double itemWidth = size.width / 2;
    String endPoint = "upcoming";

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFFB40284A),
          title:Text("Movie Pocket",style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.white,),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child:Image.asset("assets/images/logo.png",fit: BoxFit.cover,),
                decoration: BoxDecoration(
                  color: Color(0xFFB40284A),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home,color: Color(0xFFB40284A),),
                title: Text('Home',style: TextStyle(color: Color(0xFFB40284A),),),
                onTap: () {
                 Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.person,color:Color(0xFFB40284A),),
                title: Text('Profile',style: TextStyle(color: Color(0xFFB40284A),),),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: Color(0xFFB40284A),),
                title: Text('Favorites',style: TextStyle(color: Color(0xFFB40284A),),),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: Icon(Icons.compare_arrows,color: Color(0xFFB40284A),),
                title: Text('Up Coming',style: TextStyle(color: Color(0xFFB40284A),),),
                onTap: () {
                  /*endPoint = "upcoming";
                  Navigator.pop(context);*/
                },
              ),
              ListTile(
                leading: Icon(Icons.star,color: Color(0xFFB40284A),),
                title: Text('Top Rated',style: TextStyle(color: Color(0xFFB40284A),),),
                onTap: () {
                 /* endPoint = "now_playing";
                  Navigator.pop(context);*/
                },
              ),
              ListTile(
                leading: Icon(Icons.assignment_late,color: Color(0xFFB40284A),),
                title: Text('About Us',style: TextStyle(color: Color(0xFFB40284A),),),
                onTap: () {
                  //showDialog(context: context, builder: (BuildContext context) => DialogWidget());
                  showDialog();
                },
              ),
              Divider(color: Colors.black,height: 10,),
              ListTile(
                leading: Icon(Icons.assignment_return,color: Color(0xFFB40284A),),
                title: Text('Logout',style: TextStyle(color: Color(0xFFB40284A),),),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        body: FutureBuilder<List<Result>>(
            future: webservice.getMovies(endPoint),
            builder: (context,snapshot){
              if (snapshot.hasData) {
                return GridView.count(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  childAspectRatio: (itemWidth / itemHeight),
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: List.generate(snapshot.data.length, (index) {
                    return new GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return DetailScreen(title: snapshot.data[index].title, movieId: snapshot.data[index].id,);
                        }));
                      },
                      child: Card(
                        elevation: 5,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            ClipRRect(child: Image.network("https://image.tmdb.org/t/p/w600_and_h900_bestv2${snapshot.data[index].posterPath}",
                            ),
                              borderRadius:BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0)
                              ),
                            ),
                            SizedBox(height: 2,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("${snapshot.data[index].title}",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight:FontWeight.w900),textAlign: TextAlign.center,maxLines: 2,),
                            ),
                            Text("${snapshot.data[index].releaseDate}",style: TextStyle(color: Colors.black,fontSize: 14,),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                              RatingBar(
                                itemSize: 20,
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  rating = snapshot.data[index].voteAverage/2;
                                },
                              ),
                            ],)
                          ],
                        ),
                      ),
                    );
                  }),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(
                    child: CircularProgressIndicator(),
                  );
            }
        )
    );
  }


  void showDialog() {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Material(
          type: MaterialType.transparency,
          child:  Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 500,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 150,
                      child: Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(child: Icon(Icons.email,color: Color(0xFFB40284A),),),
                          Expanded(
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                      image: new ExactAssetImage("assets/images/faizan.jpeg")
                                  )
                              ),
                            ),
                          ),
                          Expanded(child: Icon(Icons.call,color:Color(0xFFB40284A),),)
                        ],
                      ),
                  ),
                  Divider(color: Color(0xFFB40284A),height: 2,),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                    child: Text("I'm Faizan Darwesh, Bachelors in CS from KU, UBIT, Pakistan. Android Developer at Genetech Solutions. Interested in technologies like Java, Kotlin and Flutter.",
                      style: TextStyle(fontSize: 14,color: Color(0xFFB40284A)),textAlign: TextAlign.center,maxLines: 5,),
                  ),
                  Divider(color: Color(0xFFB40284A),height: 2,),
                  SizedBox(height: 16,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[ //row//spacearound
                            Text("Linked In",style: TextStyle(color:Color(0xFFB40284A,),fontSize: 14),),
                            SizedBox(height: 8,),
                            Text("Faizan Darwesh",style: TextStyle(color:Colors.black,fontSize: 14)),
                            SizedBox(height: 16,),
                            Text("Phone",style: TextStyle(color:Color(0xFFB40284A),fontSize: 14),),
                            SizedBox(height: 8,),
                            Text("(+92)3060821290",style: TextStyle(color:Colors.black,fontSize: 14)),
                            SizedBox(height: 16,),
                            Text("ZipCode",style: TextStyle(color:Color(0xFFB40284A),fontSize: 14),),
                            SizedBox(height: 8,),
                            Text("75450",style: TextStyle(color:Colors.black,fontSize: 14))
                          ],

                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[ //row//spacearound
                            Text("Email",style: TextStyle(color:Color(0xFFB40284A,),fontSize: 14),),
                            SizedBox(height: 8,),
                            Text("faizandarwesh@gmail",style: TextStyle(color:Colors.black,fontSize: 14)),
                            SizedBox(height: 16,),
                            Text("Location",style: TextStyle(color:Color(0xFFB40284A),fontSize: 14),),
                            SizedBox(height: 8,),
                            Text("Pakistan",style: TextStyle(color:Colors.black,fontSize: 14)),
                            SizedBox(height: 16,),
                            Text("Address",style: TextStyle(color:Color(0xFFB40284A),fontSize: 14),),
                            SizedBox(height: 8,),
                            Text("Gulistan e Jauhar, Karachi",style: TextStyle(color:Colors.black,fontSize: 14))
                          ],
                        ),
                      ],
                    )
                  ),
                ],
              ),
              margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

}
