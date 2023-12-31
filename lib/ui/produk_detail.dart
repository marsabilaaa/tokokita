import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_form.dart';

class ProdukDetail extends StatefulWidget {
  final Produk? produk;

  ProdukDetail({Key? key, this.produk}) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk Marsa'), // Hapus const pada Text
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Kode : ${widget.produk!.kodeProduk}",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              "Nama : ${widget.produk!.namaProduk}",
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              "Harga : Rp. ${widget.produk!.hargaProduk.toString()}",
              style: TextStyle(fontSize: 18.0),
            ),
            _tombolHapusEdit(),
          ],
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton(
          child: Text("EDIT"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProdukForm(produk: widget.produk!),
              ),
            );
          },
        ),
        OutlinedButton(
          child: Text("DELETE"),
          onPressed: () => confirmHapus(),
        ),
      ],
    );
  }

 void confirmHapus() {
  AlertDialog alertDialog = AlertDialog(
 content: const Text("Yakin ingin menghapus data ini?"),
 actions: [
 //tombol hapus
 OutlinedButton(
 child: const Text("Ya"),
 onPressed: () {
 Navigator.push(
 context,
 MaterialPageRoute(
 builder: (context) => ProdukForm(
 produk: widget.produk!,
 )));
 },
 ),
 //tombol batal
 OutlinedButton(
 child: const Text("Batal"),
 onPressed: () => Navigator.pop(context),
 )
 ],
 );

 showDialog(builder: (context) => alertDialog, context: context);
 }
}
