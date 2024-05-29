import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

//pantallas
import 'encuesta.dart';
import 'inicio.dart';
import 'asesoramiento.dart';
import 'diseno.dart';


class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    // Aquí colocas las instancias de tus pantallas
    // Por ejemplo:
    // HomeScreen(),
    // FavoriteScreen(),
    // SearchScreen(),
    // SettingsScreen(),
    Inicio(),
    Encuesta(),
    Diseno(),
    Asesoramiento(),

  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_selectedIndex], // Mostrar la pantalla actual según el índice seleccionado
        bottomNavigationBar: Container(
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            backgroundColor: Colors.white,
            color: Colors.orange,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.orangeAccent.shade200,
            gap: 4,
            onTabChange: _onTabSelected,
            padding: EdgeInsets.all(8),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Inicio",
              ),
              GButton(
                icon: Icons.invert_colors_on,
                text: "Encuesta",
              ),
              
              GButton(
                icon: Icons.image,
                text: "Diseño",
              ),
              GButton(
                icon: Icons.imagesearch_roller_rounded,
                text: "Interiores",
              ),
            ],
          )),
    ));
  }
}
