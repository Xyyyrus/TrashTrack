import 'package:flutter/material.dart';
import 'package:trashtrack_user/pages/protected/recycling/walkthrough_page.dart';

class PaperWalkthrough extends StatelessWidget {
  const PaperWalkthrough({super.key});

  @override
  Widget build(BuildContext context) {
    final List<WalkthroughStep> paperWasteSteps = [
      WalkthroughStep(
        title: 'Paper Collection',
        description:
            'Collect all paper waste from offices and educational institutions.',
        icon: Icons.description,
      ),
      WalkthroughStep(
        title: 'Sorting',
        description: 'Sort paper waste by type and quality for recycling.',
        icon: Icons.sort,
      ),
      WalkthroughStep(
        title: 'Recycling',
        description: 'Reprocess sorted paper into new paper products.',
        icon: Icons.recycling,
      ),
    ];

    return WalkthroughPage(
      title: 'Paper Waste',
      steps: paperWasteSteps,
    );
  }
}
