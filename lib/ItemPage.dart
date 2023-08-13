import 'package:flutter/material.dart';
import 'package:popcornflix/Modals/CustomURL.dart';
import 'package:popcornflix/Modals/MoviesDetails.dart';
import 'package:popcornflix/VideoPlayerPage.dart';

class ItemScreen extends StatelessWidget
{
  MvDetails movie;
  late dynamic url;

  ItemScreen({required this.movie,required this.url});

  Widget build(BuildContext context) {
    dynamic imgWidget = AssetImage("assets/imgerror.jpg");
    if(movie.imgUrl != null)
    {
      imgWidget = NetworkImage(movie.imgUrl);
    }

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.7),
      body: Center(
        child: Container(
            width: 300,
            height: 400,
            child: Card(
                child: Container(
                  decoration: BoxDecoration(
                      image : DecorationImage(
                          image: imgWidget,
                          fit:  BoxFit.cover
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 30,
                                              child: FloatingActionButton(
                                                backgroundColor: Colors.lightGreen,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                                ),
                                                onPressed: (){

                                                },
                                                heroTag: null,
                                                child: Icon(Icons.error_outline),
                                              ),
                                            ),
                                            Container(
                                              width: 30,
                                              height: 30,
                                              margin: EdgeInsets.only(top: 7),

                                              child: FloatingActionButton(
                                                backgroundColor: Colors.pinkAccent.shade200,
                                                onPressed: (){

                                                },
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                                ),
                                                heroTag: null,
                                                child: Icon(Icons.add_circle),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                    )
                                ),
                                Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 50,
                                          child: FloatingActionButton(
                                            backgroundColor: Colors.black.withOpacity(.7),
                                            onPressed: ()async {
                                              if(this.url.suffix != 'search')
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                      builder: (context) => VideoScreen(url: VideoURL(suffix: this.url.suffix, preffix: this.movie.id.toString())),
                                                    )
                                                );

                                              else
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                      builder: (context) => VideoScreen(url: VideoURL(suffix: this.url.preffix, preffix: this.movie.id.toString())),
                                                    )
                                                );
                                            },
                                            heroTag: null,
                                            child: Icon(Icons.play_arrow,),
                                          ),
                                        )
                                      ],
                                    )
                                )
                              ],
                            ),
                          )
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(top: 10),
                          color: Colors.white.withOpacity(.9),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FittedBox(
                                child: Text(
                                  movie.name+" ("+movie.date+")",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 20
                                  ),
                                ),
                                fit: BoxFit.fitWidth,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    "Available in: "+movie.language,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
            )
        ),
      ),
    );
  }
}