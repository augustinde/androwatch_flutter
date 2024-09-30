class OwHero {
  final String key;
  final String name;
  final String role;
  final String portrait;

  const OwHero({
    required this.key,
    required this.name,
    required this.role,
    required this.portrait,
  });

  factory OwHero.fromJson(Map<String, dynamic> json) {
    return switch(json) {
      {
        'key': String key,
        'name': String name,
        'role': String role,
        'portrait': String portrait,
      } =>
      OwHero(
        key: key,
        name: name,
        role: role,
        portrait: portrait,
      ),
      _ => throw const FormatException("Failed to load hero."),
    };
  }

}