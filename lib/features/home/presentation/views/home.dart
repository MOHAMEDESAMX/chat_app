import 'package:flutter/material.dart';




class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();


}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Tab(icon: Icon(Icons.back_hand),text: "hello",),
      body: Container(
        margin: const EdgeInsets.all(20),
        width: double.infinity,
        height: 100,
        decoration:const BoxDecoration(color: Colors.black),
        child: const Column(
          children: [
            Icon(Icons.arrow_drop_up_outlined,color: Colors.white,),
            Text("app success",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)
          ],
        )
      ),
    );
  }
}