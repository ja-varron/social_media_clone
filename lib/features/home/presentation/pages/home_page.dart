import 'package:flutter/material.dart';
import 'package:social_media_clone/features/home/presentation/components/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // APPBAR
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        
      ),

      // DRAWER
      drawer: const MyDrawer(),
    );
  }
}