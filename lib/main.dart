import 'package:figma/PAGES/function.dart';
import 'package:figma/PAGES/montra.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'PAGES/firebase_options.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  try {
   
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print(e);
  }
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Functions())],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: montra()),
    );
  }
}
