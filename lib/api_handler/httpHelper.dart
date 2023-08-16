import 'package:http/http.dart' as http;
import 'dart:convert';


class HttpHelper{

  static getRequest(String url)async{

    try{
      var response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        var responseBody = jsonDecode(response.body);
        ///print(responseBody);
        return responseBody;
      }else{
        print('Error ${response.statusCode}');
      }
    }catch(e){
      print('Error catch $e');
    }
  }

}