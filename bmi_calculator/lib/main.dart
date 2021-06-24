import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
int _itemCount=48;
int _itemCounter=19;
int c=0;
bool isPressedm=false;
bool isPressedf=false;
double _height= 155.0;
double bmi=0.0;
class MyFlutterApp {
  MyFlutterApp._();

  static const _kFontFam = 'MyFlutterApp';

  static const IconData male = const IconData(0xe800, fontFamily: _kFontFam);
  static const IconData female = const IconData(0xe801, fontFamily: _kFontFam);

}



class BasicCalculator extends StatefulWidget {
    @override
  _BasicCalculatorState createState() => _BasicCalculatorState();



    }
class SecondRoute extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("Calculation", style: TextStyle(fontFamily: 'CaviarDreams', fontWeight: FontWeight.bold),textAlign: TextAlign.center),
      ),
      body:
      Center(
        child: new Container(
          alignment: FractionalOffset.center,
          color: Colors.black,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () => null,
                        child: Text('Your Result',style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 50,
                            fontFamily: 'CaviarDreams',
                            fontStyle: FontStyle.normal,color: Colors.white),),
                        color: Colors.black,
                      ),
                    ],
                  ),

                  ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Card(
                    child: Text('${bmi.toStringAsFixed(1)} kg/m²',style: TextStyle(color: Colors.green,fontFamily: 'CaviarDreams',fontSize: 40)),
                    color: Colors.black,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => null,
                    child:


                    Text('\tNormal',style: TextStyle(color: Colors.green, fontFamily: 'CaviarDreams', fontStyle: FontStyle.normal,fontSize: 25)),
                  color: Colors.black,),
                  ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () => null,
                        child: Text('You have a normal body mass index, good job!',style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 10,
                            fontFamily: 'CaviarDreams',
                            fontStyle: FontStyle.normal,color: Colors.white),),
                        color: Colors.black,
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
          child: Text('Recalculate',textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                fontFamily: 'CaviarDreams',
                fontStyle: FontStyle.normal,color: Colors.black),
          ),
        color: Colors.pinkAccent,
      ),

      );
  }
}
class ThirdRoute extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("Calculation", style: TextStyle(fontFamily: 'CaviarDreams', fontWeight: FontWeight.bold),textAlign: TextAlign.center),
      ),
      body:
      Center(
        child: new Container(
          alignment: FractionalOffset.center,
          color: Colors.black,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () => null,
                        child: Text('Your Result',style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 50,
                            fontFamily: 'CaviarDreams',
                            fontStyle: FontStyle.normal,color: Colors.white),),
                        color: Colors.black,
                      ),
                    ],
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Card(
                    child: Text('${bmi.toStringAsFixed(1)} kg/m²',style: TextStyle(fontFamily: 'CaviarDreams',color: Colors.red,fontSize: 40)),
                    color: Colors.black,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => null,
                    child:


                    Text('Not Normal',style: TextStyle(color: Colors.red, fontFamily: 'CaviarDreams', fontStyle: FontStyle.normal,fontSize: 25)),
                    color: Colors.black,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () => null,
                        child:

                        Text('You don\'t have a normal body mass index. Strive hard!',style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 10,
                            fontFamily: 'CaviarDreams',
                            fontStyle: FontStyle.normal,color: Colors.white),),
                        color: Colors.black
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Recalculate!',textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
              fontFamily: 'CaviarDreams',
              fontStyle: FontStyle.normal,color: Colors.black),
        ),
        color: Colors.pinkAccent,
      ),

    );
  }
}



