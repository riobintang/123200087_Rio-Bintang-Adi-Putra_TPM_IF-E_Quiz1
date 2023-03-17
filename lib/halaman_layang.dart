import 'package:flutter/material.dart';

double luasLayang = 0;
double kelilingLayang = 0;

class HalamanLayang extends StatefulWidget {
  const HalamanLayang({Key? key}) : super(key: key);

  @override
  _HalamanLayang createState() => _HalamanLayang();
}

class _HalamanLayang extends State<HalamanLayang> {
  final TextEditingController _diagonal1Controller = TextEditingController();
  final TextEditingController _diagonal2Controller = TextEditingController();

  void _hitungLuasLayang() {
    double? diagonal1 = double.tryParse(_diagonal1Controller.text);
    double? diagonal2 = double.tryParse(_diagonal2Controller.text);

    diagonal1 ??= 0;
    diagonal2 ??= 0;
    setState(() {
      luasLayang = 0;
      if (diagonal1 == 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Diagonal 1 is Empty')));
      } else if (diagonal2 == 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Diagonal 2 is Empty')));
      } else {
        luasLayang = 1 / 2 * (diagonal1! * diagonal2!);
      }
      
      kelilingLayang = 0;
    });
  }

  void _hitungKelilingLayang() {
    double? diagonal1 = double.tryParse(_diagonal1Controller.text);
    double? diagonal2 = double.tryParse(_diagonal2Controller.text);

    diagonal1 ??= 0;
    diagonal2 ??= 0;

    setState(() {
      kelilingLayang = 0;
      luasLayang = 0;
      if (diagonal1 == 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Diagonal 1 is Empty')));
      } else if (diagonal2 == 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Diagonal 2 is Empty')));
      } else {
        kelilingLayang = 2 * (diagonal1! + diagonal2!);
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Halaman Layang-layang'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _diagonal1Controller,
                decoration: const InputDecoration(
                  labelText: "Diagonal 1",
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _diagonal2Controller,
                decoration: const InputDecoration(
                  labelText: "Diagonal 2",
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
                      onPressed: _hitungLuasLayang,
                      child: Text('Hitung Luas Layang-layang')),
                  ElevatedButton(
                      onPressed: _hitungKelilingLayang,
                      child: Text('Hitung Keliling Layang-layang')),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Luas Layang-layang: $luasLayang",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Keliling Layang-layang: $kelilingLayang",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
