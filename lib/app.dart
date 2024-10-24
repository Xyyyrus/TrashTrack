import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/pages/wrapper_page.dart';
import 'package:trashtrack_user/providers.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: Providers.getRepositoryProviders(),
      child: MultiBlocProvider(
        providers: Providers.getBlocProviders,
        child: MaterialApp(
          title: 'TrashTrack User',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
          ),
          home: const WrapperPage(),
        ),
      ),
    );
  }
}
