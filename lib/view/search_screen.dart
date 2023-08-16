import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pallife_task3/component/component.dart';
import 'package:pallife_task3/view/character_info.dart';
import 'package:pallife_task3/api_handler/httpHelper.dart';
import 'package:pallife_task3/api_handler/linkapi.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //const SearchScreen({Key? key}) : super(key: key);
  var searchController = TextEditingController();

  getFilterCharacter()async{
    var response = await HttpHelper.getRequest(linkNameFilterCharacter(searchController.text));
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon : Icon(Icons.arrow_back_ios_rounded,
              color: Colors.black,)
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children:
          [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  label: Text('search'),
                ),
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  onChanged: (value){
                    setState(() {
                      getFilterCharacter();
                    });
                  },
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'search must not be empty';
                    }
                    return null;
                  }
              ),
            ),
            if(searchController.text.isNotEmpty)
            showItems(getFilterCharacter()),

          ],
        ),
      ),
    );
  }


}
