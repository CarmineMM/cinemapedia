class Actor {
  final int id;
  final String name;
  final String originalName;
  final String profilePath;
  final String? character;

  Actor({
    required this.id,
    required this.name,
    required this.originalName,
    required this.profilePath,
    this.character,
  });
}
