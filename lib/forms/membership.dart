import 'dart:io';
import 'dart:typed_data';
import 'package:roboclub_flutter/services/member.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";
import '../helper/dimensions.dart';
import '../widgets/appBar.dart';

class Membership extends StatefulWidget {
  @override
  _MembershipState createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late String _email;
  late String _enrollNo;
  late String _facultyNo;
  bool isPaid = false;
  late String _mobileNo, _collegeName, _course, _yearOfStudy;
  late bool _loading;
  File? file;
  bool filePicked = false;
  String _img = "";

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final enrollController = TextEditingController();
  final facultyNoController = TextEditingController();
  final mobileNoController = TextEditingController();
  final collegeNameController = TextEditingController();
  final courseController = TextEditingController();
  final yearOfStudyController = TextEditingController();

  // upload image

  Future getImage() async {
    await FilePicker.platform
        .pickFiles(
<<<<<<< HEAD
          type: FileType.custom,
          allowedExtensions: ['jpg', 'png', 'pdf'],
          allowCompression: true)
=======
            type: FileType.custom,
            allowedExtensions: ['jpg', 'png', 'pdf'],
            allowCompression: true)
>>>>>>> a1b34d61f41a9de5089179759d47cf885e9c0a7f
        .then((result) async {
      if (result != null) {
        filePicked = true;
        setState(() {
          file = File(result.paths.first!);
        });
      } else {
        file = null;
      }
    }).catchError((error) {
      print("Error: " + error.toString());
    });
  }

  Future saveImg(List<int> asset, String name) async {
    Reference reference = FirebaseStorage.instance.ref().child(name);
    UploadTask uploadTask = reference.putData(Uint8List.fromList(asset));
    _img =
        await (await uploadTask.whenComplete(() => null)).ref.getDownloadURL();
<<<<<<< HEAD
  }

  // get email

  Future<String?> getEmail() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    return googleSignInAccount?.email;
=======
>>>>>>> a1b34d61f41a9de5089179759d47cf885e9c0a7f
  }

  @override
  void initState() {
    super.initState();
    _loading = false;
  }

  @override
  Widget build(BuildContext context) {
    var vpH = getViewportHeight(context);
    var vpW = getViewportWidth(context);
    var members = MemberService();

    // TextFormFiels styling

    final kHintTextStyle = TextStyle(
      color: Color(0xFF757575),
      fontSize: vpH * 0.024,
      fontFamily: 'OpenSans',
    );

    final kLabelStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: vpH * 0.025,
      fontFamily: 'OpenSans',
    );

