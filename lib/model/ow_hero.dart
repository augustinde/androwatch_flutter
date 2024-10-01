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

class OwHeroDetails{
  final String name;
  final String description;
  final String role;
  final String location;
  final String portrait;
  final List<OwHeroAbility> abilities;

  const OwHeroDetails({
    required this.name,
    required this.description,
    required this.role,
    required this.location,
    required this.portrait,
    required this.abilities,
  });

  factory OwHeroDetails.fromJson(Map<String, dynamic> json) {
    return switch(json) {
      {
        'name': String name,
        'description': String description,
        'role': String role,
        'location': String location,
        'portrait': String portrait,
        'abilities': List abilities,
      } =>
      OwHeroDetails(
        name: name,
        description: description,
        role: role,
        location: location,
        portrait: portrait,
        abilities: abilities
            .map((ability) => OwHeroAbility.fromJson(ability))
            .toList(),
      ),
      _ => throw const FormatException("Failed to load hero details."),
    };
  }
}

class OwHeroAbility {
  final String name;
  final String description;
  final String icon;

  const OwHeroAbility({
    required this.name,
    required this.description,
    required this.icon,
  });

  factory OwHeroAbility.fromJson(Map<String, dynamic> json) {
    return switch(json) {
      {
        'name': String name,
        'description': String description,
        'icon': String icon,
      } =>
      OwHeroAbility(
        name: name,
        description: description,
        icon: icon,
      ),
      _ => throw const FormatException("Failed to load ability."),
    };
  }
}