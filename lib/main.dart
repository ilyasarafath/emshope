import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'utils/route_manager.dart';

void main() {
  runApp(const EmShopeApp());
}

class EmShopeApp extends StatelessWidget {
  const EmShopeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EmShope',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      initialRoute: RouteManager.home,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
