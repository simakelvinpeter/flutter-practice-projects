import '../models/nba_team.dart';

class NbaService {
  Future<List<NbaTeam>> getTeams() async {
    await Future<void>.delayed(const Duration(milliseconds: 650));

    return const [
      NbaTeam(
        name: 'Lakers',
        city: 'Los Angeles',
        conference: 'West',
        wins: 50,
        losses: 32,
      ),
      NbaTeam(
        name: 'Warriors',
        city: 'Golden State',
        conference: 'West',
        wins: 46,
        losses: 36,
      ),
      NbaTeam(
        name: 'Celtics',
        city: 'Boston',
        conference: 'East',
        wins: 60,
        losses: 22,
      ),
      NbaTeam(
        name: 'Heat',
        city: 'Miami',
        conference: 'East',
        wins: 44,
        losses: 38,
      ),
    ];
  }
}
