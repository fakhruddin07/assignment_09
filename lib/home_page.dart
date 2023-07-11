import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Weather"),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.settings),),
          IconButton(onPressed: (){}, icon: const Icon(Icons.add),),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: []

          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Cumilla"),
            Text("Updated: 10:30 pm"),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network("https://th.bing.com/th/id/OIP.PcX5mOVMNF6P3LafvjBAUQHaE7?pid=ImgDet&rs=1", height: 100,),
                Text("7°C"),
              ],
            ),
            Text("Cloudy"),
          ],
        ),
      ),
    );
  }
}
