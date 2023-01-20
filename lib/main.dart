import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_hassnain/list_screen.dart';
import 'package:task_hassnain/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UsersProvider())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ListScreen(),
      ),
    );
  }
}
