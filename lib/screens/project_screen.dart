import 'package:flutter/material.dart';
import 'package:roboclub_flutter/widgets/appBar.dart';
import 'package:roboclub_flutter/widgets/comp_projects_card.dart';
import 'package:roboclub_flutter/widgets/drawer.dart';

import 'package:roboclub_flutter/widgets/ongoing_projects_card.dart';
import '../helper/dimensions.dart';


class ProjectScreen extends StatefulWidget {
  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _ongoingPressed = false;
  @override
  Widget build(BuildContext context) {
    var vpH = getViewportHeight(context);
    var vpW = getViewportWidth(context);
   
    var textStyle = TextStyle(fontSize:18.0,fontWeight: FontWeight.bold);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: appdrawer(context, page: "Projects"),
        appBar: appBar(
          context,
          strTitle: "Projects",
          isDrawer: true,
          isNotification: false,
          scaffoldKey: _scaffoldKey,
        ),
        body: SingleChildScrollView(
          child:Column(
            children:[
            Padding(padding: EdgeInsets.all(15.0),
            child:Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               Expanded(
                  child: FlatButton(
                  child: Text('Completed',style:textStyle),
                  textColor: !_ongoingPressed ? Colors.white: Colors.black,
                  color: !_ongoingPressed ? Theme.of(context).primaryColor : Colors.white,
                  onPressed: () => {
                    setState(() {
                      _ongoingPressed = false;
                      print(_ongoingPressed);
                    })
                   },
                  ),
                  ),
                
                Expanded(
                 child: FlatButton(
                    child: Text('Ongoing',style: textStyle),
                    textColor: _ongoingPressed ? Colors.white: Colors.black,
                    color: _ongoingPressed ? Theme.of(context).primaryColor : Colors.white,
                    onPressed: () => {
                      setState(() {
                        _ongoingPressed = true;
                         print(_ongoingPressed);
                      })
                    },
                  ),
                    ),
              ],)
              ),
             SizedBox(
                height: vpH * 0.005,   
              ),
              Container(
                height: vpH *0.8,
                width: vpW,
                child: _ongoingPressed 
                    ? ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return OngoingProjectCard();
                        },  
                      )
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return CompletedProjectCard();
                        },  
                      )
              )
          ])
        )
      ),
    );
  }
}
