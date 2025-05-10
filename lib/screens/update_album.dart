import 'package:app_testing/models/album.dart';
import 'package:app_testing/repo/crud.dart';
import 'package:flutter/material.dart';

class UpdateAlbum extends StatefulWidget {
  const UpdateAlbum({super.key});

  @override
  State<UpdateAlbum> createState() => _UpdateAlbumState();
}

class _UpdateAlbumState extends State<UpdateAlbum> {
  final TextEditingController _controller = TextEditingController();
  late Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Album')),
      body: _buildbody(context),
    );
  }

  Widget _buildbody(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<Album>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(snapshot.data!.title),
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Enter Title'),
                  ),
                  ElevatedButton(
                    child: const Text('Uppdate Date'),
                    onPressed: () {
                      setState(() {
                        futureAlbum = udateAlbum(_controller.text);
                      });
                    },
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
