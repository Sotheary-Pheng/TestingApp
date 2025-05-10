import 'package:app_testing/models/album.dart';
import 'package:app_testing/repo/crud.dart';
import 'package:flutter/material.dart';

class Viewalbum extends StatefulWidget {
  const Viewalbum({super.key});

  @override
  State<Viewalbum> createState() => _ViewalbumState();
}

class _ViewalbumState extends State<Viewalbum> {
  late Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('View Album')),
      body: _buildbody(context),
    );
  }

  Widget _buildbody(BuildContext context) {
    return Center(
      child: FutureBuilder<Album>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.title);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
