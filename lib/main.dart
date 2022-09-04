import 'package:dashboad/page/home.dart';
import 'package:fluent_ui/fluent_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Flutter Dashboad',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          cardColor: const Color.fromARGB(255, 50, 62, 90),
          micaBackgroundColor: const Color.fromARGB(255, 42, 54, 80),
          scaffoldBackgroundColor: const Color.fromARGB(255, 58, 71, 99)),
      theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'NotoSansLao',
          accentColor: Colors.orange,
          cardColor: Colors.white,
          micaBackgroundColor: const Color.fromARGB(255, 246, 250, 255),
          scaffoldBackgroundColor: const Color.fromARGB(255, 229, 229, 237)),
      home: const HomePage(),
    );
  }
}
