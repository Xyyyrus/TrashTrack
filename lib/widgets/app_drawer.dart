// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:trashtrack_user/blocs/auth/logout/logout_bloc.dart';
// import 'package:trashtrack_user/blocs/profile/get_profile/get_profile_bloc.dart';
// import 'package:trashtrack_user/blocs/route/get_routes/get_routes_bloc.dart';
// import 'package:trashtrack_user/helpers/message_dialog_helper.dart';
// import 'package:trashtrack_user/models/profile/profile.dart';
// import 'package:trashtrack_user/models/route/route.dart';
// import 'package:trashtrack_user/models/route/route.dart';
// import 'package:trashtrack_user/pages/protected/about/about_page.dart';
// import 'package:trashtrack_user/pages/protected/profile/edit_profile_page.dart';
// import 'package:trashtrack_user/pages/protected/settings/settings_page.dart';
// import 'package:trashtrack_user/widgets/custom_elevated_button.dart';
// import 'package:trashtrack_user/models/route/route.dart' as rm;
// import '../models/route/route.dart';

// class AppDrawer extends StatelessWidget {
//   const AppDrawer({super.key, required this.title});

//   final String title;

//   void _getProfileDetails(BuildContext context, rm.Route route) {
//     BlocProvider.of<GetProfileBloc>(context).add(GetProfileEvent(route.id));
//   }

//   Widget buildDrawerHeader(BuildContext context, Profile? profile) {
//     String displayName = profile != null
//         ? '${profile.firstname ?? ''} ${profile.lastname ?? ''}'.trim()
//         : 'User';
//     String displayMail = profile?.email?.trim() ?? 'user@example.com';

//     return UserAccountsDrawerHeader(
//       accountName: Text(displayName),
//       accountEmail: Text(displayMail),
//       decoration: const BoxDecoration(color: Color(0xFF02413C)),
//     );
//   }

//   BlocConsumer buildGetRoutesBC() {
//     return BlocConsumer<GetRoutesBloc, GetRoutesState>(
//       listener: (context, state) {
//         if (state is GetRoutesSuccessfulState && state.routes.isNotEmpty) {
//           _getProfileDetails(context, state.routes.first);
//         }
//       },
//       builder: (context, state) {
//         if (state is GetRoutesSuccessfulState) {
//           return buildGetProfileBC(state.routes);
//         } else if (state is GetRoutesErrorState) {
//           return Center(
//             child: Text(
//               state.message,
//               style: const TextStyle(fontSize: 17),
//             ),
//           );
//         } else {
//           return const Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }

//   BlocConsumer buildGetProfileBC(List<rm.Route> routes) {
//     return BlocConsumer<GetProfileBloc, GetProfileState>(
//       listener: (context, state) {
//         if (state is GetProfileSuccessfulState) {
//           Profile profile = state.profile;
//           if (profile.firstname == 'Firstname' &&
//               profile.lastname == 'Lastname') {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (BuildContext context) => EditProfilePage(
//                   profile: profile,
//                   routes: routes,
//                 ),
//               ),
//             );
//           }
//         }
//       },
//       builder: (context, state) {
//         if (state is GetProfileSuccessfulState) {
//           return buildDrawerHeader(context, state.profile);
//         } else if (state is GetProfileErrorState) {
//           return const UserAccountsDrawerHeader(
//             accountName: Text('Error loading profile'),
//             accountEmail: Text('user@example.com'),
//           );
//         } else {
//           return const UserAccountsDrawerHeader(
//             accountName: Text('Loading...'),
//             accountEmail: Text('user@example.com'),
//           );
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: <Widget>[
//           BlocBuilder<GetProfileBloc, GetProfileState>(
//             builder: (context, state) {
//               if (state is GetProfileSuccessfulState) {
//                 return buildDrawerHeader(context, state.profile);
//               } else if (state is GetProfileErrorState) {
//                 return const UserAccountsDrawerHeader(
//                   accountName: Text('Error loading profile'),
//                   accountEmail: Text('user@example.com'),
//                 );
//               } else {
//                 return const UserAccountsDrawerHeader(
//                   accountName: Text('Loading...'),
//                   accountEmail: Text('user@example.com'),
//                 );
//               }
//             },
//           ),
//           _buildDrawerItem(
//             icon: Icons.people,
//             text: 'Profile',
//             onTap: () {
//               final profileState = context.read<GetProfileBloc>().state;
//               final routesState = context.read<GetRoutesBloc>().state;

//               if (profileState is GetProfileSuccessfulState &&
//                   routesState is GetRoutesSuccessfulState) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (BuildContext context) => EditProfilePage(
//                       profile: profileState.profile,
//                       routes: routesState.routes,
//                     ),
//                   ),
//                 );
//               }
//             },
//           ),
//           _buildDrawerItem(
//             icon: Icons.settings,
//             text: 'Settings',
//             onTap: () => _navigateTo(context, const SettingsPage()),
//           ),
//           const Divider(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: buildLogoutBC(),
//           ),
//           const Spacer(),
//           const Divider(),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10.0),
//             child: _buildDrawerItem(
//               icon: Icons.info,
//               text: 'About App',
//               onTap: () => _navigateTo(context, const AboutPage()),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   BlocConsumer buildLogoutBC() {
//     return BlocConsumer<LogoutBloc, LogoutState>(
//       listener: (context, state) {
//         if (state is LogoutErrorState) {
//           MessageDialogHelper.showErrorDialog(
//             context,
//             'Logout Error',
//             state.message,
//           );
//         }
//       },
//       builder: (context, state) {
//         if (state is LogoutProcessingState) {
//           return const CircularProgressIndicator();
//         } else {
//           return buildLogoutButton(context);
//         }
//       },
//     );
//   }

//   Widget _buildDrawerItem({
//     required IconData icon,
//     required String text,
//     required VoidCallback onTap,
//   }) {
//     return ListTile(
//       leading: CircleAvatar(
//         backgroundColor: Colors.green.withOpacity(0.1),
//         child: Icon(icon, color: const Color(0xFF02413C)),
//       ),
//       title: Text(text),
//       onTap: onTap,
//     );
//   }

//   void _navigateTo(BuildContext context, Widget page) {
//     Navigator.pop(context);
//     Navigator.push(context, MaterialPageRoute(builder: (context) => page));
//   }

//   CustomElevatedButton buildLogoutButton(BuildContext context) {
//     return CustomElevatedButton(
//       onPressed: () => _signoutAuthAccount(context),
//       isExpanded: true,
//       labelText: 'Signout',
//       backgroundColor: Colors.red,
//     );
//   }

//   void _signoutAuthAccount(BuildContext context) {
//     BlocProvider.of<LogoutBloc>(context).add(LogoutAccountEvent());
//   }
// }
