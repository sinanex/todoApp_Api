class TodoModel {
  String? id;
  String? title;
  String? subtitle;
  TodoModel({
     this.id,
    required this.title,
    required this.subtitle
  });
  factory TodoModel.fromJson(Map <String,dynamic>json){
    return TodoModel(title: json['title'], subtitle: json['subtitle'],id: json['id']);
  }

  Map<String,dynamic> toJson(){
    return {
      'id':id,
    'title': title,
    'subtitle':subtitle,
    
    };
  }
}

