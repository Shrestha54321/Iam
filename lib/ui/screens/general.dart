import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iam/ui/screens/account.dart';
import 'package:iam/ui/screens/play.dart';
import 'package:iam/ui/screens/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';


class general extends StatefulWidget {
  const general({super.key});

  @override
  State<general> createState() => _generalState();
}
String imageee="";

class _generalState extends State<general> {
  
  
 
    // List images=[
    //   "a.jpg",
    //   "b.jpg",
    //   "c.jpg",
    //   "d.jpg",
    //   "e.jpg",
    //   "f.jpg",
    // ];

   List text=[
    "No Pain No Gain",
    "Hustle and suceed",
    "Calm and peace"
  ];

  
  void initState() {
    super.initState();
    setImage();
   }

   setImage() async{ // shared preference for image change, use of getString
    final prefs = await SharedPreferences.getInstance();
     String? background = await prefs.getString('background');
    setState(() {
      imageee = background.toString();
     });
    }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children:[

          Container(   // background image
           child: FutureBuilder(
           future: setImage(),
           builder: (context, snapshot) => 
            Container(   
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:NetworkImage(imageee),
                fit: BoxFit.fitHeight,
                 )
            ),
                  ),
          ),
          ),
          
             
              
          Container(
            child: PageView.builder(  // for scrolling text
            scrollDirection: Axis.vertical,
            itemCount: text.length,
            itemBuilder: (context, index) {  
            return Container(
            margin: EdgeInsets.only(top: 150,left: 20,right: 20),
            child: Text(text[index],
            style: TextStyle(
            fontSize: 35, 
            fontWeight: FontWeight.bold,
            color: Colors.white),
            ),
            
                   );
            }
                   ),
          ),
              
               

        Padding(   // star icon
          padding: const EdgeInsets.only(top:30.0,left: 340,),
          child: InkWell(
            onTap: () {},
            child: Container(
             child: Icon(Icons.star,
              size: 40,
              color: Colors.white,),
            ),
          ),
        ),
       

        Padding(    // bottom bar 
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                  height:730,
                ),

             Row(
             children: [
                
                 Container( // general tab
                  child:Column(
                    children: [
                      Container(
                        height:50,
                        width: 80,
                        decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(12),
                           color: Colors.grey,
                        ),
                        child:Center(child: Text("General")),
                      ),
                    ],)
            ),

            SizedBox(
              width: 20,
            ),

            InkWell(  //play tab
              onTap: () {

               showDialog(context: context,
               builder: (context){
                return Container(
                  child: AlertDialog(
                   content: Icon(Icons.play_arrow_outlined),
                     title: Text("General"),
                    actions: [
                      Text("you`ll get a new affirmation every few seconds. Read each one,focusing on the meaning"),
                      TextButton(
                        child: Text("Exit"),
                        onPressed:(() {
                        Navigator.pop(context);
                      }
                      ),
                      ),
                    ],
                  ),
                );
               });
                },
             child: Container(
                    child:Column(
                      children: [
                        Container(
                          height:50,
                          width: 50,
                          decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(12),
                             color: Colors.grey,
                          ),
                          child:Center(child: Icon(Icons.play_arrow)),
                        ),
                      ],)
              ),
               ),

             SizedBox(
              width: 80,
            ),

            InkWell(  // theme tab
              onTap: () {
                theme();
              },
           child: InkWell(
                onTap: (() {
                   Navigator.push(context,MaterialPageRoute(builder:(context){
                return theme();          
              },) );
               }),
                child: Container(
                      child:Column(
                        children: [
                          Container(
                            height:50,
                            width: 50,
                            decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(12),
                               color: Colors.grey,
                            ),
                            child:Center(child: Icon(Icons.brush)),
                          ),
                        ],)
                ),
              ),
            ),
             SizedBox(
              width: 30,
            ),

            InkWell(  // account tab
              onTap: () {
                 Navigator.push(context,MaterialPageRoute(builder:(context){
             return account();          
              },),);
              },
              child: Container(
                    child:Column(
                      children: [
                        Container(
                          height:50,
                          width: 50,
                          decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(12),
                             color: Colors.grey,
                          ),
                          child:Center(child: Icon(Icons.person)),
                        ),
                      ],)
              ),
            ),
               ],
             ),
            ],
          ),
        ),
        
        ]
      ),
      );
    
  }
}




