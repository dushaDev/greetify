import 'package:flutter/material.dart';
import 'package:greetify/greetify.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Greetify Example',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.orange, // Matches the "Sun" theme
        scaffoldBackgroundColor: const Color(
          0xFFF5F5F5,
        ), // Light grey background
      ),
      home: const GreetifyShowcase(),
    );
  }
}

class GreetifyShowcase extends StatelessWidget {
  const GreetifyShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Greetify Playground"),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SectionHeader(title: "1. The Basics"),
            const ShowcaseCard(
              child: Greetify(
                name: "Dustin",
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const SectionHeader(title: "2. With Icon"),
            const ShowcaseCard(
              child: Greetify(
                name: "Mike",
                showIcon: true,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const SectionHeader(title: "3. Interactive (Tap Me!)"),
            ShowcaseCard(
              child: Greetify(
                name: "Robin",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                // --- INTERACTIVE FEATURES ---
                splashColor: Colors.orange.withAlpha(30),
                hoverColor: Colors.orange.withAlpha(10),
                onTap: () {
                  // Show a SnackBar when tapped
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("👋 You tapped the greeting!"),
                      backgroundColor: Colors.orange,
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            const SectionHeader(title: "4. Randomized & Custom"),
            const ShowcaseCard(
              child: Greetify(
                name: "Billy",
                randomize: true,
                customMorningMessages: [
                  "Let's write some code",
                  "Coffee time",
                  "Deploy to production",
                ],
                style: TextStyle(fontSize: 20, color: Colors.indigo),
              ),
            ),

            const SizedBox(height: 20),

            // A "Night Mode" example card
            const SectionHeader(title: "5. Dark Theme Simulation"),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E), // Dark background
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(20),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Center(
                child: Greetify(
                  name: "Steve",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white, // White text for dark mode
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- HELPER WIDGETS FOR UI ---

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}

class ShowcaseCard extends StatelessWidget {
  final Widget child;
  const ShowcaseCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(10),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(child: child),
    );
  }
}
