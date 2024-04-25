
import 'package:cloud_firestore/cloud_firestore.dart';
class Messages {
  final String content;
  final DateTime createdAt;
   String? id;

  Messages(this.content, this.id, this.createdAt);
  factory Messages.fromJsonMap(Map<String, dynamic> jsonData) {
    return Messages(
      jsonData['content'],
      jsonData['id'] != null ? jsonData['id'] as String : null,
      (jsonData['createdAt'] as Timestamp).toDate(), // Convert Timestamp to DateTime
    );
  }

}