class _BasicCalculatorState extends State<BasicCalculator> {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            'BMI Calculator',
            style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'CaviarDreams',
                fontStyle: FontStyle.normal),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.pink,
        ), //end of appbar
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () { setState(() {
                      c++;
                      if(c%2==0)
                      isPressedm= false;
                      else
                        {
                        isPressedm=true;
                        isPressedf=false;
                        }
                    }); },
                    child: Icon(
                      MyFlutterApp.male,
                        color:(isPressedm) ? Colors.blue
                            : Colors.white,
                      size: 70,
                    ),
                    color: Colors.black,
                  ),
                  Text('Male', style: TextStyle(color:(isPressedm) ? Colors.blue
                      : Colors.white, fontFamily: 'CaviarDreams', fontWeight: FontWeight.bold,fontSize: 30)),
                ],
              ),
              Column(
                children: <Widget>[
              RaisedButton(
                onPressed: (){ setState(() {
                  c++;
                if(c%2==0)
                  isPressedf= false;
                else {
                  isPressedf = true;
                  isPressedm=false;
                }}); },
                child: Icon(
                  MyFlutterApp.female,
                  color:(isPressedf) ? Colors.pink
                      : Colors.white,
                  size: 70,
                ),
                color: Colors.black,
              ),
              Text('Female',
                  style: TextStyle(color:(isPressedf) ? Colors.pink
                      : Colors.white, fontFamily: 'CaviarDreams', fontWeight: FontWeight.bold, fontSize: 30)),
                ],
              ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Card(
                    child: Text('Height',style: TextStyle(fontFamily: 'CaviarDreams',fontSize: 30,color: Colors.white),),
                    color: Colors.black,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Slider(activeColor: Colors.pink,inactiveColor: Colors.white,
                        min: 10.0,
                        max: 200.0,
                        divisions: 191,
                        onChanged:(newRating) {
                          setState(() => _height = newRating);
                        },
                      value: _height,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 150.0,
                      alignment: Alignment.center,
                      child: Text('${_height.toInt()}cm',
                          style: TextStyle(color: Colors.white,fontSize: 40, fontFamily: 'CaviarDreams')),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => null,
                    child:
                  Text('Weight', style: TextStyle(fontFamily:'CaviarDreams',color: Colors.white, fontWeight: FontWeight.bold,fontSize: 30)),
                  color: Colors.black,
                  ),
                  Text('$_itemCount kg',style: TextStyle(color: Colors.white, fontFamily: 'CaviarDreams', fontWeight: FontWeight.bold)),
                  Row(
                     children: <Widget>[
                      RaisedButton(
                        onPressed: () => setState(()=>_itemCount++),
                        child: Icon(CupertinoIcons.add_circled,
                          color: Colors.white,
                          size: 25,
                        ),
                        color: Colors.black,
                      ),
                      RaisedButton(
                        onPressed: () => setState(()=>_itemCount--),
                        child: Icon(
                          CupertinoIcons.minus_circled,
                          color: Colors.white,
                          size: 25,
                        ),
                        color: Colors.black,
                      ),

                    ],
                  ),


                ],
              ),
              Column(
                children: <Widget>[
              RaisedButton(
                onPressed: () => null,
                child:
              Text('Age',
                  style: TextStyle(fontFamily:'CaviarDreams',color: Colors.white, fontWeight: FontWeight.bold,fontSize: 30)),
              color: Colors.black),
                  Text('$_itemCounter years',style: TextStyle(color: Colors.white, fontFamily: 'CaviarDreams', fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () => setState(()=>_itemCounter++),
                            child: Icon(
                              CupertinoIcons.add_circled,
                              color: Colors.white,
                              size: 25,
                            ),
                            color: Colors.black,
                          ),

                        ],
                      ),
                      Column(
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () => setState(()=>_itemCounter--),
                            child: Icon(
                              CupertinoIcons.minus_circled,
                              color: Colors.white,
                              size: 25,
                            ),
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  )
                ]
              )
                ],
              ),

              ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomAppBar(
            child: RaisedButton(onPressed: () {
              bmi= (_itemCount*10000.0)/(_height*_height);
              if((bmi<25.0)&&(bmi>18.5)) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              }
              else
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdRoute()),
                );
            },
              child: Text(
                'Calculation',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    fontFamily: 'CaviarDreams',
                    fontStyle: FontStyle.normal,color: Colors.black),
              ),
              color: Colors.pinkAccent,
            ),


        ),
      ),
    );
  }
}


void main() {
  runApp(
      MaterialApp(debugShowCheckedModeBanner: false, home:BasicCalculator()));
}

