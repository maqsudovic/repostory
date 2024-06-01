import 'package:flutter/material.dart';
import 'package:repostory/controller/replan_controller.dart';
import 'package:repostory/model/rplan_model.dart';
import 'package:repostory/repository/rplan_repos.dart';

class ReplanListView extends StatefulWidget {
  @override
  _ReplanListViewState createState() => _ReplanListViewState();
}

class _ReplanListViewState extends State<ReplanListView> {
  final ReplanController _replanController = ReplanController(ReplanRepository());
  List<Replan> _replans = [];

  @override
  void initState() {
    super.initState();
    _loadReplans();
  }

  Future<void> _loadReplans() async {
    final replans = await _replanController.getReplans();
    setState(() {
      _replans = replans;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _replans.length,
      itemBuilder: (context, index) {
        final replan = _replans[index];
        return ListTile(
          title: Text(replan.title),
          subtitle: Text(replan.description),
          trailing: Checkbox(
            value: replan.isCompleted,
            onChanged: (value) {
              replan.isCompleted = value ?? false;
              _replanController.updateReplan(replan.id, replan);
            },
          ),
        );
      },
    );
  }
}