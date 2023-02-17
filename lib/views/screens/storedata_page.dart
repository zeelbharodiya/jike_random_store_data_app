import 'package:flutter/material.dart';
import 'package:jokes_app/api_helper_class/api_helper_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreData extends StatefulWidget {
  const StoreData({Key? key}) : super(key: key);

  @override
  State<StoreData> createState() => _StoreDataState();
}

class _StoreDataState extends State<StoreData> {

  var index = 1;
  List<String> allValue = [];

  late SharedPreferences sharedPreferences;

  prefsAll() async {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      allValue = sharedPreferences.getStringList("allJokes")!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prefsAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Store Data",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 23),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...allValue.map((e) =>
                  Container(
                    child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("[ ${index ++} ] ${e}",style: TextStyle(fontSize: 16,wordSpacing: 5),),
                        )),
                  ),
              ).toList(),
            ],
          ),
        ),
      ),
    );
  }
}




