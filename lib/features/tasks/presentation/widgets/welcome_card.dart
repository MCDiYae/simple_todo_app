import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeCard extends StatelessWidget {
  final int completedCounter;
  final int pendingCounter;
  final int remindersCounter;

  const WelcomeCard({
    super.key,
    required this.completedCounter,
    required this.pendingCounter,
    required this.remindersCounter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(22),
          bottomRight: Radius.circular(22),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(1, 0),
          colors: [
            Color.fromARGB(255, 192, 244, 101),
            Color.fromARGB(255, 57, 149, 198),
          ],
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          // Image.asset(
          //   'assets/images/img_saly10.png',
          // ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi 👋',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Your day looks like this:',
                    style: GoogleFonts.roboto(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TasksCounterCard(
                    tasksCounter: pendingCounter,
                    typeTask: 'pending',
                    iconData: Icons.calendar_month_rounded,
                  ),
                  TasksCounterCard(
                    tasksCounter: completedCounter,
                    typeTask: 'completed',
                    iconData: Icons.check_circle,
                  ),
                  TasksCounterCard(
                    tasksCounter: remindersCounter,
                    typeTask: 'reminders',
                    iconData: Icons.check_circle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TasksCounterCard extends StatelessWidget {
  final int tasksCounter;
  final String typeTask;
  final IconData iconData;

  const TasksCounterCard({
    super.key,
    required this.tasksCounter,
    required this.typeTask,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        height: 36,
        width: 220,
        decoration: BoxDecoration(
          color: const Color(0xff00F0FF),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 5, 12, 7),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: Colors.white,
                size: 24,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '$tasksCounter tasks $typeTask',
                style: GoogleFonts.roboto(
                  color: const Color(0xff8C8C8C).withOpacity(0.8),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
