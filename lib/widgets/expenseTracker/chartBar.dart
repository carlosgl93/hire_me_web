import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentage;

  ChartBar(this.label, this.spendingAmount, this.spendingPercentage);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final isLandscape = mq.orientation == Orientation.landscape;
    return LayoutBuilder(
      builder: (context, constraint) {
        return Column(
          children: [
            // top amount spent for that day text
            isLandscape
                ? Container(
                    // constraints: BoxConstraints.tight(
                    //   Size.fromHeight(mq.size.height * 0.8),
                    // ),
                    height: constraint.maxHeight * 0.1,
                    // width: constraint.maxWidth * 1,
                    child: FittedBox(
                      child: Text(
                        '\$${spendingAmount.toStringAsFixed(0)}',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 0.7),
                      ),
                    ),
                  )
                : Container(
                    // constraints: BoxConstraints.tight(
                    //   Size.fromHeight(mq.size.height * 0.8),
                    // ),
                    height: constraint.maxHeight * 0.1,
                    width: constraint.maxWidth * 0.9,
                    child: FittedBox(
                      child: Text(
                        '\$${spendingAmount.toStringAsFixed(0)}',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 0.7),
                      ),
                    ),
                  ),
            // some space to separate
            SizedBox(
              height: constraint.maxHeight * 0.05,
            ),
            // spent bar
            Container(
              height: constraint.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPercentage,
                    child: Container(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: (constraint.maxHeight * 0.15),
              child: Text(label),
            )
          ],
        );
      },
    );
  }
}
