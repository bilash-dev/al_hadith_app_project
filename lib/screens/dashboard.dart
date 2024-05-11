import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../controller/hatidh_controller.dart';
import '../utils/appcolors.dart';
class Dashboard extends StatefulWidget {
  Database database;
  Dashboard({super.key, required this.database});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final HadithController hadithController = Get.put(HadithController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 5.0,
              toolbarHeight: 0.0,
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 120.0,
                width: double.infinity,
                color: AppColors.appbarBackgroundColor,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 90.0,
                      width: double.infinity,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 18.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Al Hadith",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                          fontSize: 22.0,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '1010101',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () => Navigator.pushNamed(
                                      context, '/setting'),
                                  icon: const Icon(Icons.settings)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100.0,
                      child: Container(
                        height: 25.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30.0)),
                            color: AppColors.scafoldBackgroundColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 400,
              child: SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: hadithController.hadiths.length,
                      (context, index) {
                    return Obx(
                          () {
                        var hadithData = hadithController.hadiths;
                        if (hadithData == null) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return ListView.builder(
                              itemCount: hadithData.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(hadithData[index].bookName.toString()),
                                );
                              }
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            )
          ],
        )
    );
  }
}