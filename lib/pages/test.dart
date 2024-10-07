import 'package:flutter/material.dart';
import 'package:newbie/utils/app_res.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter layout demo'),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: const Center(
                      child: Text(
                    'Drawer Header',
                    style: TextStyle(color: Colors.white),
                  )),
                )),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Image.asset(AppRes.getImageRes('test1.jpg')),
          const Padding(
            padding: EdgeInsets.all(32.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Oeschinen Lake campground',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('Kandersteg, Switzerland')
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.deepOrange),
                    SizedBox(
                      width: 8,
                    ),
                    Text('41')
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'uilgfuuuuu uuuuuuuu uuuuuuu uuuuuuuu uuuuuuu uuuuuuuuu uuuuuuuuu uuuuuuuu uuuuuuuuu uuuuuuuuuu uuuuuuuuuu uuuuuuuuuu uuuuuuuuu uuuuuuuu uuuuuuu uuuuuuuuuuu uuuuuuuuuuuu uuuuuu,',
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
