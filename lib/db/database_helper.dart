import 'dart:io';
import 'dart:typed_data';
import 'package:al_hadiths_app/model/hadith_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;
import 'package:path_provider/path_provider.dart';

class DatabaseHelper{

  Future<void> initPathProvider()async{
    await getApplicationDocumentsDirectory();
  }

  static Future<Database> initDatabase() async{
    final directory = await getDatabasesPath();
    final pathDB = Path.join(directory, "hadith_db.db");
    return await openDatabase(
      pathDB, version: 1,
      onCreate: (db, version) {
          // db.execute(
        //   '''CREATE TABLE hadith(
        //     // id INTEGER PRIMARY KEY,
        //     // text TEXT,
        //     // source TEXT,
        // )'''
        // );
      },
    );
  }

  Future<void> copyDatabase() async {
    final dbAssetPath = 'assets/hadith_db.db';
    final documentsDirectory = await getDatabasesPath();
    final dbPath = Path.join(documentsDirectory, 'hadith_db.db');

    if (!await databaseExists(dbPath)) {
      final ByteData data = await rootBundle.load(dbAssetPath);
      final List<int> bytes = data.buffer.asUint8List();
      await File(dbPath).writeAsBytes(bytes, flush: true);
    }
  }


    static Future<List<HadithModel>> getAllHadith() async{
    final db = await initDatabase();
    // print(db.path.toString());
    final List<Map<String, Object?>> maps = await db.query('hadith');
      return List.generate(maps.length, (i) {
        return HadithModel(
          hadithId: maps[i]["hadith_id"],
          bookId: maps[i]["book_id"],
          bookName: maps[i]["book_name"],
          chapterId: maps[i]["chapter_id"],
          sectionId: maps[i]["section_id"],
          narrator: maps[i]["narrator"],
        );
      });
    }

}