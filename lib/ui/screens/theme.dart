import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iam/ui/screens/general.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import '../../model.dart';

class theme extends StatefulWidget {
  theme({super.key});
  @override
  State<theme> createState() => _themeState();
}

class _themeState extends State<theme> {

 List<model> dataa =[];
  
 Future<List<model>>getpostapi()async{
    final response=await http.get(Uri.https('jsonplaceholder.typicode.com','photos'));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(var i in data){
        dataa.add(model.fromJson(i));
      }
      return dataa;

    }
    else{
      return dataa;

    }
    }

  @override
  Widget build(BuildContext context) {
    // List images = [
    //   "a.jpg",
    //   "b.jpg",
    //   "c.jpg",
    //   "d.jpg",
    //   "e.jpg",
    //   "f.jpg",
    // ];

    return Scaffold(
        body: Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 30,
        ),
        Center(
          child: Text(
            "Themes",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ), 

        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 15, bottom: 5),
          child: Text(
            "Wallpapers",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),

        Container(
          height: 220,
          width: double.maxFinite,
          margin: EdgeInsets.all(20),

          child: FutureBuilder(
            future: getpostapi(),

            builder: ((context, snapshot) => 

             ListView.builder(
              scrollDirection: Axis.horizontal,
             itemCount: dataa.length,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    InkWell(  
                      onTap: () async {
                        final prefs = await SharedPreferences.getInstance(); // shared preference for image save
                        await prefs.setString('background', dataa[index].thumbnailUrl.toString());
                         Navigator.pushAndRemoveUntil(context,
                         MaterialPageRoute(builder: (BuildContext context) {
                          return const general();
                        }), (r) {
                          return false;
                        });
                      },
          
                      child: Container(
                        height: 200,
                        width: 100,
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage(
                                // "assets/" + images[index],
                                dataa[index].thumbnailUrl.toString() ),
                                fit: BoxFit.fitHeight,
                              
                            )),
                      ),
          
                    
                    ),
                  ],
                );
              }
              ),
            )
            ),
            
          ),
            
          ),
        
      ]
      ),
    ));
  }
}
