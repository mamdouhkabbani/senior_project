import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sinormachine/mydrawer.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImage1() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future upload() async {
    if(_image ==null)return;
    String base64=base64Encode(_image.readAsBytesSync());
    String name=_image.path.split("/").last;
    print (name);
    Uri url=Uri.parse("https://alumaracoffe.com/employee/image.php");

    var data={"imagename":name,"image64":base64};
    var response= await http.post(url,body:data);
    print(response);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      drawer: MyDrawer(),
      body:ListView(children:[
        Column(children: [
          RaisedButton(child:Text("get image"),onPressed:getImage1 ,),
          Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(_image),

          ),
          RaisedButton(child:Text("upload image"),onPressed:upload ,),
        ],),

      ],
  )

     /* floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),*/
    );
  }
}