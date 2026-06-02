class NbaTeam {
  const NbaTeam({
    required this.name,
    required this.city,
    required this.conference,
    required this.wins,
    required this.losses,
  });

  final String name;
  final String city;
  final String conference;
  final int wins;
  final int losses;
}
