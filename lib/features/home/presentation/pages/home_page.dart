import 'package:flutter/material.dart';
import 'package:social_media_clone/features/home/presentation/components/my_drawer.dart';
import 'package:social_media_clone/features/post/presentation/pages/upload_post_page.dart';

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
        foregroundColor: Theme.of(context).colorScheme.secondary,
        centerTitle: true,
        actions: [
          // upload new post button
          IconButton(
            onPressed: () => Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => UploadPostPage(),
              )
            ), 
            icon: const Icon(Icons.add)
          )
        ],
        
      ),

      // DRAWER
      drawer: const MyDrawer(),
    );
  }
}