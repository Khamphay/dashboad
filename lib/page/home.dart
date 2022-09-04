import 'package:dashboad/screen/dashboad.dart';
import 'package:dashboad/source/src.dart';
import 'package:fluent_ui/fluent_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NavigationPaneItem> get menuItems => [
        PaneItem(
            icon: const Icon(FluentIcons.dashboard_add),
            title: const Text("Dashboard")),
        PaneItem(
            icon: const Icon(FluentIcons.shopping_cart),
            title: const Text("Shoping")),
        PaneItem(
            icon: const Icon(FluentIcons.order_lock),
            title: const Text("Stock")),
        PaneItem(
            icon: const Icon(FluentIcons.add), title: const Text("Import")),
      ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: NavigationView(
        appBar: NavigationAppBar(
            automaticallyImplyLeading: false,
            title: const Text('Dashboard',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            leading: isWinLinuxMac && width > 700
                ? const Icon(FluentIcons.dashboard_add, size: 35)
                : null,
            actions: IconButton(
                icon: const Icon(FluentIcons.signin, size: 20),
                onPressed: () {})),
        pane: NavigationPane(
            size: const NavigationPaneSize(openWidth: 200, openMaxWidth: 200),
            displayMode: isWinLinuxMac && width > 700
                ? PaneDisplayMode.auto
                : PaneDisplayMode.minimal,
            header: const Text("Menus",
                style: TextStyle(fontWeight: FontWeight.bold)),
            items: menuItems,
            footerItems: [
              PaneItem(
                  icon: const Icon(FluentIcons.settings),
                  title: const Text("Settings"))
            ]),
        content: NavigationBody(index: 0, children: const [DashboadScreen()]),
      ),
    );
  }
}
