import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:popcornflix/Modals/CustomURL.dart';
import 'package:popcornflix/Modals/VideoDetails.dart';

class FetchVideos {
  VideoURL url;
  FetchVideos({required this.url});

  Future<List<VdDetails>> get() async {
    http.Response response;
    response = await http.get(
      Uri.parse(this.url.getURL()),
      headers: {
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzczNDQ3NDcyMzE0ODUxNmNhZTliN2FlMTNkMzEzMyIsInN1YiI6IjY0YjE3MjdjYmJkMGIwMDBlNDhlYmI4ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cAPKvFLtRtoVYCGExhfYHumQtAUaQb1ix6_KHzzTymc"
      },
    );
    List<dynamic> resultList = json.decode(response.body)['results'];
    List<VdDetails> vdList;

    if(resultList.isNotEmpty)
    {
      vdList = resultList.map((dynamic item) => VdDetails.fromJson(item)).toList();
    }
    else{
      vdList = [VdDetails(id: "xc_j6Hpj0YM",site: "YouTube")];
    }
    return vdList;
  }
}