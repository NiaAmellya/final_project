import 'package:flutter/material.dart';

class ProductInfoMan extends StatefulWidget {
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfoMan> {
  @override
  Widget build(BuildContext context) {
    final Map<String, Object> rcvdData =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border),
          )
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                '${rcvdData['name']}',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Center(
              child: Hero(
                tag: '${rcvdData['img']}',
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('img/${rcvdData['img']}.jpg'),
                          fit: BoxFit.contain)),
                ),
              ),
            ),
            Container(
              color: Colors.grey.withOpacity(0.2),
              padding: EdgeInsets.only(left: 25, top: 20),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      '\$${rcvdData['price']}',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    child: Text(
                      ' /${rcvdData['quantity']}',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey.withOpacity(0.2),
                padding: EdgeInsets.all(25),
                child: Text(
                  "Parfum adalah campuran minyak esensial dan senyawa aroma, fiksatif, dan pelarut yang digunakan untuk memberikan bau wangi untuk tubuh manusia, objek, atau ruangan. Ada Berbagai macam ekstrak, yaitu parfum, Eau de parfum, Eau de toilette, atau Eau de Cologne.",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Container(
              height: 100,
              padding: EdgeInsets.only(left: 25, right: 25),
              alignment: Alignment.bottomCenter,
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[],
              ),
            )
          ],
        ),
      ),
    );
  }
}
