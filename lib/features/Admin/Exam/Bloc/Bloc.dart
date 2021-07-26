import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smsapp/features/Admin/Exam/Bloc/Modal.dart';

class ClassListBloc extends Cubit<ClassList> {
  ClassListBloc() : super(ClassList());
  void setContext(BuildContext context) {
    state.setContext(context);
  }

  void fetchExamOption() {
    state.getExamOptions();
  }
}
