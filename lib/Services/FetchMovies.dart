import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:popcornflix/Modals/CustomURL.dart';
import 'package:popcornflix/Modals/MoviesDetails.dart';

class FetchMovies {
  dynamic url;
  FetchMovies({required this.url});

  Future<List<MvDetails>> getData() async {
    http.Response response;
    response = await http.get(
      Uri.parse(this.url.getURL()),
      headers: {
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzczNDQ3NDcyMzE0ODUxNmNhZTliN2FlMTNkMzEzMyIsInN1YiI6IjY0YjE3MjdjYmJkMGIwMDBlNDhlYmI4ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cAPKvFLtRtoVYCGExhfYHumQtAUaQb1ix6_KHzzTymc"
      },
    );
    List<dynamic> resultList = json.decode(response.body)['results'];
    List<MvDetails> mvList = resultList.map((dynamic item) => MvDetails.fromJson(item)).toList();
    return mvList;
  }
}