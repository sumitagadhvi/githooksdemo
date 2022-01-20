import 'dart:io';
import "package:dart_pre_commit/dart_pre_commit.dart";

void main()async {
  var hooks = await Hooks.create();  // adjust behaviour if necessary
  final result = await hooks();  // run activated hooks on staged files
  exitCode = result.isSuccess ? 0 : 1;  // report the result
}
