import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do/models/task_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, options) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  static addTask(TaskModel taskModel) {
    var collection = getTaskCollection();
    var docRef = collection.doc();
    taskModel.id = docRef.id;
    docRef.set(taskModel);
  }

  static Stream<QuerySnapshot<TaskModel>> getTask(DateTime time) {
    return getTaskCollection()
        .where("date", isEqualTo: time.millisecondsSinceEpoch)
        .snapshots();
  }

  static void deleteTask(String id) {
    getTaskCollection().doc(id).delete();
  }
  static void updateTask(TaskModel taskModel){
    getTaskCollection().doc(taskModel.id).update(taskModel.toJson());
  }
}
