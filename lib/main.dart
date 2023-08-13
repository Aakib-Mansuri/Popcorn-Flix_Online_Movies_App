import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:popcornflix/Animations/StarUpAnimation.dart';
import 'package:popcornflix/CategoriesPage.dart';
import 'package:popcornflix/ItemPage.dart';
import 'package:popcornflix/Modals/CustomURL.dart';
import 'package:popcornflix/Services/FetchMovies.dart';
import 'package:url_launcher/url_launcher.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: FutureBuilder(
        future: FetchMovies(url: MovieURL(suffix: 'movie',preffix: 'top_rated')).getData(),

        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Scaffold(
                backgroundColor: Colors.black.withOpacity(.92),
                appBar: AppBar(title: Center(child: Text("Popcorn Flex")) ,backgroundColor: Colors.red[900]),
                body: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CarouselSlider(
                          options: CarouselOptions(height: 400.0),
                          items: snapshot.data?.map((movie) {
                            return Builder(
                              builder: (BuildContext context) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(
                                          builder: (context) => ItemScreen(
                                              url: MovieURL(suffix: 'movie',preffix: 'popular'),
                                              movie: movie
                                          ),
                                        ));
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(movie.imgUrl),
                                          fit: BoxFit.fill
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      Expanded(
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.only(top: 5),
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          width: 40,
                                          child: FloatingActionButton(
                                            backgroundColor: Colors.blue.shade400,
                                            onPressed: (){_launchYouTubeURL();},
                                            heroTag: null,
                                            child: Icon(Icons.send),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10,right: 10),
                                          width: 40,
                                          child: FloatingActionButton(
                                            backgroundColor: Colors.red.shade400,
                                            onPressed: (){_launchYouTubeURL();},
                                            heroTag: null,
                                            child: Icon(Icons.play_circle),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10,right: 10),
                                          width: 40,
                                          child: FloatingActionButton(
                                            backgroundColor: Colors.blueAccent.shade400,
                                            onPressed: (){_launchYouTubeURL();},
                                            heroTag: null,
                                            child: Icon(Icons.question_answer_outlined),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10,right: 10),
                                          width: 40,
                                          child: FloatingActionButton(
                                            backgroundColor: Colors.deepOrange.shade400,
                                            onPressed: (){_launchYouTubeURL();},
                                            heroTag: null,
                                            child: Icon(Icons.query_builder,color: Colors.indigo),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          width: 40,
                                          child: FloatingActionButton(
                                            backgroundColor: Colors.pink.shade400,
                                            onPressed: (){_launchYouTubeURL();},
                                            heroTag: null,
                                            child: Icon(Icons.share),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10,right: 10),
                                          width: 40,
                                          child: FloatingActionButton(
                                            backgroundColor: Colors.pinkAccent.shade100,
                                            onPressed: (){_launchYouTubeURL();},
                                            heroTag: null,
                                            child: Icon(Icons.camera_rounded,),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10,right: 10),
                                          width: 40,
                                          child: FloatingActionButton(
                                            backgroundColor: Colors.deepOrangeAccent.shade400,
                                            onPressed: (){_launchYouTubeURL();},
                                            heroTag: null,
                                            child: Icon(Icons.emoji_emotions_rounded),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10,right: 10),
                                          width: 40,
                                          child: FloatingActionButton(
                                            backgroundColor: Colors.yellow.shade400,
                                            onPressed: (){_launchYouTubeURL();},
                                            heroTag: null,
                                            child: Icon(Icons.timer_sharp,color: Colors.black87,),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: 2),
                                      child: Text(
                                        "Version 1.0.11",
                                        style: TextStyle(
                                            color: Colors.white.withOpacity(.87)
                                        ),
                                      ))
                                ],

                              ),
                            ),
                          )
                      )
                    ],
                  ),
                ),

                bottomNavigationBar: Container(
                  height: 50,
                  color: Colors.red[900],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: InkWell(
                              onTap: (){
                              },
                              child: Center(child: Text(
                                "Home",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.9)
                                ),
                              ))
                          )),
                      Expanded(
                          child: InkWell(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(
                                      builder: (context) => CategoryScreen(
                                          url:MovieURL(suffix: 'movie',preffix: 'popular'),
                                          title: "Popular"
                                      ),
                                    ));
                              },
                              child: Center(child: Text(
                                "Popular",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.9)
                                ),
                              ))
                          )),
                      Expanded(
                          child: InkWell(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) => CategoryScreen(
                                            url:MovieURL(suffix: 'movie',preffix: 'upcoming'),
                                            title:"Upcoming"
                                        )
                                    ));
                              },
                              child: Center(child: Text(
                                "Upcoming",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.9)
                                ),
                              ))
                          )),
                      Expanded(
                          child: InkWell(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) => CategoryScreen(
                                            url:MovieURL(suffix: 'tv',preffix: 'popular'),
                                            title: "Tv Series"
                                        )
                                    ));
                              },
                              child: Center(child: Text(
                                "Series",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.9)
                                ),
                              ))
                          )),
                    ],
                  ),
                )
            );
          }

          else{
            return StartUpAnimation().get();
          }
        },
      ),
    );
  }
}

void _launchYouTubeURL() async {
  const youtubeURL = 'https://www.youtube.com';  // Replace with your actual YouTube video URL
  if (await canLaunch(youtubeURL)) {
    await launch(youtubeURL);
  } else {
    throw 'Could not launch $youtubeURL';
  }
}
