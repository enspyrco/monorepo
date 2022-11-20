// The Barycentric Method

import 'git/git_objects/commit.dart';
import 'git/git_objects/kinship.dart';

class Physics {
  Physics(
      {required this.width,
      required this.height,
      required Set<CommitVisual> vertexes,
      required Set<KinshipVisual> edges})
      : area = width * height,
        _vertexes = vertexes,
        _edges = edges;

  /// [width] and [height] are the dimensions of the frame
  int width;
  int height;
  int area;

  /// G := (V, E); {the vertices are assigned random initial positions}
  final Set<CommitVisual> _vertexes;
  final Set<KinshipVisual> _edges;

  // k := sqrt(area/|V|);
  late double k;

  /// The Barycentric Method

  applyForces() {
    // fa(x) => sq(x)/k;
    // fr(x) => sq(k)/x;
    // for i := 1 to iterations do begin
    // {calculate repulsive forces}
    // for v in V do begin
    // {each vertex has two vectors: .pos and .disp
    // v.disp := 0;
    // for u in V do
    // if (u 6= v) then begin
    // {δ is the difference vector between the positions of the two vertices}
    // δ := v.pos − u.pos;
    // v.disp := v.disp + (δ/|δ|) ∗ fr(|δ|)
    // end
    // end
    // {calculate attractive forces}
    // for e in E do begin
    // {each edges is an ordered pair of vertices .vand.u}
    // δ := e.v.pos − e.u.pos;
    // e.v.disp := e.v.disp − (δ/|δ|) ∗ fa(|δ|);
    // e.u.disp := e.u.disp + (δ/|δ|) ∗ fa(|δ|)
    // end
    // {limit max displacement to temperature t and prevent from displacement
    // outside frame}
    // for v in V do begin
    // v.pos := v.pos + (v.disp/|v.disp|) ∗ min(v.disp, t);
    // v.pos.x := min(W/2, max(−W/2, v.pos.x));
    // v.pos.y := min(L/2, max(−L/2, v.pos.y))
    // end
    // {reduce the temperature as the layout approaches a better configuration}
    // t := cool(t)
    // end
  }
}
