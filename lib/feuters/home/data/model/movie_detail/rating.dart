class Rating {
  String? source;
  String? value;

  Rating({this.source, this.value});

  factory Rating.fromJsonData(Map<String, dynamic> json) => Rating(
        source: json['Source'] as String?,
        value: json['Value'] as String?,
      );

  Map<String, dynamic> toJsonData() => {
        'Source': source,
        'Value': value,
      };
}
