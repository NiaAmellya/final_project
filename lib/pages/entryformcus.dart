import 'package:final_project/models/item_custome.dart';
import 'package:flutter/material.dart';

class EntryFormCus1 extends StatefulWidget {
  final Custom custom;
  EntryFormCus1(this.custom);
  @override
  EntryFormCus1State createState() => EntryFormCus1State(this.custom);
}

//class controller
class EntryFormCus1State extends State<EntryFormCus1> {
  var itemList = ["Eau De Parfum", "Eau De Cologne", "Eau De Toilette"];
  Custom custom;
  String _newValue = "Eau De Parfum";
  List<String> listViewItem = List<String>();
  EntryFormCus1State(this.custom);
  TextEditingController pemesanController = TextEditingController();
  TextEditingController jenisController = TextEditingController();
  TextEditingController ukuranController = TextEditingController();
  TextEditingController aromaController = TextEditingController();
  TextEditingController packagingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //kondisi
    if (custom != null) {
      pemesanController.text = custom.pemesan;
      jenisController.text = custom.jenis;
      ukuranController.text = custom.ukuran.toString();
      aromaController.text = custom.aroma;
      packagingController.text = custom.packaging;
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          title: custom == null ? Text('Tambah') : Text('Ubah'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              // nama
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: pemesanController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Name Customer',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: DropdownButton<String>(
                  items: itemList.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  value: _newValue,
                  onChanged: (String value) {
                    setState(() {
                      _newValue = value;
                    });
                  },
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              //   child: TextField(
              //     controller: jenisController,
              //     keyboardType: TextInputType.text,
              //     decoration: InputDecoration(
              //       labelText: 'Jenis',
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(5.0),
              //       ),
              //     ),
              //     onChanged: (value) {
              //       //
              //     },
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: ukuranController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Ukuran',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: aromaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Aroma',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: packagingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Packaging',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // tombol button
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    // tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (custom == null) {
                            // tambah data
                            custom = Custom(
                                pemesanController.text,
                                _newValue,
                                int.parse(ukuranController.text),
                                aromaController.text,
                                packagingController.text);
                          } else {
                            // ubah data
                            custom.pemesan = pemesanController.text;
                            custom.jenis = _newValue;
                            custom.ukuran = int.parse(ukuranController.text);
                            custom.aroma = aromaController.text;
                            custom.packaging = packagingController.text;
                          }
                          // kembali ke layar sebelumnya dengan membawa objek item
                          Navigator.pop(
                            context,
                            custom,
                          );
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(
                              context); //untuk meromove layar dari tumpukan
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
