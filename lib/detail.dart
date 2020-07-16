import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String nama, gambar;
  Detail(this.nama, this.gambar);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 240.0,
            child: Hero(
              tag: nama,
              child: Material(
                child: InkWell(
                  child: Image.asset('img/$gambar', fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          // bagian nama
          SectionName(nama),
          // bagian icon
          SectionIcon(),
          // bagian detail keterangan
          SectionDetail()
        ],
      ),
    );
  }
}

// bagian nama dan email
class SectionName extends StatelessWidget {
  final String nama;
  SectionName(this.nama);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            // melebarkan area kolom
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(nama,
                    style: TextStyle(fontSize: 20.0, color: Colors.blue)),
                Text('$nama\@gmail.com',
                    style: TextStyle(fontSize: 20.0, color: Colors.grey)),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Icon(Icons.star, size: 25.0, color: Colors.red),
              Text('12', style: TextStyle(fontSize: 18.0))
            ],
          )
        ],
      ),
    );
  }
}

// bagian icon
class SectionIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: <Widget>[
          IconText(Icons.call, 'CAll'),
          IconText(Icons.message, 'Message'),
          IconText(Icons.photo, 'Photos'),
        ],
      ),
    );
  }
}

// kolom icon
class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  IconText(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(icon, size: 50.0, color: Colors.blue),
          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(text, style: TextStyle(fontSize: 18.0, color: Colors.blue))
        ],
      ),
    );
  }
}

class SectionDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
            style: TextStyle(
              fontSize: 18.0,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
