import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:popcornflix/Animations/NotFoundAnimation.dart';
import 'package:popcornflix/Modals/CustomURL.dart';
import 'package:popcornflix/Services/FetchMovies.dart';
import 'package:popcornflix/Animations/LoadingAnimation.dart';
import 'package:popcornflix/ItemPage.dart';


class CategoryScreen extends StatefulWidget {
  late dynamic url;
  late String title;
  CategoryScreen({
    required this.url,
    required this.title
  });
  @override
  State<CategoryScreen> createState() => _CategoryScreenState(url: this.url,title: this.title);
}

class _CategoryScreenState extends State<CategoryScreen> {
  late dynamic url;
  late String title;
  List<String> _suggestions = ["Oppenheimer","Barbie","X-Man","Faster","Flash"];

  _CategoryScreenState({
    required this.url,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(.5),
        appBar: EasySearchBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                this.title,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.red.shade600
                ),
              )
            ],
          ),
          backgroundColor: Colors.black,
          onSearch: (value) => setState(() {
            if (value.isEmpty)
              value = 'a';

            if(this.url.suffix != 'search')
              this.url = SearchURL(suffix: 'search', preffix: this.url.suffix, q: value);
            else
              this.url = SearchURL(suffix: 'search', preffix: this.url.preffix, q: value);
          }),
          searchTextStyle: TextStyle(color: Colors.white),
          iconTheme: IconThemeData(
              color: Colors.red
          ),
          searchBackIconTheme: IconThemeData(
              color: Colors.red
          ),
          searchClearIconTheme: IconThemeData(
              color: Colors.red
          ),
          searchBackgroundColor: Colors.black,
          suggestions: _suggestions,
          suggestionBackgroundColor: Colors.black,
          suggestionTextStyle: TextStyle(color: Colors.white),
        ),
        body: FutureBuilder(
        future: FetchMovies(url: this.url).getData(),
        builder: (context, snapshot) {
          if(snapshot.hasData)
          {
            return Scaffold(
              backgroundColor: Colors.black.withOpacity(.5),
              body: Container(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      mainAxisExtent: 200
                  ),
                  padding: EdgeInsets.only(top: 8,left: 3,right: 3),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    dynamic imgWidget = AssetImage("assets/imgerror.jpg");
                    if(snapshot.data?[index].imgUrl != null)
                    {
                      imgWidget = NetworkImage(snapshot.data?[index].imgUrl);
                    }

                    return InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => ItemScreen(
                                  url: this.url,
                                  movie: snapshot.data![index]
                              ),
                            ));
                      },

                      child: Card(
                          child: Container(
                            decoration: BoxDecoration(
                                image : DecorationImage(
                                    image: imgWidget,
                                    fit:  BoxFit.cover
                                )
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 10, left: 5),
                                    color: Colors.black87.withOpacity(0.3),
                                    child: Text(
                                      snapshot.data?[index].name +" ("+ snapshot.data?[index].date+")",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                      ),
                    );
                  },),
              ),
            );
          }

          else{
            if(this.url.suffix == 'search')
              return NotFoundAnimation();
            else
              return LoadingAnimation();
          }
        },
      ),
    );
  }
}
