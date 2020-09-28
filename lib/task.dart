import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

List<Task> taskFromJson(String str) => List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String taskToJson(List<Task> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Task {
  Task( {
    this.id,
    this.isComplete,
    this.title,
  });

  String id;
  bool isComplete;
  String title;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"],
    isComplete: json["isComplete"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isComplete": isComplete,
    "title": title,
};
  Map<String, dynamic> toDocument() => {
    "isComplete": isComplete,
    "title": title,
  };

   static Task fromSnapshot( DocumentSnapshot snap){
    return Task(
      id:  snap.id,
      isComplete: snap.data()?? false,
      title: snap.data().toString(),
    );
  }
}
