import 'package:flutter/material.dart';
import 'package:google_closeby/widgets/buttons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:select_form_field/select_form_field.dart';

import '../models/interests_class.dart';
import '../models/interests_data.dart';
import 'goal_select.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  GlobalKey<ScaffoldState>? _key;
  TextEditingController dateinput = TextEditingController();
  List<Interests>? _companies;
  List<String>? _filters;

  final List<Map<String, dynamic>> _genders = [
    {
      'value': 'Male',
      'label': 'Male',
      'icon': Icon(Icons.male),
      'textStyle': TextStyle(color: Colors.blue),
    },
    {
      'value': 'Female',
      'label': 'Female',
      'icon': Icon(Icons.female),
      'textStyle': TextStyle(color: Colors.pink),
    },
  ];

  @override
  void initState() {
    super.initState();
    dateinput.text = "";
    _key = GlobalKey<ScaffoldState>();

    _filters = <String>[];
    _companies = <Interests>[
      Interests(name: 'Helping Neighbours'),
      Interests(name: 'Paid Tasket'),
      Interests(name: 'Events'),
      Interests(name: 'Free Giveaway'),
      Interests(name: 'Pets'),
      Interests(name: 'Shopping'),
      Interests(name: 'Hangout'),
      Interests(name: 'Gigs'),
      Interests(name: 'Paid/Free trips'),
      Interests(name: 'Books'),
      Interests(name: 'Sports'),
      Interests(name: 'Movies'),
      Interests(name: 'Travel'),
      Interests(name: 'Chatting'),
      Interests(name: 'Baby Sitter'),
      Interests(name: 'Arts'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    String name = " ";
    return Scaffold(
      key: _key,
      backgroundColor: Color(0Xfff5f7fb),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: AppBar(
            backgroundColor: Color(0Xfff5f7fb),
            elevation: 0,
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                highlightColor: Colors.tealAccent,
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back,
                  size: 12.0,
                  color: Colors.black,
                ),
              ),
            )),
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Interests(${_filters!.length})',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.refresh,
                            color: Color(0xff6d9bea),
                          ),
                          Text(
                            'RESET',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Color(0xff6d9bea),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Color(0XFFF5F7FB),
                  child: Column(
                    children: [
                      Wrap(
                        children: companyWidgets.toList(),
                      ),
                      Text('Selected: ${_filters!.join(', ')}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'FIRST NAME',
                      hintText: 'Enter Your First Name'),
                  onChanged: (newText) {
                    name = newText;
                  },
                ),
                Divider(),
                TextField(
                  // focusNode: AlwaysDisabledFocusNode(),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'LAST NAME',
                      hintText: 'Enter Your Last Name'),
                ),
                Divider(),
                TextField(
                  controller: dateinput, //editing controller of this TextField
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.calendar_today),
                      labelText: "Enter Date" //label text of field
                      ),
                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime?.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
                SelectFormField(
                  type: SelectFormFieldType.dropdown, // or can be dialog

                  labelText: 'Gender',
                  items: _genders,
                  onChanged: (val) => print(val),
                  onSaved: (val) => print(val),
                ),
                ContinueButton(
                  onPressed: () {
                    Provider.of<InterestsData>(context, listen: false)
                        .addInterests(name!);

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GoalSelect(
                              context: context,
                              buttonType: ContinueButton(
                                onPressed: () {},
                              ),
                            )));
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Iterable<Widget> get companyWidgets sync* {
    for (Interests company in _companies!) {
      yield Padding(
        padding: const EdgeInsets.all(6.0),
        child: ChoiceChip(
          avatar: CircleAvatar(
            child: Text(company.name[0].toUpperCase()),
          ),
          label: Text(company.name),
          selectedColor: Colors.white,
          backgroundColor: const Color(0XFFF5F7FB),
          labelStyle: TextStyle(color: Colors.black),
          selected: _filters!.contains(company.name),
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                _filters!.add(company.name);
              } else {
                _filters!.removeWhere((String name) {
                  return name == company.name;
                });
              }
            });
          },
        ),
      );
    }
  }
}
