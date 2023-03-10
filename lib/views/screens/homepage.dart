import 'package:flutter/material.dart';
import 'package:jokes_app/views/screens/storedata_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api_helper_class/api_helper_page.dart';
import '../../models/model_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Future<Jokes?>? getData;
  Jokes? getData;

  late SharedPreferences sharedPreferences;


  prefs() async {
    sharedPreferences = await SharedPreferences.getInstance();
    APIHelper.apiHelper.storeData = sharedPreferences.getStringList("allJokes") ?? [];
  }

  getJoke() async {
    getData = await APIHelper.apiHelper.feachData();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getJoke();
    prefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () async {
              APIHelper.apiHelper.storeData.add(getData!.value);

              List<String> P = APIHelper.apiHelper.storeData;
              print(P);

              await sharedPreferences.setStringList('allJokes', P);
              print(sharedPreferences.getStringList('allJokes'));
          },
            child: Icon(Icons.save)),
        title: Text(
          "Jokes",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 23),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'StoreData');
              },
              icon: Icon(Icons.storage)),
          SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "${getData?.value}",
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 180,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    getData = getJoke();
                  });
                },
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Fetch My Laugh",
                        style: TextStyle(
                            color: Colors.black, fontSize: 19),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange[100],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
            // FutureBuilder(
            //   future: getData,
            //   builder: (BuildContext context, AsyncSnapshot snapshot) {
            //     if (snapshot.hasError) {
            //       return Center(
            //         child: Text("Error: ${snapshot.error}"),
            //       );
            //     } else if (snapshot.hasData) {
            //       // Jokes? data = snapshot.data;
            //
            //       return
            //           // (data != null)
            //           //   ?
            //
            //       // : Center(
            //       //     child: Text("No data found..."),
            //       //   );
            //     }
            //     return Center(
            //       child: CircularProgressIndicator(),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
