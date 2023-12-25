class MovieModel {
  String? title;
  String? year;
  String? imdbId;
  String? type;
  String? poster;
  int count;

  MovieModel(
      {this.title,
      this.year,
      this.imdbId,
      this.type,
      this.poster,
      required this.count});

  factory MovieModel.fromJsonData(Map<String, dynamic> json, int c) =>
      MovieModel(
        title: json['Title'] as String?,
        year: json['Year'] as String?,
        imdbId: json['imdbID'] as String?,
        type: json['Type'] as String?,
        poster: json['Poster'] as String?,
        count: c,
      );

  Map<String, dynamic> toJsonData() => {
        'Title': title,
        'Year': year,
        'imdbID': imdbId,
        'Type': type,
        'Poster': poster,
      };
}
