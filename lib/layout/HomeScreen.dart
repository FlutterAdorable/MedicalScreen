import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool firstSelected = false;
  bool secondSelected = false;
  PageController pageController = PageController();
  int moiIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Column(
            children: [
              /// AppBar
              Container(
                child: Row(
                  children: [
                    if (index != 0)
                      IconButton(
                        onPressed: () {
                          if (moiIndex != 0)
                            pageController.animateToPage(--moiIndex, duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Color(0xff69f0ae),
                          size: 30,
                        ),
                      ),
                    if (index == 0)
                      SizedBox(
                        width: 30,
                      ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      data[index]["title"]!,
                      style: TextStyle(
                        color: Color(0xff69f0ae),
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      child: Text(
                        '${index + 1}/${data.length}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff69f0ae),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                color: Color(0xff0c223a),
              ),

              /// body
              Container(
                child: Center(
                  child: Text(
                    data[index]["title"]!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                padding: EdgeInsets.all(10),
                color: Color(0xff69f0ae),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        data[index]["description"]!,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
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
                  children: [
                    Text(
                      '4. Do you have ${data[index]["title"]!}',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Text(
                          'No',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        Radio(
                          value: firstSelected ? true : false,
                          groupValue: true,
                          onChanged: (value) {
                            firstSelected = !firstSelected;
                            secondSelected = false;
                            setState(() {});
                          },
                        ),
                        Text(
                          'Yes',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        Radio(
                          value: secondSelected ? true : false,
                          groupValue: true,
                          onChanged: (value) {
                            firstSelected = false;
                            secondSelected = !secondSelected;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          'You can not go to the previous syntomps',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (moiIndex < data.length - 1)
                                  pageController.animateToPage(++moiIndex,
                                    duration: Duration(milliseconds: 250),
                                    curve: Curves.bounceInOut);
                                firstSelected = false;
                                secondSelected = false;

                              });
                            },
                            child: Text('Next')),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            moiIndex = value;
            print(value);
            setState(() {});
          },
          controller: pageController,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

List<Map<String, String>> data = [
  {
    "title": "itching",
    "description":
        "Itching is an irritating sensation that makes you want to scratch your skin. Sometimes it can feel like pain, but it is different. Often, you feel itchy in one area in your body, but sometimes you may feel itching all over. Along with the itching, you may also have a rash or hives.",
  },
  {
    "title": "shivering",
    "description":
        "Involuntary shaking of the body, as with cold. It is caused by contraction or twitching of the muscles, and is a physiologic method of heat production in humans and other mammals. As a form of aerobic skeletal muscle activity, vigorous shivering uses about as much energy as riding a bicycle or shoveling snow. Weak or debilitated patients tolerate this activity poorly. Patients commonly feel helpless when experiencing contractions of muscles normally under voluntary control. Increased metabolic rate and oxygen demand caused by shivering are particularly stressful for patients with heart or lung disease.",
  },
  {
    "title": "joint_pain",
    "description":
        "Joint pain can be discomfort, pain or inflammation arising from any part of a joint. Including cartilage, bone, ligaments, tendons or muscles. Most commonly, however, joint pain refers to arthritis or arthralgia, which is inflammation or pain from within the joint itself.",
  },
];
