class Movie {
  String title;
  String backDrop;
  String originalTitle;
  String overView;
  String posterPath;
  DateTime releaseDate;
  double voteAverage;

  Movie({
    required this.title,
    required this.backDrop,
    required this.originalTitle,
    required this.overView,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"],
      backDrop: json["backdrop_path"],
      originalTitle: json["original_title"],
      overView: json["overview"],
      posterPath: json["poster_path"],
      releaseDate:DateTime.tryParse(json['release_date'])!,
      voteAverage: json["vote_average"],
    );
  }

  
}
