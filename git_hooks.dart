// --no-sound-null-safety
import 'dart:io';
import 'package:git_hooks/git_hooks.dart';
//
void main(List<String> arguments) {
  // ignore: omit_local_variable_types
  final params = {
    Git.commitMsg: commitMsg,
    Git.preCommit: preCommit
  };
  GitHooks.call(arguments, params);
}

Future<bool> commitMsg() async {
  var commitMsg = Utils.getCommitEditMsg();
  if (commitMsg.startsWith('fix:')) {
    return true; // you can return true let commit go
  } else {
    print('you should add `fix` in the commit message');
    return false;
  }
  return true;
}

Future<bool> preCommit() async {
  try {
    ProcessResult result = await Process.run('dartAnalyzer', ['bin']);
    print(result.stdout);
    if (result.exitCode != 0) return false;
  } catch (e) {
    return false;
  }
  return true;
}
