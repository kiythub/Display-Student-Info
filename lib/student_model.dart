class Student {
  int? id;
  String idNum;
  String name;
  String birthdate;
  String course;
  String section;
  String gender;

  Student({
    this.id,
    required this.idNum,
    required this.name,
    required this.birthdate,
    required this.course,
    required this.section,
    required this.gender
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    id: json['id'],
    idNum: json['idNum'],
    name: json['name'],
    birthdate: json['birthdate'],
    course: json['course'],
    section: json['section'],
    gender: json['gender'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'idNum' : idNum,
    'name': name,
    'birthdate' : birthdate,
    'course': course,
    'section' : section,
    'gender' : gender
  };
}