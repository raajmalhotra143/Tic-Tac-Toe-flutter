import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/neon_theme.dart';

class ModeSelectionScreen extends StatelessWidget {
  const ModeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SELECT MODE')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _ModeCard(
              title: 'CAMPAIGN',
              subtitle: '45 Stages of increasing difficulty',
              icon: Icons.map,
              color: NeonColors.neonCyan,
              onTap: () => context.push('/stages'),
            ),
            const SizedBox(height: 20),
            _ModeCard(
              title: 'ONLINE',
              subtitle: 'Battle players worldwide',
              icon: Icons.public,
              color: NeonColors.neonMagenta,
              onTap: () => context.push('/matchmaking'),
            ),
            const SizedBox(height: 20),
            _ModeCard(
              title: 'VS AI',
              subtitle: 'Practice against the computer',
              icon: Icons.smart_toy,
              color: NeonColors.neonLime,
              onTap: () => context.push('/game/offline'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ModeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ModeCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: NeonEffects.neonBox(color: color, borderRadius: 16),
        child: Row(
          children: [
            Icon(icon, color: color, size: 40),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: color),
          ],
        ),
      ),
    );
  }
}
