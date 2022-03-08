import 'package:flutter/material.dart';
import '../../model/data.dart';

class Display_Detail extends StatefulWidget {
  const Display_Detail({Key? key, required this.data}) : super(key: key);

  final Data data;

  @override
  State<Display_Detail> createState() => _Display_DetailState();
}

class _Display_DetailState extends State<Display_Detail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('รายละเอียด'),),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(186, 230, 170, 1.0),
                    borderRadius: BorderRadius.circular(12.0)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(' ชื่อ : ${widget.data.getName()}\n อายุ : ${widget.data.getAge()}\n '
                          'เพศ : ${widget.data.getGender()}\n ที่อยู่ : ${widget.data.getAddress()}'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
