
class TodoEntity {
  String title;
  String description;

  TodoEntity(this.title, this.description);

  TodoEntity.fromJson(Map json)
      : title = json['title'],
        description = json['description'];
}
