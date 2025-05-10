import 'package:app_testing/create_view.dart';
import 'package:app_testing/models/album.dart';
import 'package:app_testing/repo/crud.dart';
import 'package:app_testing/screens/delete_album.dart';
import 'package:app_testing/screens/update_album.dart';
import 'package:app_testing/viewalbum.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Viewalbum()),
              );
            },
            child: Text('View Album'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateView()),
              );
            },
            child: Text('Create Album'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpdateAlbum()),
              );
            },
            child: Text('Update Album'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DeleteAlbum()),
              );
            },
            child: Text('Delete Album'),
          ),
        ],
      ),
    );
  }
}
