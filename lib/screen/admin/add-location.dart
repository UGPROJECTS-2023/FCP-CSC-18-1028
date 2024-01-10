import 'dart:async';
import 'dart:io';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

import '../../component/constant.dart';
import '../../component/inputs.dart';

class PostLocation extends StatefulWidget {
  const PostLocation({Key? key}) : super(key: key);

  @override
  State<PostLocation> createState() => _PostLocationState();
}

class _PostLocationState extends State<PostLocation> {
  final _formKey = GlobalKey<FormState>();
  bool processing = false;
  List<String> items = [
    "Select Arrival",
    "Abuja",
    "Lagos",
    "Anambra",
    "Kano",
    "Katsina",
    "Kaduna"
  ];
  String? selectedItem = "Select Arrival";

  List<String> items2 = [
    'Select departure',
    "Kano",
    "Kaduna",
    "Abuja",
    "Zaria",
    "Yola",
    "Platenue"
  ];
  String? departureItem = "Select departure";

  List<String> items3 = [
    'Select class',
    "Economic Class",
    "Business Class",
    "First Class"
  ];
  String? classItem = "Select class";

  List<String> items4 = [
    'Select flexibility',
    "Travel flexibility",
    "Airport flexibility",
  ];

  File? image;
  final picker = ImagePicker();

  // String? selected = "Item status";
  bool isLoading = false;
  bool _processing = false;
  TextEditingController name = new TextEditingController();
  TextEditingController amount = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController loading_capacity = new TextEditingController();
  // TextEditingController username = new TextEditingController();

  Future pickGallery() async {
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedImage!.path);
    });
  }

  String? action;
  DateTime? expireDate;
  DateTime? dateTime;
  var seller_id;

  Future<void> registerUser() async {
    ToastContext().init(context);
    SharedPreferences pred = await SharedPreferences.getInstance();
    setState(() {
      seller_id = pred.getString("seller_id");
    });
    if (selectedItem == "Item status" || image == null) {
      warningAlert(context, "Fileds are required");
      // action = "field is required";
    } else {
      // action = "field is required";
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        setState(() {
          processing = true;
        });

        var connectedResult = await Connectivity().checkConnectivity();
        if (connectedResult == ConnectivityResult.mobile ||
            connectedResult == ConnectivityResult.wifi) {
          setState(() {
            isLoading = true;
          });
          isLoading ? loadingAlert(context) : Navigator.of(context).pop();

          Timer(Duration(seconds: 3), () {});

          final uri = Uri.parse(myurl);
          var request = http.MultipartRequest("POST", uri);
          request.fields['request'] = "ADD LOCATIONS";
          request.fields['name'] = name.text;
          request.fields['description'] = description.text;

          var pic = await http.MultipartFile.fromPath("image", image!.path);
          request.files.add(pic);
          var response = await request.send();
          if (response.statusCode != 200) {
            setState(() {
              isLoading = false;
            });
            !isLoading
                ? Navigator.of(context).pop('dialog')
                : loadingAlert(context);
            Toast.show("Record record already exit, pls try again",
                duration: Toast.lengthShort, gravity: Toast.bottom);
            successAlert(context, "Location has been registered successful");
          } else {
            setState(() {
              isLoading = false;
            });
            !isLoading
                ? Navigator.of(context).pop('dialog')
                : loadingAlert(context);
            setState(() {
              isLoading = true;
            });
            successAlert(context, "Location has been registered successful");
            name.clear();
            amount.clear();
            description.clear();
          }
        } else {
          _Connectivity();
        }
        setState(() {
          processing = false;
        });
      }
    }
  }

  // String? name;
  // profile() async {
  //   SharedPreferences pred = await SharedPreferences.getInstance();
  //   setState(() {
  //     name = pred.getString("name");
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // profile();
  }

  void _Connectivity() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Row(
            children: <Widget>[
              new Icon(Icons.cancel, size: 30.0, color: Colors.deepOrange[200]),
              SizedBox(
                width: 20.0,
              ),
              new Text("No Internet Connection!"),
            ],
          ),
        );
      },
    );
  }

  void _actionsDialog(icon, color, title) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Row(
            children: <Widget>[
              new Icon(icon, size: 30.0, color: color),
              SizedBox(
                width: 20.0,
              ),
              new Text(title),
            ],
          ),
        );
      },
    );
  }

  void _Validation(String txt, icons) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Row(
            children: <Widget>[
              new Icon(icons, size: 30.0, color: Colors.deepOrange[200]),
              SizedBox(
                width: 20.0,
              ),
              new Text(txt),
            ],
          ),
        );
      },
    );
  }

  List<DateTime?> _dates = [
    DateTime.now(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        centerTitle: true,
        // automaticallyImplyLeading: false,
        backgroundColor: kDefault,
        title: Text(
          "Add new Location",
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      color: kWhiteSmoke,
                      child: Center(
                        child: Text("Registration Guide",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                    ),
                  ),
                  sizedBox,
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Location Name",
                      style: TextStyle(),
                    ),
                  ),
                  Inputs(
                    obsecure: false,
                    // hint: "Flight name ",
                    controller: name,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "name is required";
                      }
                    },
                    icon: Icon(Icons.map),
                  ),
                  sizedBox,
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Location Image",
                      style: TextStyle(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: OutlinedButton(
                        onPressed: () {
                          pickGallery();
                        },
                        child: Row(
                          children: [
                            Icon(Icons.camera_alt_outlined, size: 25),
                            SizedBox(width: 10),
                            image == null
                                ? Text("Upload Location Image",
                                    style: TextStyle(color: kDefault))
                                : Text("Image Uploaded successful",
                                    style: TextStyle(color: Colors.green)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // sizedBox,
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 8.0),
                  //   child: Text(
                  //     "Price Per Sit",
                  //     style: TextStyle(),
                  //   ),
                  // ),
                  // Inputs(
                  //   obsecure: false,
                  //   // hint: "Price Per Sit",
                  //   controller: amount,
                  //   keyboardType: TextInputType.number,
                  //   validator: (value) {
                  //     if (value.isEmpty) {
                  //       return "Amount is required";
                  //     }
                  //   },
                  //   icon: Icon(Icons.money_outlined),
                  // ),
                  // sizedBox,
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 8.0),
                  //   child: Text(
                  //     "Loading Capacity",
                  //     style: TextStyle(),
                  //   ),
                  // ),
                  // Inputs(
                  //   obsecure: false,
                  //   // hint: "Loading Capacity",
                  //   controller: loading_capacity,
                  //   keyboardType: TextInputType.number,
                  //   validator: (value) {
                  //     if (value.isEmpty) {
                  //       return "Loading capacity";
                  //     }
                  //   },
                  //   icon: Icon(Icons.money_outlined),
                  // ),
                  sizedBox,
                  sizedBox,
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: TextFormField(
                            keyboardType: TextInputType.name,
                            maxLines: 5,
                            controller: description,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Field is required";
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10.0),
                              hintText: " Write location description here...",
                              // labelText: hint,
                              border: OutlineInputBorder(),
                            )),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // Offset of the shadow
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            registerUser();
                          } as void Function()?,
                          style: ElevatedButton.styleFrom(
                            elevation: 0, // Remove default button elevation
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            primary: Colors.blue, // Set button background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Add new location",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ),
                  sizedBox,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
