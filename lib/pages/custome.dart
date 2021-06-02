import 'package:final_project/models/item_custome.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:final_project/models/dbhelper.dart';
import 'package:final_project/pages/entryformcus.dart';
import 'dart:async';

class Custom1 extends StatefulWidget {
  @override
  Custom1State createState() => Custom1State();
}

class Custom1State extends State<Custom1> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Custom> itemList;
  String _jenis;
  List _listJenis = ["Eau De Parfum", "Eau De Cologne", "Eau De Toilette"];

  @override
  void initState() {
    super.initState();
    updateListView();
  }

  @override
  Widget build(BuildContext context) {
    if (itemList == null) {
      itemList = List<Custom>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Parfume'),
      ),
      body: Column(children: [
        Expanded(
          child: createListView(),
        ),
        //button untuk menambah item pada recommendation
        Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                RaisedButton(
                  child: Text("Tambah Item Custom"),
                  onPressed: () async {
                    var item = await navigateToEntryForm(context, null);
                    if (item != null) {
                      //TODO 2 Panggil Fungsi untuk Insert ke DB
                      int result = await dbHelper.insertCustom(item);
                      if (result > 0) {
                        updateListView();
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Future<Custom> navigateToEntryForm(BuildContext context, Custom item) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryFormCus1(item);
    }));
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.headline5;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.ad_units),
            ),
            title: Text(
              this.itemList[index].pemesan,
              style: textStyle,
            ),
            //mencetak hasil pengisian form
            subtitle:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Pemesan   : ' + this.itemList[index].pemesan),
              Text('Jenis     : ' + this.itemList[index].jenis),
              Text('Ukuran    : ' +
                  this.itemList[index].ukuran.toString() +
                  ' ml'),
              Text('Aroma     : ' + this.itemList[index].aroma),
              Text('Packaging : ' + this.itemList[index].packaging),
            ]),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                //TODO 3 Panggil Fungsi untuk Delete dari DB berdasarkan Item
                int id = this.itemList[index].id; // get id from sqlite database
                await dbHelper.deleteCustom(id); // delete by id from table
                itemList.removeAt(index); // delete by index from list
                updateListView();
              },
            ),
            onTap: () async {
              var item =
                  await navigateToEntryForm(context, this.itemList[index]);
              //TODO 4 Panggil Fungsi untuk Edit data
              if (item != null) {
                int result = await dbHelper.updateCustom(item);
                if (result > 0) {
                  updateListView();
                }
              }
            },
          ),
        );
      },
    );
  }

  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      //TODO 1 Select data dari DB
      Future<List<Custom>> itemListFuture = dbHelper.getItemListCustom();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }
}
