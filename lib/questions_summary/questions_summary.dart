import 'package:flutter/material.dart';
import 'package:adv_basics/questions_summary/summary_item.dart';

class SummaryData extends StatelessWidget{
  const SummaryData(this.summaryData ,{super.key});
  final List<Map<String,Object>>summaryData;
  @override
  Widget build(context){
    return SizedBox(
      height : 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data){
            return SummaryItem(data);
          },
        ).toList(),
      )
      ),
    );
  }
}