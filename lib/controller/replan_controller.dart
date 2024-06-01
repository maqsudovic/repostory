import 'package:repostory/model/rplan_model.dart';
import 'package:repostory/repository/rplan_repos.dart';

class ReplanController {
  final ReplanRepository _replanRepository;

  ReplanController(this._replanRepository);

  Future<List<Replan>> getReplans() async {
    return await _replanRepository.getReplans();
  }

  Future<void> createReplan(Replan replan) async {
    await _replanRepository.createReplan(replan);
  }

  Future<void> updateReplan(String id, Replan replan) async {
    await _replanRepository.updateReplan(id, replan);
  }

  Future<void> deleteReplan(String id) async {
    await _replanRepository.deleteReplan(id);
  }
}