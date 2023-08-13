class MovieURL{
  final endpoint = "https://api.themoviedb.org/3/";
  String suffix, preffix;
  MovieURL({
    required this.suffix,
    required this.preffix
});

  String getURL()
  {
    return endpoint + suffix + "/" + preffix;
  }
}

class VideoURL{
  final endpoint = "https://api.themoviedb.org/3/";
  String suffix, preffix;
  VideoURL({
    required this.suffix,
    required this.preffix
  });

  String getURL()
  {
    return endpoint + suffix + "/" + preffix + "/videos";
  }
}

class SearchURL{
  final endpoint = "https://api.themoviedb.org/3/";
  String suffix, preffix, q;
  SearchURL({
    required this.suffix,
    required this.preffix,
    required this.q
  });

  String getURL()
  {
    return endpoint + suffix + "/" + preffix + "?query=" + q;
  }
}