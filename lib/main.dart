import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_example/db/db_helper.dart';
import 'package:sqflite_example/pages/note_creation_page/note_creation_page.dart';
import 'package:sqflite_example/pages/note_creation_page/note_creation_page_bindings.dart';
import 'package:sqflite_example/pages/notes_page/notes_page.dart';
import 'package:sqflite_example/pages/notes_page/notes_page_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: false),
      initialRoute: "/",
      initialBinding: NotePageBindings(),
      getPages: [
        GetPage(
            name: "/",
            page: () => const NotesPage(),
            binding: NotePageBindings()),
        GetPage(
            name: "/create",
            page: () => const NoteCreationPage(),
            binding: NoteCreationPageBindings()),
      ],
    );
  }
}
