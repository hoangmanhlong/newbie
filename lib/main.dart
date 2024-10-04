import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newbie/repository/app_repository.dart';

import 'data/photo.dart';

void main() => runApp(const App());

Future<List<Photo>> fetchPhotosFuture() =>
    AppRepository().fetchPhotos(Client());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
            useMaterial3: true),
        home: const Main(),
        debugShowCheckedModeBanner: false);
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LongDZ'),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        body: FutureBuilder(
            future: fetchPhotosFuture(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PhotoList(photos: snapshot.data!);
              } else if (snapshot.hasError) {
                return const Center(child: Text('No data'));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}

class PhotoList extends StatelessWidget {
  final List<Photo> photos;

  const PhotoList({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) => CachedNetworkImage(
        imageUrl: photos[index].url!,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
      itemCount: photos.length,
    );
  }
}
