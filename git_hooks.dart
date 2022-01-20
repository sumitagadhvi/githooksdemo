import "dart:io";

import "package:dart_pre_commit/dart_pre_commit.dart";
import "package:git_hooks/git_hooks.dart";

void main(List<String> arguments) {
  final params = {
    Git.preCommit: _preCommit,
    Git.commitMsg:commitMsg,
  };
  GitHooks.call(arguments, params);
}

Future<bool> commitMsg() async {
  var commitMsg = Utils.getCommitEditMsg();
  if (commitMsg.startsWith('fix:')) {
    return false; // you can return true let commit go
  } else  {
    print('you should add `fix` in the commit message before commit');
    return false;
  }
}
Future<bool> _preCommit() async {
 var hooks = await Hooks.create();  // adjust behaviour if neccessary
  final result = await hooks();  // run activated hooks on staged files
  return result.isSuccess;  // report the result
}
