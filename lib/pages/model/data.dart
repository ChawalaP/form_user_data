class Data {
  String? name;
  int? age;
  String? gender;
  String? address;

  Data({
    this.name,
    this.age,
    this.address,
    this.gender,
  });

  Data.empty(){
    this.name = '';
    this.age = 0;
    this.address= '';
    this.gender= '';
  }

  void add(String name, int age, String gender, String address){
    this.name = name;
    this.age = age;
    this.gender = gender;
    this.address = address;
  }

  String? getName() {
    return name;
  }

  int? getAge() {
    return age;
  }

  String? getGender() {
    return gender;
  }

  String? getAddress() {
    return address;
  }

  @override
  String? toString_name() {
    return this.name;
  }

  @override
  String toString_detail() {
    return '$name+$age+$gender+$address';
  }
}
