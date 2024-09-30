class OwHero {
  final String key;
  final String name;
  final String role;

  const OwHero({
    required this.key,
    required this.name,
    required this.role,
  });

  String get getName => name;


  factory OwHero.fromJson(Map<String, dynamic> json) {
    return switch(json) {
      {
        'key': String key,
        'name': String name,
        'role': String role,
      } =>
      OwHero(
        key: key,
        name: name,
        role: role,
      ),
      _ => throw const FormatException("Failed to load hero."),
    };
  }

}