import 'package:flutter/material.dart';
import 'package:trashtrack_user/pages/protected/recycling/walkthrough_page.dart';

class ElectronicWalkthrough extends StatelessWidget {
  const ElectronicWalkthrough({super.key});

  @override
  Widget build(BuildContext context) {
    final List<WalkthroughStep> electronicWasteSteps = [
      WalkthroughStep(
        title: 'E-Waste Collection',
        description: 'Collect electronic waste from consumers and businesses.',
        icon: Icons.devices,
      ),
      WalkthroughStep(
        title: 'Dismantling',
        description: 'Dismantle electronics to separate valuable components.',
        icon: Icons.build,
      ),
      WalkthroughStep(
        title: 'Recycling',
        description:
            'Recycle metals and other materials from electronic waste.',
        icon: Icons.recycling,
      ), //add another step by copying the recent WaklkthrougStep lang
    ];

    return WalkthroughPage(
      title: 'Electronic Waste',
      steps: electronicWasteSteps,
    );
  }
}
