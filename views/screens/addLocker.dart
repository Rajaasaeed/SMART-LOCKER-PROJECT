
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/lockerProvider.dart';
import '../../models/locker.dart';
import '../widgets/appBar.dart';
import '../widgets/buttonWithoutIcon.dart';
import 'chooseLockerInvestor2.dart';


class AddLOckerScreen extends StatefulWidget {
   AddLOckerScreen({Key? key}) : super(key: key);

  @override
  State<AddLOckerScreen> createState() => _AddLOckerScreenState();
}

class _AddLOckerScreenState extends State<AddLOckerScreen> {
  TextEditingController buildeTextController=new TextEditingController();
  TextEditingController fllorNumberTextController=new TextEditingController();
  TextEditingController lockerRowTextController=new TextEditingController();
  TextEditingController lockerColTextController=new TextEditingController();
  TextEditingController roomLockerPriceTextController=new TextEditingController();
var items=['build1','build2','build3','build4'];

String dropValue='build1';

  @override
  Widget build(BuildContext context) {
        final lockerProvider=Provider.of<LockerProvider>(context);
        
    double width = MediaQuery.of(context).size.width;
    double tobPadding = MediaQuery.of(context).padding.top;
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    double height = MediaQuery.of(context).size.height;

    return CupertinoPageScaffold(
        child: Container(
      child: Column(
        children: [
             const CustomeAppBar(
            icon: Icons.arrow_back_ios,
           title: 'Add locker',
           isHome: false),

         
         Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20,bottom: 0),
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/backGround.jpg'),
                fit: BoxFit.cover,
              )),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Build'),
                    SizedBox(height: 7,),
                    Material(
                      child: Padding(
                      
                        padding: const EdgeInsets.symmetric( horizontal: 8.0),
                        child: SizedBox(
                          
                          height: 40,
                          width: width*0.90,
                          child: DropdownButton(
                            icon: Icon(Icons.keyboard_arrow_down),
                            value: dropValue,
                            items: items.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item));
                          
                          }).toList(), 
                          onChanged: (String? selectValue){
                          setState(() {
                          dropValue=selectValue!;
                          buildeTextController.text=selectValue;
                          });
                          }),
                        ),
                      ),
                    ),
                   
                  SizedBox(height: 20,),
                  
                    Text('fllor number'),
                    SizedBox(height: 7,),
                    SizedBox(
                      height: 40,
                      child: CupertinoTextField(
                        controller: fllorNumberTextController,
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.number,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                    
                        border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                    
                      ),
                    ),
                     SizedBox(height: 40,),
          
                     Row(
                      children: [
          
                        Column(
                          children: [
          Text('row number'),
          SizedBox(height: 5,),
          SizedBox(
                      height: 40,
                      width: width*0.20,
                      child: CupertinoTextField(
                        controller: lockerRowTextController,
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.number,
                        placeholderStyle: TextStyle(fontSize: 25),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                        border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                    
                      ),
                    ),
                          ],
                        )
          
                        ,
                        SizedBox(width: width*0.20,),
                         Column(
                          children: [
                            Text('column number'),
          SizedBox(height: 5,),
          SizedBox(
                      height: 40,
                      width: width*0.20,
                      child: CupertinoTextField(
                        controller: lockerColTextController,
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.number,
                        placeholderStyle: TextStyle(fontSize: 25),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                        border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                    
                      ),
                    ),
                          ],
                        )
                      ],
                     ),
 SizedBox(height: 20,),
                  
                    Text('room Locker price in day'),
                    SizedBox(height: 7,),
                    SizedBox(
                      height: 40,
                      child: CupertinoTextField(
                        controller:roomLockerPriceTextController,
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.number,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                        border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                    
                      ),
                    ),

                    SizedBox(height: height*0.1,),
                  !lockerProvider.addLoade? Center(
                      child: MyButtonWithoutIcon(
                        backColor:const Color.fromARGB(255, 202, 176, 176), 
                          textColor: Colors.black, txt:'Send Request', 
                          onPrs: (){
LockerModel lockerModel=LockerModel(
  lockerId: '11', 
  buildId: buildeTextController.text, 
  invistorId: '1', 
  floorNumber: int.parse(fllorNumberTextController.text), 
  row: int.parse(lockerRowTextController.text),
   col: int.parse(lockerColTextController.text),
    roomPrice: int.parse(roomLockerPriceTextController.text), 
    status: 'notAccept',
    );
 lockerProvider.addLockerRequest(lockerModel);
 buildeTextController.text='';
 fllorNumberTextController.text='';
 lockerRowTextController.text='';
 lockerColTextController.text='';
 roomLockerPriceTextController.text='';
 
     Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>  ChooseLockerInvestor2()));
                    

                          },
                          buttonWidth:250
                          ),
                    ):Center(
                      child: CupertinoActivityIndicator(
                      animating: true,
                      radius: 20,
                      color: Colors.black,)),
              
                  ],
                ),
              )
              
              
                 
            ),
          ),
        ],
      ),
    ));
  }
}
