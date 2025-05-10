import 'package:app_testing/models/album.dart';
import 'package:app_testing/repo/crud.dart';
import 'package:flutter/material.dart';

class DeleteAlbum extends StatefulWidget {
  const DeleteAlbum({super.key});

  @override
  State<DeleteAlbum> createState() => _DeleteAlbumState();
}

class _DeleteAlbumState extends State<DeleteAlbum> {
  late Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Delete Album')),
      body: _buildbody(context),
    );
  }

  Widget _buildbody(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(snapshot.data?.title ?? 'Delete'),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                      foregroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      setState(() {
                        futureAlbum = deleteAlbum(snapshot.data!.id.toString());
                      });
                    },
                    child: Text('Delete Data'),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Delete and again fetching",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(" it is giving 'null'"),
                ],
              );
            }
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
