import 'package:flutter/material.dart';
import 'package:team_dinner_ui/model/dinner.dart';

class TeamSplitSlider extends StatefulWidget {
  const TeamSplitSlider({Key? key}) : super(key: key);

  @override
  State<TeamSplitSlider> createState() => _TeamSplitSliderState();
}

class _TeamSplitSliderState extends State<TeamSplitSlider> {
  final List<Dinner> dinnerTeams = DinnerTeamLists;
  double selectedValue = 0.5;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        itemCount: dinnerTeams.length,
        itemBuilder: (context, index) {
          final dinnerTeam = dinnerTeams[index];
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: dinnerTeam.colors,
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        dinnerTeam.teams,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "\$${dinnerTeam.price}",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SliderTheme(
                data: SliderThemeData(
                  overlayShape: SliderComponentShape.noOverlay,
                  activeTrackColor: dinnerTeam.colors,
                  inactiveTrackColor: const Color.fromARGB(255, 55, 50, 88),
                  trackHeight: 18,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 14,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Slider(
                    min: 0,
                    max: 100,
                    thumbColor: const Color.fromARGB(255, 235, 191, 138),
                    value: dinnerTeam.price / 6,
                    onChanged: (double? newValue) {
                      setState(() {
                        dinnerTeam.price = newValue!;
                      });
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
