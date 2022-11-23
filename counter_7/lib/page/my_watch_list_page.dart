import 'package:counter_7/page/detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:counter_7/model/my_watch_list.dart';
import 'package:counter_7/drawer.dart';

class MyWatchListPage extends StatefulWidget {
    const MyWatchListPage({Key? key}) : super(key: key);

    @override
    // ignore: library_private_types_in_public_api
    _MyWatchListPageState createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {
    Future<List<MyWatchList>> fetchMyWatchList() async {
        var url = Uri.parse('https://katalog-hana.herokuapp.com/mywatchlist/json/');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object MyWatchList
        List<MyWatchList> listMyWatchList = [];
        for (var d in data) {
        if (d != null) {
            listMyWatchList.add(MyWatchList.fromJson(d));
        }
        }

        return listMyWatchList;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('My Watchlist'),
            ),

            // Menambahkan drawer menup
            drawer: getDrawer(context),

            body: FutureBuilder(
                future: fetchMyWatchList(),
                builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                    } else {
                    if (!snapshot.hasData) {
                        return Column(
                        children: const [
                            Text(
                            "Tidak ada watchlist :(",
                            style: TextStyle(
                                color: Color(0xff59A5D8),
                                fontSize: 20),
                            ),
                            SizedBox(height: 8),
                        ],
                        );
                    } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index)=> GestureDetector(
                            onTap: () {
                            // Route menu ke halaman form
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => DetailPage(film: snapshot.data![index])),
                            );
                            },
                            child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 2.0
                                )
                                ]
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text(
                                    "${snapshot.data![index].fields.title}",
                                    style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    ),
                                ),
                                // const SizedBox(height: 10),
                                // Text("${snapshot.data![index].fields.watched}"),
                                ],
                            ),
                            )
                          )
                        );
                    }
                    }
                }
            )
        );
    }

}