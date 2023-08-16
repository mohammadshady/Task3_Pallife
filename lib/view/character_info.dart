import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pallife_task3/api_handler/httpHelper.dart';

class CharacterInfoScreen extends StatelessWidget {
  final String url;
   CharacterInfoScreen({Key? key, required this.url}) : super(key: key,);


  getSingleCharacter()async{
    var response = await HttpHelper.getRequest(url);
     return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Character Info',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22
          ),
        ),
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon : Icon(Icons.arrow_back_ios_rounded,
          color: Colors.black,)
        ),
      ),
       body: FutureBuilder(
           future: getSingleCharacter(),
           builder: (context,AsyncSnapshot snapshot){
             if(snapshot.hasData){
               return Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children:
                   [
                     Image(
                       image: NetworkImage(snapshot.data['image'],),
                       height: 200,
                       width: double.infinity,
                       fit: BoxFit.fill,
                     ),
                     SizedBox(
                       height: 20,
                     ),
                     Text(
                       'Character Name : ${snapshot.data['name']}',
                       style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,

                       ),

                     ),
                     SizedBox(
                       height: 20,
                     ),
                     Text(
                       'Character Gender : ${snapshot.data['gender']}',
                       style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold

                       ),

                     ),
                     SizedBox(
                       height: 20,
                     ),
                     Text(
                       'Character status : ${snapshot.data['status']}',
                       style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,

                       ),

                     ),

                   ],
                 ),
               );
             }
             if(snapshot.connectionState == ConnectionState.waiting){
               return Center(child: CircularProgressIndicator());
             }
             return Center(child: CircularProgressIndicator());

           }
       ),

      //body: ,
    );
  }
}
