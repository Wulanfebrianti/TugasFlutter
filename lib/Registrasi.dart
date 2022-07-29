import 'package:flutter/material.dart';
import 'InputPhone.dart';
import 'kalkulator.dart';

class registrasi extends StatefulWidget {
  const registrasi({Key? key}) : super(key: key);

  @override
  _RegistrasiState createState() => _RegistrasiState();
}

class _RegistrasiState extends State<registrasi> {
  TextEditingController CtrNamaPanjang = new TextEditingController();
  TextEditingController CtrNamaPanggilan = new TextEditingController();
  String myPhone = "Phone";

  Widget TxtInput(String Username, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: Username,
      ),
    );
  }

  Widget btnRegister(String text) {
    return Container(
      width: 150,
      child: ElevatedButton(
          onPressed: () {
            if (CtrNamaPanggilan.text == "" || CtrNamaPanjang == "") {
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Kalkulator(
                        name: CtrNamaPanggilan.text,
                        phone: myPhone,
                      )));
            }
          },
          child: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registrasi")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TxtInput("NamaPanjang", CtrNamaPanjang),
            SizedBox(
              height: 10,
            ),
            TxtInput("NamaPanggilan", CtrNamaPanggilan),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 250,
                child: TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: myPhone,
                    labelStyle: TextStyle(color: Colors.blue),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InputPhone()),
                );
                setState(() {
                  myPhone = result.toString();
                });
              },
              child: Text("Masukan Nomor Anda"),
            ),
            btnRegister("Masuk")
          ],
        ),
      ),
    );
  }
}