import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:citra_v2/pages/widgets/app_button.dart';


class DoorLock extends StatefulWidget{
  const DoorLock({Key? key}) : super (key: key);
  @override
  DoorLockState createState()=>DoorLockState();
}

class DoorLockState extends State<DoorLock>{
  final TextEditingController? controllerPintuRumah = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference doorlock = FirebaseFirestore.instance.collection('doorlock');
  final List<String> items = [
    'Unlock',
    'Lock',
  ];
  String? selectedValue;

  @override
  void initState(){
    super.initState();
  }

  Future<void> updateFirestore(String kondisi) {
    print("send condition");
    return doorlock.doc('condition').update({'door': kondisi}).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Berhasil")));
    }).catchError((error) {
      print("$error");
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to update firestore")));
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(),
              DropdownButton2(
                isExpanded: true,
                hint: Row(
                  children: const [
                    Icon(
                      Icons.list,
                      size: 16,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        'Select Item',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                      controller: controllerPintuRumah;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
              ),
              Spacer(),
              AppButton(
                text: "Update",
                onPressed: () async{
                  String? kondisi = controllerPintuRumah!.text.toString();
                },
              )
            ],
          ),
        )
      ),
    );
  }
}