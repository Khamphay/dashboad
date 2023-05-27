import 'package:dashboad/screen/dashboad.dart';
import 'package:dashboad/screen/user.dart';
import 'package:dashboad/source/src.dart';
import 'package:fluent_ui/fluent_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  List<NavigationPaneItem> get menuItems => [
        PaneItem(
            icon: const Icon(FluentIcons.dashboard_add),
            title: const Text("Dashboard"),
            body: const SizedBox()),
        PaneItem(
            icon: const Icon(FluentIcons.shopping_cart),
            title: const Text("Shoping"),
            body: const SizedBox()),
        PaneItem(
            icon: const Icon(FluentIcons.order_lock),
            title: const Text("Stock"),
            body: const SizedBox()),
        PaneItem(
            icon: const Icon(FluentIcons.add),
            title: const Text("Import"),
            body: const SizedBox()),
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
            selected: index,
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
                  title: const Text("Settings"),
                  body: const SizedBox())
            ],
            onChanged: (int index) => setState(() {
                  this.index = index;
                })),
        paneBodyBuilder: (item, child) {
          final name =
              item?.key is ValueKey ? (item!.key as ValueKey).value : null;
          return FocusTraversalGroup(
            key: ValueKey('body$name'),
            child: const DashboadScreen(),
          );
        },
      ),
    );
  }
}
