import 'package:eshoppy/models/MovieDetails.dart';
import 'package:eshoppy/network/WebService.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailScreen extends StatefulWidget {

  final String title;
  final int movieId;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  DetailScreen({Key key, @required this.title, @required this.movieId}) : super(key: key);

  void showSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(value)));
  }

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget._scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFB40284A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), color: Colors.white, onPressed: () {
          Navigator.pop(context);
        },),
        title: Text(
          widget.title, style: TextStyle(color: Colors.white, fontSize: 18,),
          maxLines: 1,),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.white,),
            onPressed: () {
              widget.showSnackBar("Added to favorites");
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              VideoPlayerClass(widget.movieId),
              SizedBox(height: 32,),
              MovieDescriptionWidget(widget.movieId)
            ],
          ),
        ),
      ),
    );
  }
}


class MovieDescriptionWidget extends StatefulWidget {

  int _movieId;

  MovieDescriptionWidget(int movieId){
    _movieId = movieId;
    print("Movie id : $_movieId");
  }

  @override
  _MovieDescriptionWidgetState createState() => _MovieDescriptionWidgetState();
}

class _MovieDescriptionWidgetState extends State<MovieDescriptionWidget> {

  Webservice webservice = new Webservice();
  var commentsTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieDetails>(
      future: webservice.getMovieDetails(widget._movieId),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ClipOval(
                    child: Image.network(
                   "https://image.tmdb.org/t/p/w600_and_h900_bestv2${snapshot.data.posterPath}",
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:32.0,vertical: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(snapshot.data.title, style: TextStyle(
                          color: Color(0xFFB40284A), fontSize: 22,),
                          textAlign: TextAlign.justify,
                          maxLines: null,),
                      ],),
                  )
                ],
              ),
              SizedBox(height: 8,),
              Text(snapshot.data.tagline,style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic,fontSize: 18),),
              SizedBox(height: 8,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    child: Text(snapshot.data.overview,style: TextStyle(color: Colors.black,fontStyle: FontStyle.normal,fontSize: 15),maxLines: 5,overflow: TextOverflow.ellipsis,),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 32,right: 32),
                child: Divider(
                  height: 36,
                  color: Color(0xFFB40284A),
                ),
              ),
              SizedBox(height: 8,),
              Text("Cast",style: TextStyle(color: Color(0xFFB40284A),fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center,),
              SizedBox(height: 16,),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.credits.cast.length,
                    itemBuilder: (context,index){
                    return Container(
                      width: 200,
                      height: 200,
                      child: Column(
                        children: <Widget>[
                          ClipOval(
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w600_and_h900_bestv2${snapshot.data.credits.cast[index].profilePath}",
                              width: 150,
                              height: 150,
                              fit: BoxFit.fill,
                            ),
                          ),
                        SizedBox(height: 8,),
                        Text("${snapshot.data.credits.cast[index].name}",style: TextStyle(color: Color(0xFFB40284A),fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,)
                        ],
                      ),
                    );
                    }
                )
              ),
              Container(
                margin: EdgeInsets.only(left: 32,right: 32),
                child: Divider(
                  height: 36,
                  color: Color(0xFFB40284A),
                ),
              ),
              SizedBox(height: 8,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Imdb Rating : ",style: TextStyle(color: Color(0xFFB40284A),fontSize: 16),),
                        SizedBox(width: 8,),
                        Text("7.5",style: TextStyle(color: Colors.black,fontSize: 16),)
                      ],
                    ),
                  ),
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Status : ",style: TextStyle(color: Color(0xFFB40284A),fontSize: 16),),
                        SizedBox(width: 8,),
                        Text("${snapshot.data.status}",style: TextStyle(color: Colors.black,fontSize: 16),)
                      ],
                    ),
                  ),
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Spoken Language : ",style: TextStyle(color: Color(0xFFB40284A),fontSize: 16),),
                        SizedBox(width: 8,),
                        Text("${snapshot.data.originalLanguage}",style: TextStyle(color: Colors.black,fontSize: 16),)
                      ],
                    ),
                  ),
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Budget : ",style: TextStyle(color: Color(0xFFB40284A),fontSize: 16),),
                        SizedBox(width: 8,),
                        Text("\$${snapshot.data.budget}",style: TextStyle(color: Colors.black,fontSize: 16),)
                      ],
                    ),
                  ),
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Genres : ",style: TextStyle(color: Color(0xFFB40284A),fontSize: 16),),
                        SizedBox(width: 8,),
                        Text("${snapshot.data.genres[0].name}",style: TextStyle(color: Colors.black,fontSize: 16),)
                      ],
                    ),
                  ),
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Revenue : ",style: TextStyle(color: Color(0xFFB40284A),fontSize: 16),),
                        SizedBox(width: 8,),
                        Text("\$${snapshot.data.revenue}",style: TextStyle(color: Colors.black,fontSize: 16),)
                      ],
                    ),
                  ),
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Release Date : ",style: TextStyle(color: Color(0xFFB40284A),fontSize: 16),),
                        SizedBox(width: 8,),
                        Text("${snapshot.data.releaseDate}",style: TextStyle(color: Colors.black,fontSize: 16),)
                      ],
                    ),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    margin: EdgeInsets.only(left: 32,right: 32),
                    child: Divider(
                      height: 36,
                      color: Color(0xFFB40284A),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text("Comments",style: TextStyle(color: Color(0xFFB40284A),fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 16,),
                        Container(
                          width: 280,
                          child: TextFormField(
                            controller: commentsTextController,
                            decoration: InputDecoration(
                              hintText: "Please write your comments...",
                            ),
                          ),
                        ),
                        SizedBox(width: 8,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: FloatingActionButton(
                            onPressed: (){},
                            child: Icon(
                              Icons.send,
                            ),
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: 16,)
                ],
              )
            ],
          );
        }
        return Text("");
      },
    );
  }
}


class VideoPlayerClass extends StatefulWidget {

  int _movieId;

  VideoPlayerClass(int movieId){
    _movieId = movieId;
    print("Movie id : $_movieId");
  }

  @override
  _VideoPlayerClassState createState() => _VideoPlayerClassState();
}

class _VideoPlayerClassState extends State<VideoPlayerClass> {

  String videoUrl = "https://www.youtube.com/watch?v=";
  Webservice webservice = new Webservice();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: webservice.getVideos(widget._movieId),
      builder: (context,snapshot){
       if(snapshot.hasData){
         return Container(
           child: SingleChildScrollView(
             child: Column(
               children: <Widget>[
                 YoutubePlayer(
                   controller: YoutubePlayerController(
                     initialVideoId: YoutubePlayer.convertUrlToId(videoUrl+snapshot.data),
                     flags: YoutubePlayerFlags(
                       autoPlay: true,
                       mute: false, //change to false to play videos in unmute form
                     ),
                   ),
                 )
               ],
             ),
           ),
         );
       }
       else if(snapshot.hasError){
         return Text("${snapshot.error.toString()}");
       }
       return Center(
         child: CircularProgressIndicator(),
       );
      },
    );
  }

}



