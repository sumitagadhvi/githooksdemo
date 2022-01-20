import 'dart:io';
import 'package:git_hooks/git_hooks.dart';

void main(List<String> arguments) {
  // ignore: omit_local_variable_types
  Map<Git, UserBackFun> params = {
    Git.commitMsg: commitMsg,
    Git.preCommit: preCommit
  };
  GitHooks.call(arguments, params);
}

Future<bool> commitMsg() async {
  String rootDir = Directory.current.path;
  String commitMsg = Utils.getCommitEditMsg();
  print(rootDir);
  if (commitMsg.startsWith('fix:')) {
    return true;
  } else {
    return false;
  }
}

Future<bool> preCommit() async {
  try {
    ProcessResult result = await Process.run('dartanalyzer', ['bin']);
    print(result.stdout);
    if (result.exitCode != 0) return false;
  } catch (e) {
    return false;
  }
  return true;
}
