import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff69f0ae),
          ),
        ),
        title: Text(
          'General Health Checking',
          style: TextStyle(color: Color(0xff69f0ae)),
        ),
        actions: [
          TextButton(
            child: Text(
              '4/132',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff69f0ae),
              ),
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Color(0xff0c223a),
      ),
      body: Column(
        children: [
          Container(
            child: Center(
              child: Text('Continuous Sneezing', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
            ),
            padding: EdgeInsets.all(10),
            color: Color(0xff69f0ae),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children:
              [
                Expanded(
                  child: Text('Nonallergic rhinitis involves chronic sneezing or a congested, drippy nose with no apparent cause. Nonallergic rhinitis symptoms are similar to'
              'those of hay fever (allergic rhinitis), but with none of the usual evidence of an allergic reaction. '
    'Nonallergic rhinitis can affect children and adults.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),),
                ),
                Image(image: AssetImage('assets/images/helper.JPG')),
              ],
            ),
          ),
          Spacer(),
          Container(
            color: Color(0xff69f0ae),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
            [
              Text('4. Do you have Continuous Sneezing?',style: TextStyle(fontSize: 18,),),
              Row(
                children: [
                  Spacer(),
                  Text('No',style: TextStyle(fontSize: 17,),),
                  Radio(value: false, groupValue: true, onChanged: (value) {},),
                  Text('Yes',style: TextStyle(fontSize: 17,),),
                  Radio(value: false, groupValue: true, onChanged: (value) {},),
                ],
              ),
              SizedBox(height: 20,),
              Row(children:
              [
                Text('You can not go to the previous syntomps', style: TextStyle(
                  fontSize: 16,
                ),),
                SizedBox(width: 10,),
                ElevatedButton(onPressed: (){}, child: Text('Next')),
              ],),
            ],),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
