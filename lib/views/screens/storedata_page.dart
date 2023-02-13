import 'package:flutter/material.dart';
import 'package:jokes_app/api_helper_class/api_helper_page.dart';


class StoreData extends StatefulWidget {
  const StoreData({Key? key}) : super(key: key);

  @override
  State<StoreData> createState() => _StoreDataState();
}

class _StoreDataState extends State<StoreData> {
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
        child: Column(
          children: [
            ...APIHelper.apiHelper.storeData!.map((e) =>
                ListTile(
                  subtitle: Text("${e}"),
                ),
            ).toList(),
          ],
        ),
      ),
    );
  }
}
