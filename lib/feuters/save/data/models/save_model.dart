class SaveModel {
  final String movieId;
  final String docId;
  final String image;
  SaveModel({
    required this.movieId,
    required this.docId,
    required this.image,
  });
  factory SaveModel.fromJsonData(jsonData) {
    return SaveModel(
        movieId: jsonData['imdbID'],
        docId: jsonData.id,
        image: jsonData['Poster']);
  }
}
