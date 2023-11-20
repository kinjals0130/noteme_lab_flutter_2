import 'dart:convert';

class Note{
  final String title;
  final String desc;
  final DateTime createdTime;

  Note({
    required this.title,
    required this.desc,
    required this.createdTime,
  });

  //variables can be null, using ?? assigns a null pointer to the var
  Note copyWith({
    String? title,
    String? desc,
    DateTime? createdTime,
  }){
    return Note(
      title: title ?? this.title,
      desc: desc ?? this.desc,
      createdTime: createdTime ?? this.createdTime,
    );
  }

  //map all the parts of the note
  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      'title': title,
      'desc': desc,
      'createdTime': createdTime.millisecondsSinceEpoch,
    };
  }

  //factory constructor could return an instance from cache or can be used to initialize a final
  //variable using logic that can't be handled in the initializer list
  factory Note.fromMap(Map<String, dynamic> map){
    return Note(
      title: map['title'] as String,
      desc: map['desc'] as String,
      createdTime: DateTime.fromMillisecondsSinceEpoch(map['createdTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Note(title: $title, desc: $desc, createdTime: $createdTime)';

  @override
  bool operator ==(covariant Note other){
    if(identical(this, other)){
      return true;
    }

    return other.title == title && other.desc == desc && other.createdTime == createdTime;
  }

  int get hashcode => title.hashCode ^ desc.hashCode ^ createdTime.hashCode;


}
