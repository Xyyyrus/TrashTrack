import 'package:flutter/material.dart';
import 'package:trashtrack_user/pages/protected/recycling/walkthrough_page.dart';

class OrganicWalkthrough extends StatelessWidget {
  const OrganicWalkthrough({super.key});

  @override
  Widget build(BuildContext context) {
    final List<WalkthroughStep> organicWasteSteps = [
      WalkthroughStep(
        title: 'Organic Collection',
        description: 'Gather all organic waste from households and businesses.',
        icon: Icons.eco,
      ),
      WalkthroughStep(
        title: 'Composting',
        description: 'Convert organic waste into compost for agricultural use.',
        icon: Icons.grass,
      ),
      WalkthroughStep(
        title: 'Distribution',
        description: 'Distribute the compost to farms and gardening centers.',
        icon: Icons.local_florist,
      ),
    ];

    return WalkthroughPage(
      title: 'Organic Waste',
      steps: organicWasteSteps,
    );
  }
}
