import 'dart:io';
import 'package:final_project/models/item_custome.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();

  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'item.db';

    //create, read databases
    var itemDatabase = openDatabase(path, version: 4, onCreate: _createDb);

    //mengembalikan nilai object sebagai hasil dari fungsinya
    return itemDatabase;
  }

  //buat tabel baru dengan nama item
  void _createDb(Database db, int version) async {
    Batch batch = db.batch();
    // tabel Custom
    batch.execute('''CREATE TABLE custom (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pemesan TEXT,
    jenis TEXT,
    ukuran INTEGER,
    aroma TEXT,
    packaging TEXT,
          )''');
    List<dynamic> res = await batch.commit();
  }

  //select databases tabel Custom
  Future<List<Map<String, dynamic>>> selectCustom() async {
    Database db = await this.initDb();
    var mapList = await db.query('custom', orderBy: 'id');
    return mapList;
  }

  // insert data tabel Custom
  Future<int> insertCustom(Custom object) async {
    Database db = await this.initDb();
    int count = await db.insert('custom', object.toMap());
    return count;
  }

  //update databases tabel Custom
  Future<int> updateCustom(Custom object) async {
    Database db = await this.initDb();
    int count = await db.update('custom', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

//delete databases tabel Custom
  Future<int> deleteCustom(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('custom', where: 'id=?', whereArgs: [id]);
    return count;
  }

//membuat list item pada tabel custome
  Future<List<Custom>> getItemListCustom() async {
    var itemMapList = await selectCustom();
    int count = itemMapList.length;
    List<Custom> itemList = List<Custom>();
    for (int i = 0; i < count; i++) {
      itemList.add(Custom.fromMap(itemMapList[i]));
    }
    return itemList;
  }

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}
