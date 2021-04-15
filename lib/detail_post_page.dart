import 'package:flutter/material.dart';

class DetailPostPage extends StatelessWidget {
  final dynamic document;

  DetailPostPage(this.document);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('둘러보기'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(document['userPhotoUrl']),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        document['email'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(document['displayName'])
                    ],
                  ),
                )
              ],
            ),
          ),
          Hero(
              tag: document['photoUrl'],
              child: Container(
                margin: EdgeInsets.all(10),
                child: Image.network(
                  document['photoUrl'],
                  fit: BoxFit.fill,
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(document['contents']),
          )
        ],
      ),
    ));
  }
}