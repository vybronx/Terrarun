import 'package:flutter/material.dart';

/// TERRARUN Rivals and Friend Discovery Screen.
class RivalsScreen extends StatefulWidget {
  const RivalsScreen({super.key});

  @override
  State<RivalsScreen> createState() => _RivalsScreenState();
}

class _RivalsScreenState extends State<RivalsScreen> {
  final TextEditingController _searchController = TextEditingController();

  void _onAddRivalTapped(String runnerName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Rival functionality for $runnerName will be available in a later milestone.'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rivals'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search Input Field
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search friends by username',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Find Runners Section
            Text(
              'Find Runners',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: theme.colorScheme.primaryContainer,
                      child: Icon(
                        Icons.person,
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Alex_Runner',
                            style: theme.textTheme.titleSmall,
                          ),
                          Text(
                            '12 Territory Claims • City Division',
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    FilledButton.tonal(
                      onPressed: () => _onAddRivalTapped('Alex_Runner'),
                      child: const Text('Add Rival'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Your Rivals Section
            Text(
              'Your Rivals',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.emoji_events_outlined,
                      size: 48,
                      color: theme.colorScheme.outline,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'No Active Rivals',
                      style: theme.textTheme.titleSmall,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Search for runners or explore overlapping territory areas to add rivals.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
