import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pallife_task3/view/character_info.dart';

Widget showItems(item){
  return FutureBuilder(
      future: item,
      builder: (context,AsyncSnapshot snapshot){
        if(snapshot.hasData){
          //print(snapshot.data['results'].length);
          return ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: snapshot.data['results'].length,
            itemBuilder: (context,index){
              return buildCharacterItem(snapshot.data['results'][index]);

            },
            separatorBuilder: (context,index) =>
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                ),

          );
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return LinearProgressIndicator();
        }
        return LinearProgressIndicator();

      }
  );

}

Widget buildCharacterItem(charInfo){
  return InkWell(
    onTap: (){
      Get.to(() => CharacterInfoScreen(url: charInfo['url'],));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children:
        [
          Image(
            image: NetworkImage(charInfo['image'],),
            height: 90,
            width: 90,
          ),
          SizedBox(width: 20,),
          Column(
            children: [
              Text(
                charInfo['name'].length > 15 ? charInfo['name'].substring(0, 15)+'...' : charInfo['name'],
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold

                ),

              ),
              SizedBox(height: 10,),
              Text(
                charInfo['gender'],
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey

                ),

              ),

            ],
          ),
          // Flexible(
          //   child: RichText(
          //     overflow: TextOverflow.ellipsis,
          //     strutStyle: StrutStyle(fontSize: 10.0),
          //     text: TextSpan(
          //         style: TextStyle(
          //             color: Colors.black,
          //           fontSize: 18,
          //           fontWeight: FontWeight.bold
          //         ),
          //         text: charInfo['name']
          //     ),
          //   ),
          // ),
          Spacer(),
          Text(
            charInfo['status'],
            style: TextStyle(
                fontSize: 15,
                color: getStatus(charInfo['status'])
            ),
          ),


        ],
      ),
    ),
  );
}

Color getStatus(status){
  if(status == 'Alive')
    return Colors.green;
  else if(status == 'Dead')
    return Colors.red;
  else
    return Colors.grey;
}