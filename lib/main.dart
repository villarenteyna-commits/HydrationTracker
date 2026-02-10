import 'package:flutter/material.dart';
//sigehahahaha
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Water Intake Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: const WaterIntakeScreen(),
    );
  }
}

class WaterIntakeScreen extends StatefulWidget {
  const WaterIntakeScreen({super.key});

  @override
  State<WaterIntakeScreen> createState() => _WaterIntakeScreenState();
}

class _WaterIntakeScreenState extends State<WaterIntakeScreen> {
  // ===============================
  // STATE VARIABLES
  // ===============================
  int glassesDrank = 5;          // int data type
  double dailyGoal = 8.0;        // double data type

  // ===============================
  // METHOD TO INCREMENT WATER INTAKE
  // ===============================
  void incrementWaterIntake() {
    setState(() {
      glassesDrank++;
    });
  }

  // ===============================
  // METHOD TO DECREMENT WATER INTAKE
  // ===============================
  void decrementWaterIntake() {
    if (glassesDrank > 0) {
      setState(() {
        glassesDrank--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ===============================
    // OPERATORS
    // ===============================
    int remainingGlasses = dailyGoal.toInt() - glassesDrank;
    bool goalReached = glassesDrank >= dailyGoal;
    double progressPercentage = glassesDrank / dailyGoal;

    // ===============================
    // COLOR VARIABLES
    // ===============================
    Color primaryColor = Colors.blue[800]!;
    Color accentColor = Colors.lightBlue[300]!;
    Color backgroundColor = Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: const Text("💧 Hydration Tracker"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.lightBlue[50]!,
              Colors.blue[100]!,
              Colors.lightBlue[200]!,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Progress Circle
                Container(
                  width: 200,
                  height: 200,
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Background circle
                      Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: primaryColor.withOpacity(0.2),
                            width: 10,
                          ),
                        ),
                      ),
                      // Progress circle
                      Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: SweepGradient(
                            colors: [
                              accentColor,
                              primaryColor,
                            ],
                            stops: [progressPercentage, progressPercentage],
                            startAngle: 0.0,
                            endAngle: 2 * 3.14159,
                          ),
                        ),
                      ),
                      // Inner circle with text
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: backgroundColor,
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$glassesDrank',
                              style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                            Text(
                              'of ${dailyGoal.toInt()}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              'glasses',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Percentage Text
                Text(
                  "${(progressPercentage * 100).toStringAsFixed(0)}% Complete",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),

                const SizedBox(height: 20),

                // Goal Status Message
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: goalReached
                        ? Colors.green[50]
                        : Colors.blue[50],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: goalReached
                          ? Colors.green[100]!
                          : Colors.blue[100]!,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        goalReached ? Icons.check_circle : Icons.water_drop,
                        color: goalReached ? Colors.green : primaryColor,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          goalReached
                              ? "🎉 Excellent! You've reached your daily goal!"
                              : "You need $remainingGlasses more glasses today",
                          style: TextStyle(
                            fontSize: 16,
                            color: goalReached ? Colors.green[800] : primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Water Icons Display
                Text(
                  "Today's Water Intake",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 15),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    dailyGoal.toInt(),
                        (index) => Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: index < glassesDrank
                            ? primaryColor
                            : Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.water_drop,
                          color: index < glassesDrank
                              ? Colors.white
                              : Colors.grey[400],
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Decrement Button
                    ElevatedButton(
                      onPressed: decrementWaterIntake,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: primaryColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: primaryColor, width: 2),
                        ),
                        elevation: 0,
                      ),
                      child: const Column(
                        children: [
                          Icon(Icons.remove, size: 28),
                          SizedBox(height: 4),
                          Text("Remove"),
                        ],
                      ),
                    ),

                    // Drink Water Button
                    ElevatedButton(
                      onPressed: incrementWaterIntake,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 8,
                        shadowColor: primaryColor.withOpacity(0.3),
                      ),
                      child: const Column(
                        children: [
                          Icon(Icons.local_drink, size: 32),
                          SizedBox(height: 8),
                          Text(
                            "Drink Water",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Reset Button
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          glassesDrank = 0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.grey[700],
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: Colors.grey[300]!, width: 2),
                        ),
                        elevation: 0,
                      ),
                      child: const Column(
                        children: [
                          Icon(Icons.refresh, size: 28),
                          SizedBox(height: 4),
                          Text("Reset"),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Tips Section
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.blue[100]!,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.lightbulb_outline,
                            color: Colors.amber[700],
                            size: 24,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Hydration Tips",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Drink water throughout the day, not all at once. "
                            "Carry a water bottle with you and set reminders to stay hydrated.",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}