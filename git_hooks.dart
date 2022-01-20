import "dart:io";

import "package:dart_pre_commit/dart_pre_commit.dart";
import "package:git_hooks/git_hooks.dart";

void main(List<String> arguments) {
  final params = {
    Git.commitMsg:commitMsg,
  };
  GitHooks.call(arguments, params);
}
Future<bool> commitMsg() async {
  var commitMsg = Utils.getCommitEditMsg();
  if (commitMsg.startsWith('fix:')) {
    return true; // you can return true let commit go
  } else  {
    print('you should add `fix` in the commit message');
    return false;
  }
}