class WordModel {
  WordModel({
    required this.id,
    required this.eng,
    required this.kor,
    required this.writer,
    required this.showing,
    required this.adding,
  });

  int id;
  String eng;
  String kor;
  String writer;
  int showing;
  int adding;

  factory WordModel.fromJson(Map<String, dynamic> json) => WordModel(
    id: json['id'],
    eng: json['eng'],
    kor: json['kor'],
    writer: json['writer'],
    showing: json['showing'],
    adding: json['adding'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'eng': eng,
    'kor': kor,
    'writer': writer,
    'showing': showing,
    'adding': adding,
  };
}
