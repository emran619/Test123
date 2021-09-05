
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:malkanat/models/city_list_model.dart';
import 'package:malkanat/network/dio_helper.dart';
import 'package:malkanat/network/end_points.dart';
import 'package:provider/provider.dart';

class Testt extends StatefulWidget {
  @override
  _TesttState createState() => _TesttState();
}

CitiesImp _citiesImp = CitiesImp();

Future<CitiesImp> get() async {
  try {
    var response = await DioHelper.getData(url: CITIES_AR);
    var _citiesImp = CitiesImp.fromJson(response.data);
    
    print('\n\n-id-:${_citiesImp.cities[0].id}');
    print('\n\n-createdAt-:${_citiesImp.cities[0].createdAt}');
    print('\n\n-updatedAt-:${_citiesImp.cities[0].updatedAt}');
    print('\n\n-name-:${_citiesImp.cities[0].name}');
    
  } on DioError catch (e) {
    print('\n\n\n ************\n');
    print(e.error);
    print('\n\n\n ************\n');
  }
  return _citiesImp;
}

class _TesttState extends State<Testt> {
  @override
  void initState() {
    super.initState();
    
    get().then((value) => _citiesImp = value);
    
  }

  @override
  Widget build(BuildContext context) {
    var c = Provider.of<CitiesImp>(context,listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                
                print("\n^^^^^^^^ In Button:\n");
                 print('@@@@@@@@@@@@ ${_citiesImp.cities[0].name} @@@@@@@@@');
              },
              child: Text('Tap here'),
            ),
            // Text(_citiesImp.cities[0].updatedAt),
            // Text(_citiesImp.cities[0].createdAt),
            Text('data'),
            Text('data'),
            Text('data'),
            // Text('${citiesImp.cities[0].id}'),
            // Text('${citiesImp.cities[0].updatedAt}'),
            // Text('${citiesImp.cities[0].createdAt}'),
            // Text('${citiesImp.cities[0].name}'),
          ],
        ),
      ),
    );
  }
}
// class User{
//     int age ;
//     String name;
//     List<Experience> exps;
//     List<Education> edcs;
//     Experience exp;

//     Map<String , dynamic> toJson(){
//         Map<String , dynamic> json = {};
//         json['age'] = this.age.toString();
//         json['name'] = this.name;
//         json['exp'] = Experience.toJsonList(this.exps);
//     }

//     User(this.name , this.age , ...);

//     User.fromJson(Map<String , dynamic> json) {
//         this.age = json['age'];
//         this.name = json['name'];
//         this.exp = Experience.fromJson(json['exp']) // one exper
//         this.exps = Experience.fromJsonList(json)
//     }

// }

// class Experience {
//     String type;

//     Experience.fromJson(Map<string , dunamci> json > ){
//        this.type =  json['type'] ;
//     }

//     static List<Experience> fromJsonList(Map<String , dynamci> json){
//         List<Experience> result = [];

//         json['exps'].forEach( (e){
//             result.push(Experience.fromJson(e));
//         } );

//         return result;
//     }

//     Map<String , dynamic> tojson(){
//         Map<String , dynamic> json = {};
//         json['type'] = this.type;
//         return json;
//     }

//     static List<Map<String , dynamic>> toJsonList(List<Experience> myList){
//         List<Map<String , dynamic>> result = [];
//         myList.forEach( (e) {
//             result.push(e.toJson());
//         } );
//         return result;
//     }

// }

// class Education {

// }


// {
//     age:3,
//     name:'emaran',
//     exp : [{
//         type: "test"
//     } , {}]
// }

// User user = User("emran" , 3 , [Experice("computer")]);

// await http.post(url,data : user.toJson());





// -----------------
// Future<List<Cities>> get() async {
//   List<Cities> citiesImp;
//   try {
//     var response = await DioHelper.getData(url: CITIES_AR);
//     if (response.statusCode == 200) {
//       var citiesJson = json.decode(response.data);
//       for (var i in citiesJson) {
//         citiesImp.add(Cities.fromJson(i));
//         // var citiesImp = CitiesImp.fromJson(response.data);
//       }
//     }
//   } on DioError catch (e) {
//     print('\n\n\n ************\n');
//     print(e.error);
//     print('\n\n\n ************\n');
//   }
//   return citiesImp;
// }