import 'package:flutter/material.dart';

class Kalkulator extends StatefulWidget {
  const Kalkulator({Key? key, required this.name, required this.phone})
      : super(key: key);
  final String name, phone;


  @override
  State<Kalkulator> createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  TextEditingController angka1 = TextEditingController();
  TextEditingController angka2 = TextEditingController();
  num angkaa1 = 0;
  num angkaa2 = 0;
  num hasil = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kalkulator")),
      body: Container(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 8),
            child: Text(
              "Selamat Datang " + widget.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Text(widget.phone),
          Container(
            margin: EdgeInsets.all(12),
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  angkaa1 = num.parse(value);
                });
              },
              controller: angka1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Angka Pertama'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  angkaa2 = num.parse(value);
                });
              },
              controller: angka2,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Angka Kedua'),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            FloatingActionButton(
                onPressed: () {
                  setState(() {
                    hasil = angkaa1 + angkaa2;
                  });
                },
                child: const Icon(Icons.add)),
            FloatingActionButton(
                onPressed: () {
                  setState(() {
                    hasil = angkaa1 - angkaa2;
                  });
                },
                child: const Icon(Icons.remove)),
            FloatingActionButton(
                onPressed: () {
                  setState(() {
                    hasil = angkaa1 * angkaa2;
                  });
                },
                child: Text('X')),
            FloatingActionButton(
                onPressed: () {
                  setState(() {
                    hasil = angkaa1 / angkaa2;
                  });
                },
                child: Text('/')),
          ]),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
              vertical: 25,
            ),
            child: TextField(
              keyboardType: TextInputType.number,
              cursorColor: Colors.black,
              enabled: false,
              //enableInteractiveSelection: false,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: 'Hasil: $hasil',
                hintStyle: TextStyle(color: Colors.blue),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}