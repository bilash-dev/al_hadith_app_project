import 'package:al_hadiths_app/db/database_helper.dart';
import 'package:al_hadiths_app/model/hadith_model.dart';
import 'package:get/get.dart';

class HadithController extends GetxController{
  final dbHelper = DatabaseHelper().obs;
  var hadiths = <HadithModel>[].obs;

  @override
  void onInit(){
    super.onInit();
    fetchHadiths();
  }


  Future<List<HadithModel>?> fetchHadiths() async{
    var hadithList = await DatabaseHelper.getAllHadith();
    // print('okay: $hadithList');
    hadiths.assignAll(hadithList);
  }
}