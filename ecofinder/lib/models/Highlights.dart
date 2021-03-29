class Highlights {
  final Map<String, dynamic> highlight;
  final List<dynamic> listHighlights;
  final List<dynamic> listExperiences;

  Highlights({this.highlight, this.listHighlights, this.listExperiences});

  factory Highlights.fromJson(Map<dynamic, dynamic> json) {
    return Highlights(
      highlight: json['highlight'],
      listHighlights: json['top2'],
      listExperiences: json['experience'],
    );
  }
}
