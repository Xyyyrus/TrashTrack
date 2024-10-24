import 'package:flutter/material.dart';
import 'package:trashtrack_user/pages/protected/recycling/walkthrough_page.dart';

class PlasticWalkthrough extends StatelessWidget {
  const PlasticWalkthrough({super.key});

  @override
  Widget build(BuildContext context) {
    final List<WalkthroughStep> plasticWasteSteps = [
      WalkthroughStep(
        title: 'Plastic Collection',
        description: 'Collect all plastic waste from designated areas.',
        icon: Icons.delete,
      ),
      WalkthroughStep(
        title: 'Sorting',
        description:
            'Sort plastic waste into different categories for recycling.',
        icon: Icons.sort,
      ),
      WalkthroughStep(
        title: 'Recycling Process',
        description: 'Process sorted plastics to create reusable materials.',
        icon: Icons.autorenew,
      ),
    ];

    return WalkthroughPage(
      title: 'Plastic Waste',
      steps: plasticWasteSteps,
    );
  }
}
