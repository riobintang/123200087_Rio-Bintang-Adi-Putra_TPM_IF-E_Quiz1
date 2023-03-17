import 'package:flutter/material.dart';

double luasSegitiga = 0;
double kelilingSegitiga = 0;

class HalamanSegitiga extends StatefulWidget {
  const HalamanSegitiga({Key? key}) : super(key: key);

  @override
  _HalamanSegitiga createState() => _HalamanSegitiga();
}

class _HalamanSegitiga extends State<HalamanSegitiga> {
  final TextEditingController _alasController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();
  final TextEditingController _miring1Controller = TextEditingController();
  final TextEditingController _miring2Controller = TextEditingController();

  void _hitungLuasSegitiga() {
    double? alas = double.tryParse(_alasController.text);
    double? tinggi = double.tryParse(_tinggiController.text);

    alas ??= 0;
    tinggi ??= 0;

    setState(() {
      kelilingSegitiga = 0;
      luasSegitiga = 0;
      if (alas == 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Alas is Empty')));
      } else if (tinggi == 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Tinggi is Empty')));
      } else {
        luasSegitiga = (alas! * tinggi!) / 2;
      }
    });
  }

  void _hitungKelilingSegitiga() {
    double? miring1 = double.tryParse(_miring1Controller.text);
    double? miring2 = double.tryParse(_miring2Controller.text);
    double? alas = double.tryParse(_alasController.text);

    miring1 ??= 0;
    miring2 ??= 0;
    alas ??= 0;

    setState(() {
      kelilingSegitiga = 0;
      luasSegitiga = 0;
      if (alas == 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Alas is Empty')));
      } else if (miring1 == 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Miring 1 is Empty')));
      } else if (miring2 == 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Miring 2 is Empty')));
      } else {
        kelilingSegitiga = (miring1! + miring2! + alas!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Segitiga'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: _alasController,
            decoration: const InputDecoration(
              labelText: "Masukkan nilai alas",
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _tinggiController,
            decoration: const InputDecoration(
              labelText: "Masukkan nilai tinggi",
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _miring1Controller,
            decoration: const InputDecoration(
              labelText: "Masukkan nilai miring 1",
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _miring2Controller,
            decoration: const InputDecoration(
              labelText: "Masukkan nilai miring 2",
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: _hitungLuasSegitiga,
                  child: Text('Hitung Luas Segitiga')),
              ElevatedButton(
                  onPressed: _hitungKelilingSegitiga,
                  child: Text('Hitung Keliling Segitiga')),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Luas Segitiga: $luasSegitiga",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Keliling Segitiga: $kelilingSegitiga",
                style: TextStyle(fontSize: 20),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
