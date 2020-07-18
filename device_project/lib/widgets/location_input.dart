import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  
  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async{
    final location = await Location().getLocation();
    print(location.latitude);
    print(location.longitude);
  
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
      Container(
        height: 170,
        width: double.infinity,
        decoration: BoxDecoration(
          border:Border.all(
            width: 1,
            color: Colors.grey
            )
          ),
        alignment: Alignment.center,
        child: _previewImageUrl == null 
        ? Text("No Location Chosen", textAlign : TextAlign.center)
        : Image.network(_previewImageUrl, 
        fit: BoxFit.cover, 
        width: double.infinity,)
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          FlatButton.icon(icon: Icon(Icons.location_on),
          label: Text('Current Location'),
          textColor: Theme.of(context).primaryColor,
          onPressed: _getCurrentUserLocation,),

          FlatButton.icon(icon: Icon(Icons.location_on),
          label: Text('Select on Map'),
          textColor: Theme.of(context).primaryColor,
          onPressed: (){},)
        ],)
      ]

    );
  }
}