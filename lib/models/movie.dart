class Movie {
  String title;
  String posterPath;
  String overview;
  double voteAverage;
  int id;

  Movie(
    //int id,
    //String title,
    //double voteAverage,
     //String overview,
    //String posterPath,
    this.id,
    this.title,
    this.voteAverage,
    this.overview,
    this.posterPath,
  );
  // Movie.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   title = json['title'];
  //   voteAverage = json['vote_average'] * 1.0;
  //   overview = json['overview'];
  //   posterPath = json['poster_path'];
  // }

  Movie.fromJson(Map<String, dynamic> json)
    :   title = json['title'],
        posterPath = json['poster_path'],
        overview = json['overview'],
        voteAverage = json['vote_average'] * 1.0,
        id = json['id'];
}
