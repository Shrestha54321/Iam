import 'package:flutter/material.dart';

class account extends StatelessWidget {
  const account({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text("I AM"),
        ),
          body: Container(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
             
             
              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Text("  Settings",
                style: TextStyle(
                  fontSize: 20,
                  
                ),),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 500,
                  width: double.infinity,
                  child: ListView(
                    
                    children: [
                       ListTile(
                        shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(5),
                    ), 
                    leading: Icon(Icons.settings),
                    title: Text("General"),
                    trailing: Text(">"),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                     
                      ListTile(
                        shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(5),
                    ), 
                    leading: Icon(Icons.play_arrow_outlined),
                    title: Text("App Icon"),
                    trailing: Text(">"),
                    onTap: (){
                      
                    },
                  ),
                   ListTile(
                    shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(5),
                    ), 
                    leading: Icon(Icons.ring_volume_sharp),
                    title: Text("Reminder"),
                    trailing: Text(">"),
                    onTap: (){
                     
                    },
                  ),
                      ListTile(
                        shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(5),
                    ), 
                    leading: Icon(Icons.widgets),
                    title: Text("Widgets"),
                    trailing: Text(">"),
                    onTap: (){
                      },
                  ),
                    ],
                  ),
                ),
              )


            ],
          ),
        ),
      )
    );
  }
}