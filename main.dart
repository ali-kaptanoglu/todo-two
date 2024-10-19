import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HabitKitApp()));
}

class Habit {
  final String name;
  final String description;
  final String icon;
  final Color color;
  final int progress;

  Habit({
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    required this.progress,
  });
}

class HabitKitApp extends StatelessWidget {
  final List<Habit> habits = [
    Habit(name: 'Walk around the block', description: 'Go for a short walk to clear the mind', icon: '🚶', color: Colors.green, progress: 100),
    Habit(name: 'Learn Norwegian', description: 'Three lessons per day', icon: 'Az', color: Colors.purple, progress: 80),
    Habit(name: 'Eat a piece of fruit', description: 'Stay healthy and don\'t overeat', icon: '🍎', color: Colors.red, progress: 60),
    Habit(name: 'Stretch for 5 minutes', description: 'Improve flexibility and relax muscles', icon: '🧘', color: Colors.orange, progress: 40),
    Habit(name: 'Deep breathing exercise', description: 'Calm your mind with a quick exercise', icon: '🍃', color: Colors.teal, progress: 20),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildHeader(),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: habits.length,
                  itemBuilder: (context, index) => HabitCard(habit: habits[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('10:20', style: TextStyle(color: Colors.white, fontSize: 18)),
        Row(
          children: [
            Icon(Icons.settings, color: Colors.grey),
            SizedBox(width: 10),
            Text('HabitKit', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(width: 10),
            Icon(Icons.bar_chart, color: Colors.grey),
          ],
        ),
        Icon(Icons.add, color: Colors.grey),
      ],
    );
  }
}

class HabitCard extends StatelessWidget {
  final Habit habit;

  HabitCard({required this.habit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(habit.icon, style: TextStyle(fontSize: 24)),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(habit.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      Text(habit.description, style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ],
              ),
              habit.progress == 100
                  ? Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.check, color: Colors.white, size: 16),
                    )
                  : Icon(Icons.add, color: Colors.grey),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: List.generate(
              10,
              (index) => Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  height: 6,
                  decoration: BoxDecoration(
                    color: index < (habit.progress / 10)
                        ? habit.color.withOpacity(1.0)
                        : habit.color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
