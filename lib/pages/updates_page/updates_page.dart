import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:winnerssacco/pages/updates_page/scholarship_details_page.dart';

import '../../models/scholarships_model.dart';


class UpdatesPage extends StatefulWidget {
  UpdatesPage(
      {Key key})
      : super(key: key);


  @override
  State<UpdatesPage> createState() => _UpdatesPageState();
}

Future<List<ScholarshipData>> fetchScholarships() async {
  final response = await http.get(Uri.parse(
      'https://winnerssacco.org/admin/api/api/loan/get_events.php'));
  // if (response.statusCode == 200) {
  List jsonResponse = json.decode(response.body);
  // print(jsonResponse);
  return jsonResponse.map((data) => ScholarshipData.fromJson(data)).toList();
  // } else {
  //   throw Exception('Unexpected error occured!');
  // }
}

class _UpdatesPageState extends State<UpdatesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [


          const SizedBox(
            height: 10,
          ),
          FutureBuilder<List<ScholarshipData>>(
              future: fetchScholarships(),
              builder: (context, snapshot) {
                // print(snapshot.error);
                if (snapshot.hasData) {
                  List<ScholarshipData> data = snapshot.data;
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: data.length,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Card(
                          elevation: 3,
                          margin: const EdgeInsets.all(5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListTile(
                            leading: data[index].image != null ? Image.network(
                                data[index].image,
                                height: 250, fit: BoxFit.fill) : Image.asset(
                                "assets/images/dp.png"),
                            dense: true,

                            title: Text( data[index].title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,

                              style: const TextStyle(
                                fontSize: 15.0,
                              ),
                            ),

                            subtitle:  Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(data[index].description,overflow: TextOverflow.ellipsis,maxLines: 3,
                                      style: const TextStyle(
                                          fontSize: 14.0, fontWeight: FontWeight.normal)),

                                ]),
                            onTap: () {

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>ScholarshipDetails(
                                      image: data[index].image, title: data[index].title, website: data[index].website, email: data[index].email, address: data[index].address, description: data[index].description, phone: data[index].phone)));

                            },
                          ));
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ]),
      ),
    );
  }
}
