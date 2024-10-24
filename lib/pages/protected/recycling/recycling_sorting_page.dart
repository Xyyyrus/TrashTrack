import 'package:flutter/material.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/waste_button.dart';
import 'plastic_walkthrough.dart';
import 'organic_walkthrough.dart';
import 'paper_walkthrough.dart';
import 'electronic_walkthrough.dart';

class RecyclingPage extends StatelessWidget {
  const RecyclingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Select Waste Type",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: [
                  WasteButton(
                    title: 'Plastic Waste',
                    icon: Icons.delete,
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PlasticWalkthrough(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  WasteButton(
                    title: 'Organic Waste',
                    icon: Icons.eco,
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OrganicWalkthrough(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  WasteButton(
                    title: 'Paper Waste',
                    icon: Icons.description,
                    color: Colors.orange,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaperWalkthrough(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  WasteButton(
                    title: 'Electronic Waste',
                    icon: Icons.devices,
                    color: Colors.red,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ElectronicWalkthrough(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
