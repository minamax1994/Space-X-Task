import 'package:flutter/material.dart';
import 'package:space_x/theme/app_theme.dart';
import 'package:space_x/ui_components/data_card_item_widget.dart';

class CardDatum {
  final String title;
  final dynamic value;

  CardDatum(this.title, this.value);
}

class DataCardWidget extends StatelessWidget {
  final String label;
  final List<CardDatum> data;

  DataCardWidget({@required this.label, @required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        color: AppColors.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10.0,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(label.toUpperCase(), style: AppStyles.titleStyle),
              ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) => DataCardItemWidget(datum: data[index]),
                padding: EdgeInsets.only(bottom: 5),
                physics: NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
