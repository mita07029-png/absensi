import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Pembuatan Variabel Yang Akan Dipakai
  TextEditingController inputNama = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("absensi"),
        backgroundColor: Color.fromARGB(0, 228, 238, 89),
      ),
      //Color.fromARGB( opacity, red, gren, blue)
      backgroundColor: Color.fromARGB(224, 241, 144, 201),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 300,
              // height: 300,
              color: Color.fromARGB(197, 107, 217, 250),
              child: TextField(
                // Dekorasi untuk Petunjuk Pengisian dan Garis
                decoration: InputDecoration(
                  hintText: 'Masukan Nama Kamu',
                  border: OutlineInputBorder(),
                ),
                // kontroller untuk
                controller: inputNama,
                // Ketika Dikirim nanti
                onSubmitted: (values) {
                  // isi blabla
                  inputNama.text = values;
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
          ),
          ElevatedButton(
            child: Text("Tampilkan Nama"),
            onPressed: () {
              print(inputNama.text);
            },
          ),
        ],
      ),
    );
  }
}