import 'package:flutter/cupertino.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class BaseBindings extends Bindings {
  final String routeName;

  BaseBindings({this.routeName = ""});

  @override
  void dependencies() {

  }

  @mustCallSuper
  Future clearDependencies() async{

  }
}