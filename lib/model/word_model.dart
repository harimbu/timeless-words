class Word {
  final int id;
  final String eng;
  final String kor;
  final String writer;
  final int showing;
  int adding;

  Word({
    required this.id,
    required this.eng,
    required this.kor,
    required this.writer,
    required this.showing,
    this.adding = 0,
  });

  // 데이터베이스로부터 받아온 데이터를 Word 객체로 변환
  factory Word.fromMap(Map<String, dynamic> json) => Word(
    id: json['id'],
    eng: json['eng'],
    kor: json['kor'],
    writer: json['writer'],
    showing: json['showing'],
    adding: json['adding'],
  );

  // Word 객체를 데이터베이스에 저장하기 위한 Map으로 변환
  Map<String, dynamic> toMap() => {
    'id': id,
    'eng': eng,
    'kor': kor,
    'writer': writer,
    'showing': showing,
    'adding': adding,
  };
}
