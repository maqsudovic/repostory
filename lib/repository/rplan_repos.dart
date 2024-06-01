import 'package:repostory/model/rplan_model.dart';
import 'package:firebase_database/firebase_database.dart';

class ReplanRepository {
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final DatabaseReference _replanRef = FirebaseDatabase.instance.ref('replans');

  Future<List<Replan>> getReplans() async {
    final snapshot = await _replanRef.get();
    if (snapshot.exists) {
      final data = snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        return data.entries.map((entry) => Replan.fromMap(entry.value as Map<String, dynamic>)).toList();
      }
    }
    return [];
  }

  Future<void> createReplan(Replan replan) async {
    await _replanRef.push().set(replan.toMap());
  }

  Future<void> updateReplan(String id, Replan replan) async {
    await _replanRef.child(id).update(replan.toMap());
  }

  Future<void> deleteReplan(String id) async {
    await _replanRef.child(id).remove();
  }
}