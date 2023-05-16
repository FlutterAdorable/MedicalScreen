import 'package:flutter/material.dart';
import 'package:untitled/main.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Row(
                    children:
                    [
                      Text('${(index + 1).toString()}.'),
                      SizedBox(width: 10,),
                      Text('${finalChoices[index].title}'),
                      Spacer(),
                      Text('${finalChoices[index].choice}'),
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 10,),
                itemCount: finalChoices.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

