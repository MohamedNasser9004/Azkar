import 'dart:convert';

import 'package:azkar/models/section_detail_model.dart';
import 'package:flutter/material.dart';

class SectionDetailScreen extends StatefulWidget {
  final int id;
  final String title;
  const SectionDetailScreen({Key? key, required this.id, required this.title}) : super(key: key);

  @override
  State<SectionDetailScreen> createState() => _SectionDetailScreenState();
}

class _SectionDetailScreenState extends State<SectionDetailScreen> {
  List<SectionDetailModel> sectionsDetail = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadSectionDetail(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Card(
                color: Colors.yellow.shade100,
                elevation: 10,
                margin: const EdgeInsets.fromLTRB(5, 8, 5, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: Text(
                    "(${sectionsDetail[index].count}) ",
                  ),
                  title: Text(
                    "${sectionsDetail[index].content}",
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: Text(
                    "${sectionsDetail[index].description}",
                    textDirection: TextDirection.rtl,
                  ),
                  // trailing: Text("${sectionsDetail[index].reference}",
                  //   textDirection: TextDirection.ltr,
                  // ),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(height: 0.1,),
            itemCount: sectionsDetail.length),
      ),
    );
  }

  LoadSectionDetail(BuildContext context) async {
    sectionsDetail =[];
    DefaultAssetBundle.of(context)
        .loadString("assets/database/section_details_db.json")
        .then((data) {
      var response = jsonDecode(data);
      response.forEach((section) {
        SectionDetailModel _sectionDetail =
            SectionDetailModel.fromjson(section);
        if(_sectionDetail.section_id == widget.id){
          sectionsDetail.add(_sectionDetail);
        }
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
