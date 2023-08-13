class MvDetails {
  final id, name, date, imgUrl, language;
  MvDetails({
    this.id,
    this.name,
    this.date,
    this.imgUrl,
    this.language,
  });

  factory MvDetails.fromJson(Map<String, dynamic> json) {
    dynamic name = null;
    dynamic imgUrl = null;
    String date = "";

    if (json['title'] != null)
    {
      name = json['title'];
    }
    else if (json['name'] != null)
    {
      name = json['name'];
    }

    if (json['release_date'] != null)
    {
      date = json['release_date'].substring(0,4);
    }

    else if (json['first_air_date'] != null)
    {
      date = json['first_air_date'].substring(0,4);
    }

    if(json['poster_path'] != null)
    {
      imgUrl = "https://image.tmdb.org/t/p/original" + json['poster_path'];
    }

    return MvDetails(
      id: json['id'] == null ? null : json['id'],
      name: name,
      date: date,
      imgUrl: imgUrl,
      language: json['original_language'] == null ? null : json['original_language'],
    );
  }
}