class Actor {
  final int id;
  final String name;
  final String photoPath;
  final String? character;

  Actor({
    required this.id,
    required this.name,
    required this.photoPath,
    this.character,
  });
}
