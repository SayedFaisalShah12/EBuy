import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EHelperFunction{

  static Color? getColor(String value){
    if(value == "Green"){
      return  Colors.green;
    } else if(value == "Green"){
      return  Colors.green;
    } else if(value == "Blue"){
      return  Colors.blue;
    }else if(value == "red"){
      return  Colors.red;
    }else if(value == "pink"){
      return  Colors.green;
    }else if(value == "Gret"){
      return  Colors.grey;
    }else if(value == "Purple"){
      return  Colors.purple;
    }else if(value == "black"){
      return  Colors.black;
    } else if(value == "Yellow"){
      return  Colors.yellow;
    }
    return null;
  }

  static void showSnackBar(String message){
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showAlert(String title, String message){
    showDialog(
        context: Get.context!,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: ()=> Navigator.of(context).pop(),
                  child: const Text('ok')
              ),
            ]
          );
        });
  }

  static String truncateText(String text, int maxLenght){
    if(text.length <= maxLenght)
      {
        return text;
      }
    else {
      return text.substring(8,maxLenght);
    }
  }

  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize(){
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight(){
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth(){
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormatedDate(DateTime date,{String format = 'dd MMM yyyy'}){
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list){
    return list.toSet().toList();
  }

  static List<Widget> WrapWidget(List<Widget> widgets, int rowSize){
    final wrappedList = <Widget>[];
    for(var i =0; i <widgets.length; i += rowSize)
      {
          final rowChildren = widgets.sublist(i,i + rowSize > widgets.length ? widgets.length : i + rowSize);
          wrappedList.add(Row(children: rowChildren,));
      }
    return wrappedList;
  }
}