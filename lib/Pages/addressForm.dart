import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookstore/Data Layer/bookstoreAPIcall.dart';
import 'package:bookstore/Global/Common/button.dart';
import 'package:bookstore/Global/Common/colorPalet.dart';
import 'package:bookstore/Global/Common/inputTextFieldComp.dart';
import 'package:bookstore/Providers/cartStateProvider.dart';

class Addressform extends StatefulWidget {
  const Addressform({super.key});

  @override
  State<Addressform> createState() => _AddressformState();
}

class _AddressformState extends State<Addressform> {
  int _groupValue = 0;
  Bookstoreapicall _bookstoreapicall = Bookstoreapicall();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();
  TextEditingController _localityController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _landmarkController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 550,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 18),
              child: Text(
                "Coustomer Details",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Inputtextfieldcomp(controller: _nameController, hintText: "Name"),
            Inputtextfieldcomp(
                controller: _phoneController, hintText: "Phone number"),
            Inputtextfieldcomp(
                controller: _pincodeController, hintText: "Pincode"),
            Inputtextfieldcomp(
                controller: _addressController, hintText: "Address"),
            Inputtextfieldcomp(
                controller: _localityController, hintText: "Locality"),
            Inputtextfieldcomp(
                controller: _cityController, hintText: "City/Town"),
            Inputtextfieldcomp(
                controller: _landmarkController, hintText: "State"),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 1),
              child: Text(
                "Type",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Row(
              children: [
                Row(
                  children: [
                    Radio(
                      activeColor: brown,
                      value: 0,
                      groupValue: _groupValue,
                      onChanged: (value) {
                        setState(() {
                          _groupValue = value as int;
                        });
                      },
                    ),
                    Text('Home'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      activeColor: brown,
                      value: 1,
                      groupValue: _groupValue,
                      onChanged: (value) {
                        setState(() {
                          _groupValue = value as int;
                        });
                      },
                    ),
                    Text('Work'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      activeColor: brown,
                      value: 2,
                      groupValue: _groupValue,
                      onChanged: (value) {
                        setState(() {
                          _groupValue = value as int;
                        });
                      },
                    ),
                    Text('Other'),
                  ],
                ),
              ],
            ),
            ButtonComp(
                title: "ADD",
                buttonAction: () async {
                  String type = '';
                  switch (_groupValue) {
                    case 1:
                      type = 'Work';
                      break;
                    case 2:
                      type = 'Other';
                      break;
                    default:
                      type = 'Home';
                  }
                  bool stat = await _bookstoreapicall.EditAddress(
                      type,
                      '${_addressController.text}, ${_localityController.text} - ${_pincodeController.text}',
                      _cityController.text,
                      _landmarkController.text);
                  if (stat) {
                    final _bookcount =
                        Provider.of<Cartstateprovider>(context, listen: false);
                    _bookcount.stateChange();
                    Navigator.pop(context);
                  }
                })
          ],
        ));
  }
}
