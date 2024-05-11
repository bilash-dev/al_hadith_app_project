import 'package:al_hadiths_app/controller/hatidh_controller.dart';
import 'package:al_hadiths_app/db/database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sqflite_common/sqlite_api.dart';
import '../utils/appcolors.dart';


class HomePage extends StatefulWidget {
   Database database;
  HomePage({super.key, required this.database});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HadithController hadithController = Get.put(HadithController());


  // @override
  // void initState() {
  //   hadithController.hadiths;
  //   DatabaseHelper.initDatabase();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbarBackgroundColor,
        title: ListTile(
          title: Text('Al Hadith',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),),
          subtitle: Text('ál_hadith', style: TextStyle(color: Colors.white),),),
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.wysiwyg_rounded,
                color: Colors.white,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 170.0,
              width: MediaQuery.of(context).size.width,
              color: AppColors.appbarBackgroundColor,
            ),
            Positioned(
              top: 300.0,
              child: Container(
                height: 25.0,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30.0)),
                    color: AppColors.scafoldBackgroundColor),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                color: AppColors.scafoldBackgroundColor,
              ),
              child: Obx(
                    () {
                  var hadithData = hadithController.hadiths;
                  if (hadithData == false) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                        itemCount: hadithData.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Card(
                                child: ListTile(
                                  title: Text(
                                    hadithData[index].narrator.toString(),
                                    style: TextStyle(fontFamily: 'Kalpurush', fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    hadithData[index].narrator.toString(),
                                    style: TextStyle(fontFamily: 'Kalpurush', fontStyle: FontStyle.normal),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              // Container(
                              //   // padding: EdgeInsets.all(8.0),
                              //   child: Text(
                              //     hadithData[index].bookName.toString(),
                              //     style: TextStyle(fontFamily: "KFGQPC Uthmanic Script HAFS Regular",fontStyle: FontStyle.normal),
                              //   ),
                              // ),
                            ],
                          );
                        }
                    );
                  }
                },
              ),
            )
          ],
        ),
      )
    );

  }
}