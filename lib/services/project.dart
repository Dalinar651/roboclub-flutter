import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:roboclub_flutter/models/project.dart';

import 'dart:async';

final Firestore _firestore = Firestore.instance;

class ProjectService {

  Future<bool> postProjects(
      {List<dynamic> projectImg,
        String name,
        String description,
        String date,
        String link,
        String progress ="",
        List<dynamic> teamMembers,
        List<dynamic>teamProfile,
        String fileUrl,
        }) async {
          
    Map<String, dynamic> data = {
      "name": name,
      "description": description,
      "projectImg": projectImg,
      "fileUrl": fileUrl,
      "progress": progress,
      "teamMembers": teamMembers,
      "teamProfile": teamProfile,
      "date" : date,
      "link": link,
    };

    await _firestore.collection("/projects").add(data).then((value) {

      print(value);
    });
    return true;
  }

  Future<List<Project>> fetchProjects() async {
    List<Project> list = [];

    await _firestore.collection("/projects").getDocuments().then((value) {

      value.documents.forEach((element) {
        list.add(Project.fromMap(element.data));
      });
    });
    return list;
  }
}

