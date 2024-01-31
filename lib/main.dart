import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/firebase_options.dart';
import 'package:flutter_fitness_app/providers/auth_provider.dart';
import 'package:flutter_fitness_app/utils/routes/routes.dart';
import 'package:flutter_fitness_app/utils/routes/routes_name.dart';
import 'package:flutter_fitness_app/view/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: AuthProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.splashScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
