import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack/screens/canteen.dart';
import 'package:hack/screens/main_screen.dart';
import 'package:hack/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> widget_list = [
    MainScreen(),
    const CanteenScreen(),
    SettingsScreen(),
  ];
  final List<String> title_name = [
    "Home",
    "Canteen",
    "Events",
    "Orders",
    "Settings",
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextStyle titleStyle = GoogleFonts.poppins(
      fontSize: size.width * 0.04,
      fontWeight: FontWeight.w600,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title_name[selectedIndex],
          style: GoogleFonts.poppins(
            fontSize: size.width * 0.056,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          print(value);
          setState(() {
            selectedIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            title: Text("Canteen"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text("Wishlist"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.replay_outlined),
            title: Text("Orders"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
          ),
        ],
      ),
      body: widget_list[selectedIndex],
    );
  }
}
