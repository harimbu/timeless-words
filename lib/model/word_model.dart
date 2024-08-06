class WordModel {
  WordModel({
    required this.id,
    required this.kor,
    required this.eng,
    required this.writer,
    required this.showing,
    required this.adding,
  });

  int id;
  String kor;
  String eng;
  String writer;
  int showing;
  int adding;

  factory WordModel.fromJson(Map<String, dynamic> json) => WordModel(
        id: json["id"],
        kor: json["kor"],
        eng: json["eng"],
        writer: json["writer"],
        showing: json["showing"],
        adding: json["adding"],
      );
}
