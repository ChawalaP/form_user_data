import 'package:flutter/material.dart';
import '../display_name/display_name.dart';
import '../model/data.dart';

class Form_Page extends StatefulWidget {
  const Form_Page({Key? key, child}) : super(key: key);

  @override
  State<Form_Page> createState() => _Form_PageState();
}

class _Form_PageState extends State<Form_Page> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String nameForm;
  late int ageForm;
  late String genderForm;
  late String addressForm;
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final addressController = TextEditingController();
  List<Data> dataList = [];

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    nameController.dispose();
    ageController.dispose();
    genderController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form'), centerTitle: true),
      body: buildForm(context),
    );
  }

  Form buildForm(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameController,
                validator: (values) {
                  if (values == null || values.isEmpty) {
                    return 'กรอกข้อมูลให้ถูกต้อง';
                  } else {
                    nameForm = values;
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'ชื่อ',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: ageController,
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                validator: (values) {
                  if (values == null || values.isEmpty) {
                    return 'กรอกข้อมูลให้ถูกต้อง';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'อายุ',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: genderController,
                validator: (values) {
                  if (values == null || values.isEmpty) {
                    return 'กรอกข้อมูลให้ถูกต้อง';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'เพศ',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: addressController,
                validator: (values) {
                  if (values == null || values.isEmpty) {
                    return 'กรอกข้อมูลให้ถูกต้อง';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'ที่อยู่',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('บันทึกข้อมูลสำเร็จ')),
                    );
                    nameForm = nameController.text;
                    ageForm= int.parse(ageController.text);;
                    addressForm= addressController.text;
                    genderForm= genderController.text;
                    setState(() {
                      dataList.add(Data(name: nameForm,age: ageForm,gender: genderForm,address: addressForm));
                    });
                  }
                },
                child: const Text('ตกลง'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DisplayName(nameList: dataList),
                    ),
                  );
                },
                child: const Text('ดูรายชื่อทั้งหมด'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