//     // alert after successful form submission
    Widget okButton = FlatButton(
      child: Text(
        "OK",
        style: kLabelStyle,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

     Widget okButton1 = FlatButton(
      child: Text(
        "OK",
        style: kLabelStyle,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      content: Text(
        "Membership form Submitted Successfully",
        style: kLabelStyle,
      ),
      actions: [
        okButton,
      ],
    );

    AlertDialog fileAlert = AlertDialog(
      content: Text(
        "Select ID Proof",
        style: kLabelStyle,
      ),
      actions: [
        okButton1,
      ],
    );
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: appBar(
          context,
          strTitle: "Registration Details",
          isDrawer: false,
          isNotification: false,
          scaffoldKey: _scaffoldKey,
        ),
        backgroundColor: Color(0xFFC5CAE9),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFC5CAE9),
                Color(0xFF9FA8DA),
                Color(0xFF7986CB),
                Color(0xFF5C6BC0),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        left: vpW * 0.05,
                      right: vpW * 0.05,
                      top: vpH * 0.02,),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Name',
                      style: kLabelStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: vpW * 0.05, vertical: vpH * 0.01),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: nameController,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        fillColor: Color(0xFFE8EAF6),
                        hintText: ' Enter Name',
                        hintStyle: kHintTextStyle,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter name";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _name = value!;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: vpW * 0.05, vertical: vpH * 0.01),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Email',
                      style: kLabelStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: vpW * 0.05, vertical: vpH * 0.01),
                    child: TextFormField(
                      maxLines: null,
                      textCapitalization: TextCapitalization.words,
                      controller: emailController,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        fillColor: Color(0xFFE8EAF6),
                        hintText: ' Enter Email',
                        hintStyle: kHintTextStyle,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter valid email id';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value!;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: vpW * 0.05, vertical: vpH * 0.01),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Enrollment Number',
                      style: kLabelStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: vpW * 0.05, vertical: vpH * 0.01),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: enrollController,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: Color(0xFFE8EAF6),
                        hintText: 'Enter Enrollment No.',
                        hintStyle: kHintTextStyle,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty && value.length != 6) {
                          return 'Please enter valid Enrollment No';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enrollNo = value!;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: vpW * 0.05, vertical: vpH * 0.01),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Faculty Number',
                      style: kLabelStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: vpW * 0.05, vertical: vpH * 0.01),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: facultyNoController,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: Color(0xFFE8EAF6),
                        hintText: 'Enter Faculty No.',
                        hintStyle: kHintTextStyle,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter valid Faculty No';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _facultyNo = value!;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: vpW * 0.05, vertical: vpH * 0.01),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Course',
                      style: kLabelStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: vpW * 0.05, vertical: vpH * 0.01),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: courseController,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: Color(0xFFE8EAF6),
                        hintText: 'Enter Course Name',
                        hintStyle: kHintTextStyle,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the course';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _course = value!;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: vpW * 0.05, vertical: vpH * 0.01),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'College',
                      style: kLabelStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: vpW * 0.05, vertical: vpH * 0.01),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: collegeNameController,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: Color(0xFFE8EAF6),
                        hintText: 'Enter College Name',
                        hintStyle: kHintTextStyle,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your College';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _collegeName = value!;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: vpW * 0.05, vertical: vpH * 0.01),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Year Of Study',
                      style: kLabelStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: vpW * 0.05, vertical: vpH * 0.01),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: yearOfStudyController,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: Color(0xFFE8EAF6),
                        hintText: 'Enter Year Of Study',
                        hintStyle: kHintTextStyle,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your year of study';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _yearOfStudy = value!;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: vpW * 0.05, vertical: vpH * 0.01),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Mobile Number',
                      style: kLabelStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: vpW * 0.05, vertical: vpH * 0.01),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: mobileNoController,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: Color(0xFFE8EAF6),
                        hintText: 'Enter Mobile No',
                        hintStyle: kHintTextStyle,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your mobile number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _mobileNo = value!;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: vpW * 0.05,
                      vertical: vpH * 0.005,
                    ),
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Text(
                          'Pick your ID Proof',
                          style: kLabelStyle,
                        ),
                        IconButton(
                          icon: Icon(Icons.add_a_photo),
                          onPressed: () {
                            getImage();
                          },
                        ),
                        file == null
                        ? Text(
                                'File not Selected.',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: vpH * 0.02,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                'File Selected.',
                                style: TextStyle(
                                  color: Colors.limeAccent[400],
                                  fontSize: vpH * 0.02,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                      ],
                    ),
                  ),
                 _loading
                      ? Container(
                          padding: EdgeInsets.all(15),
                          width: vpW * 0.5,
                          child: RaisedButton(
                            elevation: vpH * 0.5,
                            onPressed: () {},
                            padding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Color(0xFFFF9C01),
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.all(15),
                          width: vpW * 0.5,
                          child: RaisedButton(
                            elevation: vpH * 0.5,
                            onPressed: () async {
                              setState(() {
                                _loading = true;
                              });
                              if (!_formKey.currentState!.validate()) {
                                print("not valid");
                                setState(() {
                                  _loading = false;
                                });
                                return null;
                              } else {
                                if (filePicked) {
                                  await saveImg(
                                    file!.readAsBytesSync(),
                                    'registrionMemebers/${nameController.text}_${mobileNoController.text}',
                                  );
                                  _formKey.currentState!.save();
                                  members.postMember(
                                    enrollNo: _enrollNo,
                                    email: _email,
                                    name: _name,
                                    facultyNo: _facultyNo,
                                    fileUrl: _img,
                                    course: _course,
                                    collegeName: _collegeName,
                                    yearOfStudy: _yearOfStudy,
                                    mobileNo: _mobileNo,
                                    dateOfReg: DateTime.now(),
                                  );
                                  print("saved");
                                  nameController.clear();
                                  emailController.clear();
                                  enrollController.clear();
                                  facultyNoController.clear();
                                  mobileNoController.clear();
                                  collegeNameController.clear();
                                  courseController.clear();
                                  yearOfStudyController.clear();                          

                          showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return alert;
                                    },
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return fileAlert;
                                    },
                                  );
                                }
                                setState(() {
                                  _loading = false;
                                });
                              }
                            },
                         padding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Color(0xFFFF9C01),
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: vpW * 0.005,
                                fontSize: vpH * 0.025,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
