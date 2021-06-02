class Custom {
//variabel
  String _pemesan;
  String _jenis;
  int _id;
  int _ukuran;
  String _aroma;
  String _packaging;

// mengambil dan mengembalikan nilai yang dimasukkan ke constructor per variabel
  get id => _id;

  get pemesan => this._pemesan;
  set pemesan(String value) => this._pemesan = value;

  get jenis => this._jenis;
  set jenis(String value) => this._jenis = value;

  get ukuran => this._ukuran;
  set ukuran(value) => this._ukuran = value;

  get aroma => this._aroma;
  set aroma(String value) => this._aroma = value;

  get packaging => this._packaging;
  set packaging(String value) => this._packaging = value;

// constructor untuk menyimpan hasil inputan
  Custom(
      this._pemesan, this._jenis, this._ukuran, this._aroma, this._packaging);
//constructor dengan namba tambahan agar constructor pertama tidak error
//jika dipanggil akan mengambil data dari sql yang berbentuk Map, setelah itu disimpan kembali berbentuk variabel
  Custom.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._pemesan = map['pemesan'];
    this._jenis = map['jenis'];
    this._ukuran = map['ukuran'];
    this._aroma = map['aroma'];
    this._packaging = map['packaging'];
  }

  //metod untuk memasukkan setter dan getter ke dalam map
//untuk nantinya  dipanggila lagi untuk membuat method update dan insert
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['pemesan'] = this._pemesan;
    map['jenis'] = this._jenis;
    map['ukuran'] = this._ukuran;
    map['aroma'] = this._aroma;
    map['packaging'] = this._packaging;
    return map;
  }
}
