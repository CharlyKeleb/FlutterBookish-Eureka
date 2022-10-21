import 'package:flutter/material.dart';
import 'package:flutter_web_projects/Theme/theme.dart';
import 'package:flutter_web_projects/book_app/views/book_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return Sizer(builder: (context, orientation, deviceType) {
      return ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Constants.appName,
          theme: themeData(Constants.lightTheme),
          home: const BookApp(),
        ),
      );
    });
  }
}

// Apply font to our app's theme
ThemeData themeData(ThemeData theme) {
  return theme.copyWith(
    textTheme: GoogleFonts.cormorantTextTheme(
      theme.textTheme,
    ),
  );
}
