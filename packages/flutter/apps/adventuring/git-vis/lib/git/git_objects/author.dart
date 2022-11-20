class Author {
  Author(this.id, this.email, this.name);
  final String id;
  final String email;
  final String name;

  @override
  int get hashCode => Object.hash(id, email, name);

  @override
  bool operator ==(Object other) =>
      other is Author &&
      id == other.id &&
      email == other.email &&
      name == other.name;

  @override
  String toString() {
    return 'Author($id, $email, $name)';
  }
}
