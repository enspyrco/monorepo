import 'dart:math';
import 'dart:ui';

import 'package:git_vis/git_objects/author.dart';

import '../visualisation/area_visual.dart';
import '../visualisation/visual_object.dart';

class Commit {
  ///
  Commit.from(String hash, String objectString) {
    /// A hash of the directory containing the files for this commit.
    String tree;

    /// TODO: We need to both committer and... the other one.
    Author author = Author('id', 'email', 'name');

    /// Signed commits included a PGP Signature in the commit object string.
    String? pgpSignature;

    /// The one line summary in the commit message.
    String summary = 'summary';

    /// The rest of the commit message.
    String body = 'body';

    /// The hash values for this commit's parent commits.
    Set<String> parents = {};

    var lines = objectString.split('\n');

    // The first line takes the form "commit {size}\0tree {tree_sha}"
    var firstLine = lines.removeAt(0);
    var firstLineParts = firstLine.split('\u0000');
    var firstLineCommitPart = firstLineParts.first;
    if (firstLineCommitPart.split(' ').first != 'commit') throw 'Not a commit';
    var firstLineTreePart = firstLineParts.last;
    tree = firstLineTreePart.split(' ').last;

    while (lines.isNotEmpty) {
      var line = lines.removeAt(0);
      var parts = line.split(' ');
      if (parts.first == 'parent') {
        parents.add(parts.last);
      } else if (parts.first == 'author') {
        // eg. author Nick Meinhold <nick@enspyr.co> 1646475507 +1100
        parts.removeAt(0);
        var nameParts = <String>[];
        for (String part in parts) {
          if (part.startsWith('<') && part.endsWith('>')) {
            author = Author(
                '-', part.substring(1, part.length - 1), nameParts.join(' '));
            break;
          } else {
            nameParts.add(part);
          }
        }
      } else if (parts.first == 'gpgsig') {
        lines.insert(0, parts.sublist(1).join(' '));
        pgpSignature = _removePgp(lines);
      } else if (parts.first == '' && lines.isNotEmpty) {
        summary = lines.removeAt(0);
        if (lines.isNotEmpty) {
          lines.removeAt(0);
          body = lines.join('\n').trimRight();
          lines = [];
        }
      }
    }

    _state = CommitState(hash, tree, parents, author, 'date', summary, body,
        pgpSignature: pgpSignature);
  }

  late final CommitState _state;

  CommitState get state => _state;
  CommitVisual createVisual(AreaVisual area) =>
      CommitVisual(_state, initialPosition: _randomPositionIn(area));

  Offset _randomPositionIn(AreaVisual area) => Offset(
      Random().nextDouble() * area.rect.right,
      Random().nextDouble() * area.rect.bottom);

  // assumes signature is 10 lines and just joins those lines for now
  // we need to improved this
  // - the OpenPGP Message Format
  //   - https://datatracker.ietf.org/doc/html/rfc4880
  //
  String _removePgp(List<String> lines) {
    var pgpSignature = lines.sublist(0, 11).join('\n');
    lines.removeRange(0, 11);
    return pgpSignature;
  }
}

class CommitState {
  CommitState(this.hash, this.tree, this.parents, this.author, this.date,
      this.summary, this.body,
      {this.pgpSignature});

  // SHA of this commit
  final String hash;
  // SHA of the tree object this commit points to (tree = folder)
  final String tree;
  // Optional list of parent commits
  final Set<String> parents;
  final Author author;
  final String date;
  final String? pgpSignature;
  final String summary;
  final String body;

  @override
  String toString() {
    var output = '';
    output += '    tree: $tree\n';
    output += '    parents: $parents\n';
    output += '    author: $author\n';
    output += '    summary: $summary\n';
    output += '    body: $body\n';
    output += '    pgp: $pgpSignature\n';
    return output;
  }
}

class CommitVisual extends VisualObject {
  CommitVisual(CommitState state, {Offset? initialPosition})
      : _pos = initialPosition ?? const Offset(20, 20);

  final _paint = Paint()..color = const Color(0xFF009AAA);
  final _radius = 10.0;
  Offset _pos;

  Offset get pos => _pos;

  @override
  void paintOnto(Canvas canvas) => canvas.drawCircle(_pos, _radius, _paint);

  @override
  void moveForwardInTimeBy(double dt) {
    _pos = Offset(_pos.dx, _pos.dy + dt * 10);
  }
}
