import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pallife_task3/component/component.dart';
import 'package:pallife_task3/view/character_info.dart';
import 'package:pallife_task3/api_handler/httpHelper.dart';
import 'package:pallife_task3/api_handler/linkapi.dart';
import 'package:pallife_task3/view/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  getAllCharacter()async{
    var response = await HttpHelper.getRequest(linkAllCharacter);
    return response;
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              Get.to(() => SearchScreen());
            },
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),

        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: showItems(getAllCharacter()),
        ),
      ),
    );
  }

  // Widget buildCharacterItem(charInfo){
  //   return InkWell(
  //     onTap: (){
  //       Get.to(() => CharacterInfoScreen(url: charInfo['url'],));
  //     },
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Row(
  //         children:
  //         [
  //           Image(
  //               image: NetworkImage(charInfo['image'],),
  //             height: 90,
  //             width: 90,
  //           ),
  //           SizedBox(width: 20,),
  //           Column(
  //             children: [
  //               Text(
  //                 charInfo['name'].length > 15 ? charInfo['name'].substring(0, 15)+'...' : charInfo['name'],
  //                 style: TextStyle(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold
  //
  //                 ),
  //
  //               ),
  //               SizedBox(height: 10,),
  //               Text(
  //                 charInfo['gender'],
  //                 style: TextStyle(
  //                     fontSize: 15,
  //                     color: Colors.grey
  //
  //                 ),
  //
  //               ),
  //
  //             ],
  //           ),
  //           // Flexible(
  //           //   child: RichText(
  //           //     overflow: TextOverflow.ellipsis,
  //           //     strutStyle: StrutStyle(fontSize: 10.0),
  //           //     text: TextSpan(
  //           //         style: TextStyle(
  //           //             color: Colors.black,
  //           //           fontSize: 18,
  //           //           fontWeight: FontWeight.bold
  //           //         ),
  //           //         text: charInfo['name']
  //           //     ),
  //           //   ),
  //           // ),
  //           Spacer(),
  //           Text(
  //             charInfo['status'],
  //             style: TextStyle(
  //                 fontSize: 15,
  //               color: getStatus(charInfo['status'])
  //             ),
  //           ),
  //
  //
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Color getStatus(status){
  //   if(status == 'Alive')
  //     return Colors.green;
  //   else if(status == 'Dead')
  //     return Colors.red;
  //   else
  //     return Colors.grey;
  // }
}
