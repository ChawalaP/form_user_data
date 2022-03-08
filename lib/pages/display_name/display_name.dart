import 'package:collect_data/pages/model/data.dart';
import 'package:flutter/material.dart';
import '../display_detail/display_detail.dart';

class DisplayName extends StatefulWidget {

  const DisplayName({Key? key, required this.nameList}) : super(key: key);
  final List<Data> nameList;

  @override
  State<DisplayName> createState() => _DisplayNameState();
}

class _DisplayNameState extends State<DisplayName> {
  int count_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายชื่อทั้งหมด'),
      ),
      body: ListView.builder(
        itemCount: widget.nameList.length,
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
                      child: Text('${widget.nameList[index].getName()}'),
                    ),
                    const Spacer(),
                    IconButton(
                      tooltip: 'รายละเอียด',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Display_Detail(data: widget.nameList[index])
                          )
                        );
                      },
                      icon: const Icon(Icons.info_outline),
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
