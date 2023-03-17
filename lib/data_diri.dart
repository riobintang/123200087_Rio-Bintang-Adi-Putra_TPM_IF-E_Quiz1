import 'package:flutter/material.dart';

class DataDiri extends StatelessWidget {
  const DataDiri({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20), 
          CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('images/rio_bintang.jpg'),
            ),
          SizedBox(height: 20),
          Text('Rio Bintang Adi Putra', style: TextStyle(fontSize: 20),),
           SizedBox(height: 10),
            Text(
              '123200087',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10,),
            Text('Teknologi Dan Pemrograman Mobile IF-E', style: TextStyle(fontSize:16),),
            SizedBox(height: 10,),
            Text('Hobi Bermain Basket', style: TextStyle(fontSize:16),),
        ],
      ),)
    );
  }

}
