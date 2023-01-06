
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MySlots extends StatefulWidget {
  final  value;
  final  SlotBook;
  final chargingPointId;
  const MySlots({Key? key, this.value, this.SlotBook, this.chargingPointId}) : super(key: key);

  @override
  State<MySlots> createState() => _MySlotsState();
}

class _MySlotsState extends State<MySlots>with TickerProviderStateMixin {

  //List<String> _options = widget.SlotBook.slotDateAndTime;

   int _selectedIndex=0;
  Widget _buildChips() {
    List<String> _options=[];
    for (int i = 0; i < widget.SlotBook.slotDateAndTime.length; i++) {
      print("in for");
      print(widget.SlotBook.slotDateAndTime);
    _options.add(widget.SlotBook.slotDateAndTime);
    }

  /*  for (int i = 0; i <3; i++) {
      _options.add("a");
    }*/
     print ("hello");

    print(_options);
    print(_options.length);

    List<Widget> chips = [];

    for (int i = 0; i < _options.length; i++) {
     // var d=widget.SlotBook.slotDateAndTime[i];
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex == i,
       // label: Text(_options[i], style: const TextStyle(color: Colors.white)),
        label: Text(_options[i], style: const TextStyle(color: Colors.white)),
        //avatar: FlutterLogo(),
        elevation: 10,
        pressElevation: 5,
        shadowColor: Colors.teal,
        backgroundColor: Colors.black54,
        selectedColor: Colors.blue,
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _selectedIndex = i;
            }
          });
        },
      );

      chips.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: choiceChip
      ));
    }

    return Expanded(
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.vertical,
        children: chips,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Container(
              //  margin: const EdgeInsets.symmetric(horizontal: 5),
                width: size.width * 0.35,
                height: size.height * 0.50,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(8),
                ),
                /*height: 30,*/
                child: _buildChips(),
              ),
            ],
          )
      ),
    );
  }
}

/*
Row(
children: [
GridTile(
child: Text(
"${widget.SlotBook.slotAvailability}",
style: const TextStyle(
color: Colors.black,
fontSize: 15,
fontWeight: FontWeight.bold),
).marginOnly(top: 50, left: 2, right: 1),*/
