import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trashtrack_user/helpers/message_dialog_helper.dart';
// import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  /// Builds a centered section title with styling
  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
    );
  }

  /// Builds a divider with padding
  Widget buildSectionDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Divider(
        color: Colors.grey,
        thickness: 1,
      ),
    );
  }

  /// this supposed to launch URL but idk why ayaw
  // Future<void> _launchUrl(String url, BuildContext context) async {
  //   if (await canLaunchUrl(Uri.parse(url))) {
  //     await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  //   } else {
  //     MessageDialogHelper.showErrorDialog(
  //       context,
  //       'Error',
  //       'Could not open the website.',
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About TrashTrack'),
        backgroundColor: const Color(0xFF02413C),
      ),
      body: SingleChildScrollView(
        // Ensures content is scrollable if it overflows
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Contact Information Section
              buildSectionTitle('Contact Information Of CEMD Office'),
              const SizedBox(height: 8),
              ListTile(
                leading: const Icon(Icons.mail, color: Colors.blue),
                title: const Text('Yahoo'),
                subtitle: const Text('Jtm_jps@yahoo.com'),
                onTap: () {
                  const email = 'Jtm_jps@yahoo.com';
                  MessageDialogHelper.showSuccessDialog(
                    context,
                    'Email Copied',
                    'The email address $email has been copied to your clipboard.',
                  );

                  // Copy email to clipboard
                  Clipboard.setData(const ClipboardData(text: email));
                },
              ),
              ListTile(
                leading: const Icon(Icons.phone, color: Colors.green),
                title: const Text('Phone'),
                subtitle: const Text('09560654888'),
                onTap: () {
                  const phone = '09560654888';
                  MessageDialogHelper.showSuccessDialog(
                    context,
                    'Phone Number Copied',
                    'Phone number has been copied to your clipboard.',
                  );

                  // Copy phone number to clipboard
                  Clipboard.setData(const ClipboardData(text: phone));
                },
              ),
              ListTile(
                leading: const Icon(Icons.facebook, color: Colors.blue),
                title: const Text('Facebook'),
                subtitle: const Text('Jasper Takeda Manabat'),
                onTap: () {
                  const facebook = 'Jasper Takeda Manabat';
                  MessageDialogHelper.showSuccessDialog(
                    context,
                    'Facebook Account Copied',
                    'Facebook account name has been copied to your clipboard.',
                  );
                  Clipboard.setData(const ClipboardData(text: facebook));
                },
              ),
              ListTile(
                leading: const Icon(Icons.phone,
                    color: Color.fromARGB(255, 123, 16, 165)),
                title: const Text('Viber'),
                subtitle: const Text('Repsaj Tabanam'),
                onTap: () {
                  const vibe = 'Repsaj Tabanam';
                  MessageDialogHelper.showSuccessDialog(
                    context,
                    'Viber Name Copied',
                    'Viber contact detail has been copied to your clipboard.',
                  );
                  Clipboard.setData(const ClipboardData(text: vibe));
                },
              ),
              ListTile(
                leading: const Icon(Icons.web, color: Colors.orange),
                title: const Text('Website'),
                subtitle: const Text('Website'),
                onTap: () {
                  const vibe = 'https://trashtrack-ac6eb.web.app/';
                  MessageDialogHelper.showSuccessDialog(
                    context,
                    'Website Copied',
                    'Website has been copied to your clipboard.',
                  );
                  Clipboard.setData(const ClipboardData(text: vibe));
                },
              ),
              // ListTile(
              //   leading: const Icon(Icons.web, color: Colors.orange),
              //   title: const Text('Website'),
              //   subtitle: const Text('https://trashtrack-ac6eb.web.app/'),
              //   onTap: () =>
              //       _launchUrl('https://trashtrack-ac6eb.web.app/', context),
              // ),
              buildSectionDivider(),

              // About This App Section
              buildSectionTitle('About The App'),
              const SizedBox(height: 8),
              const Text(
                'This application was developed by a dedicated student from National University Manila. It represents a collaborative effort with the City Environment and Management Department (CEMD) of Mandaluyong City, aiming to enhance waste management and environmental sustainability.',
                style: TextStyle(fontSize: 16),
              ),
              buildSectionDivider(),

              // Acknowledgements Section
              buildSectionTitle('Acknowledgements'),
              const SizedBox(height: 8),
              const Text(
                'Special thanks to the mentors and contributors who guided the development of this app, and to CEMD Mandaluyong for their invaluable partnership and support.',
                style: TextStyle(fontSize: 16),
              ),
              buildSectionDivider(),

              // About the Developer Section
              buildSectionTitle('About the Developer'),
              const SizedBox(height: 8),
              const Text(
                'The developer of this app is a dedicated student at National University Manila, committed to using technology for social good. This project is part of a larger effort to contribute to sustainable practices in urban environments.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              buildSectionTitle('Developers Contact Email'),
              const SizedBox(height: 8),
              ListTile(
                leading: const Icon(Icons.mail, color: Colors.blue),
                title: const Text('Project Manager '),
                subtitle: const Text('Esprajn@students.national-u.edu.ph'),
                onTap: () {
                  const email = 'Esprajn@students.national-u.edu.ph';
                  MessageDialogHelper.showSuccessDialog(
                    context,
                    'Email Copied',
                    'The email address $email has been copied to your clipboard.',
                  );

                  // Copy email to clipboard
                  Clipboard.setData(const ClipboardData(text: email));
                },
              ),
              buildSectionDivider(),
            ],
          ),
        ),
      ),
    );
  }
}
