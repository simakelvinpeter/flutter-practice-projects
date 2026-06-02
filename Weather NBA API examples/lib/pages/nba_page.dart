import 'package:flutter/material.dart';

import '../components/info_card.dart';
import '../models/nba_team.dart';
import '../services/nba_service.dart';

class NbaPage extends StatefulWidget {
  const NbaPage({super.key});

  @override
  State<NbaPage> createState() => _NbaPageState();
}

class _NbaPageState extends State<NbaPage> {
  final nbaService = NbaService();
  List<NbaTeam> teams = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchTeams();
  }

  Future<void> fetchTeams() async {
    setState(() => isLoading = true);
    final result = await nbaService.getTeams();
    setState(() {
      teams = result;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'NBA API',
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: isLoading && teams.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    children: teams
                        .map(
                          (team) => InfoCard(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.black,
                                  child: Text(
                                    team.name[0],
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${team.city} ${team.name}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text('${team.conference} Conference'),
                                    ],
                                  ),
                                ),
                                Text('${team.wins}-${team.losses}'),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isLoading ? null : fetchTeams,
              child: const Text('Refresh NBA Data'),
            ),
          ),
        ],
      ),
    );
  }
}
