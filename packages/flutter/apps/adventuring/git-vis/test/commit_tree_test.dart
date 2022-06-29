import 'package:flutter_test/flutter_test.dart';
import 'package:git_vis/git/object_database.dart';
import 'package:git_vis/git_objects/author.dart';
import 'package:git_vis/git_objects/commit.dart';
import 'package:git_vis/git_objects/commit_tree.dart';

void main() {
  // TODO: mock the file system so we can test these functions
  test('get branches', () {
    var branches = ObjectDatabase.getBranches();
    for (var branch in branches) {
      print(branch);
    }
  }, skip: true); // test is not finished yet

  test('walk', () {
    // get all branches, convert to a list of the hash values
    var branches = ObjectDatabase.getBranches();

    var tree = CommitTree.walkAndParse(branches: branches);

    print('$tree');
  }, skip: true); // test is not finished yet

  test('commitObject1', () {
    var object = Commit.from('commitObject1', commitObject1);
    expect(object.state.hash, 'commitObject1');
    expect(object.state.tree, '8de548adeabd07b82c3a9ef997eee59d169e8eca');
    expect(object.state.parents, ['193550346ad59e07824d7512b6c0edc185b65677']);
    expect(object.state.author, Author('-', 'nick@enspyr.co', 'Nick Meinhold'));
    expect(object.state.summary, 'Silly commit');
    expect(object.state.body, 'Silly billy');
  });

  test('commitObject2', () {
    var object = Commit.from('commitObject2', commitObject2);
    expect(object.state.hash, 'commitObject2');
    expect(object.state.tree, 'afc314b1490d96ed1f37f6024f9b37d5929ba3e2');
    expect(object.state.parents, ['075c0048e10fa26479c52030bcd80f2a1476ad51']);
    expect(object.state.author, Author('-', 'nick@enspyr.co', 'Nick Meinhold'));
    expect(object.state.summary,
        'Remove git log strategy, walk commit tree directly (#3)');
    expect(object.state.body, '');
  });

  test('commitObject3', () {
    var object = Commit.from('commitObject3', commitObject3);
    expect(object.state.hash, 'commitObject3');
    expect(object.state.tree, 'cfb23f74933941558825775968b6991c359d824e');
    expect(object.state.parents, []);
    expect(object.state.author, Author('-', 'nick@enspyr.co', 'Nick Meinhold'));
    expect(object.state.summary, 'First commit.');
    expect(
        object.state.body, '''Created a new project and added a CustomPainter.
Using Process.start to call "git log" worked after removing the mac
app sandbox.
Later we may want to build git alongside the app and restore the
sandbox for app distribution.
The Process.start seems to mess with the hot restart feature so for now
the app reads in an example output from "git log" while we work on
visualising the data.''');
  });
}

var commitObject1 = '''
commit 234tree 8de548adeabd07b82c3a9ef997eee59d169e8eca
parent 193550346ad59e07824d7512b6c0edc185b65677
author Nick Meinhold <nick@enspyr.co> 1646475507 +1100
committer Nick Meinhold <nick@enspyr.co> 1646475507 +1100

Silly commit

Silly billy

''';

var commitObject2 = '''
commit 735tree afc314b1490d96ed1f37f6024f9b37d5929ba3e2
parent 075c0048e10fa26479c52030bcd80f2a1476ad51
author Nick Meinhold <nick@enspyr.co> 1646466243 +1100
committer GitHub <noreply@github.com> 1646466243 +1100
gpgsig -----BEGIN PGP SIGNATURE-----
 
 wsBcBAABCAAQBQJiIxTDCRBK7hj4Ov3rIwAAFAMIAHJzk/4HqnsLTUKb/HcugEAG
 cZvhXRWHA5wIi7Bc340jpZLcmItt//cLM2S32s487R9P/NfHq6qFXFT/46L8wNvf
 hHn2hRaxRJy3esHNtQmtp0Ha6bwIymuugTTjNxIGNOaJ7P7WK0/jIJPzeZxdlKDw
 NXU4/jiSnMY19qdUCqZwyCf2GWyA/8w77KUZhMryYydq+hHF0b6p/212nNTaAosS
 dP/vx+afu17xf92c10gOtcBX7Jw6GZACfuo0KW06kJOErfVJwBWija6g+8slq3X0
 r/3yCYPxLzstlvlwo5hUhyyZAEwv4ZVAcdaSyrY/7kNg1/Xz7ROenfhuuyEPF7k=
 =chPk
 -----END PGP SIGNATURE-----
 

Remove git log strategy, walk commit tree directly (#3)


''';

var commitObject3 = '''
commit 561tree cfb23f74933941558825775968b6991c359d824e
author Nick Meinhold <nick@enspyr.co> 1646440991 +1100
committer Nick Meinhold <nick@enspyr.co> 1646440991 +1100

First commit.

Created a new project and added a CustomPainter.
Using Process.start to call "git log" worked after removing the mac
app sandbox.
Later we may want to build git alongside the app and restore the
sandbox for app distribution.
The Process.start seems to mess with the hot restart feature so for now
the app reads in an example output from "git log" while we work on
visualising the data.

''';
