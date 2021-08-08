import 'package:flutter/material.dart';

class CalculatePage extends StatefulWidget {
  //const CalculatePage({ Key? key }) : super(key: key);

  @override
  _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  // ตำแหน่งสำหรับเก็บข้อมูลของค่าที่ user กรอกเข้ามา
  TextEditingController distanceS =
      TextEditingController(); //ช่องสำหรับเก็บจำนวน
  TextEditingController distanceE =
      TextEditingController(); //ช่องสำหรับเก็บจำนวน
  double price = 8; // ช่องสำหรับเก็บราคาสินค้า ใส่ค่าไปเลย
  TextEditingController result = TextEditingController();

  @override
  void initState() {
    // ฟังก์ชั่นพิเศษสำหรับการตั้งค่าในตอนแรก
    super.initState();

    result.text = "ระยะทางทั้งหมด  KM จำนวนค่าใช้จ่าย  บาท";
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
              child: Column(
            children: [
              Image.asset(
                'assets/Car.png',
                width: 150,
              ),
              Text("โปรแกรมคำนวณค่าเดินทาง",
                  style: TextStyle(fontSize: 28, fontFamily: 'Milktea')),
              TextField(
                  controller: distanceS,
                  decoration: InputDecoration(
                      labelText: 'เลขไมล์เริ่มต้น',
                      border: OutlineInputBorder())),
              SizedBox(height: 10),
              TextField(
                  controller: distanceE,
                  decoration: InputDecoration(
                      labelText: 'เลขไมล์สุดท้าย',
                      border: OutlineInputBorder())),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  var cal1 = double.parse(distanceE.text) -
                      double.parse(distanceS.text);
                  var cal2 = cal1 * price;

                  setState(
                    () {
                      result.text =
                          "ระยะทางทั้งหมด $cal1 Km จำนวนค่าใช้จ่าย $cal2 บาท";
                    },
                  );
                },
                child: Text("คำนวณ"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xD9f51832)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.fromLTRB(35, 10, 35, 10)),
                    textStyle: MaterialStateProperty.all(
                        TextStyle(fontSize: 15, fontFamily: 'Milktea'))),
              ),
              Text(
                result.text,
                style: TextStyle(fontSize: 20),
              )
            ],
          )),
        ),
      ],
    );
  }
}
