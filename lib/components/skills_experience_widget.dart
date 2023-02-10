import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'skills_experience_model.dart';
export 'skills_experience_model.dart';

class SkillsExperienceWidget extends StatefulWidget {
  const SkillsExperienceWidget({
    Key? key,
    this.phoneNum,
  }) : super(key: key);

  final String? phoneNum;

  @override
  _SkillsExperienceWidgetState createState() => _SkillsExperienceWidgetState();
}

class _SkillsExperienceWidgetState extends State<SkillsExperienceWidget> {
  late SkillsExperienceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SkillsExperienceModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container();
  }
}
