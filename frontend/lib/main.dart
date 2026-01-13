import 'package:flutter/material.dart';

void main() {
  runApp(const ApniNotesApp());
}

class ApniNotesApp extends StatelessWidget {
  const ApniNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ApniNotes Professional',
      debugShowCheckedModeBanner: false,
      // Use a consistent brand color for a professional look
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea ensures your app doesn't go under the status bar or iPhone notch
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // If width is less than 600, show mobile layout (Android/iPhone)
            if (constraints.maxWidth < 600) {
              return const MobileLayout();
            } else {
              // Show tablet/web layout (iPad/Desktop)
              return const TabletLayout();
            }
          },
        ),
      ),
    );
  }
}

/// --- MOBILE LAYOUT (Target: Android & iPhone) ---
class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "My Professional Notes",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => Card(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: ListTile(
                title: Text("Professional Note ${index + 1}"),
                subtitle: const Text("Tapped from an iPhone/Android view"),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// --- TABLET/WEB LAYOUT (Target: iPad/Brave Browser) ---
class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Sidebar for Tablet/Web
        NavigationRail(
          extended: true,
          destinations: const [
            NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
            NavigationRailDestination(icon: Icon(Icons.note), label: Text('Notes')),
            NavigationRailDestination(icon: Icon(Icons.settings), label: Text('Settings')),
          ],
          selectedIndex: 0,
        ),
        const VerticalDivider(thickness: 1, width: 1),
        // Main Content Area
        const Expanded(
          child: Center(
            child: Text("Expanded iPad/Tablet Dashboard Content"),
          ),
        ),
      ],
    );
  }
}
