import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:hire_me/models/petTinder/data.dart';
import 'package:hire_me/widgets/petTinder/likeDislikeCTAs.dart';
import 'package:hire_me/widgets/sharedWidgets/myAppBar.dart';

class CandidateDetail extends StatelessWidget {
  static const routeName = 'candidateDetails';

  // final String? candidateId;
  // final List<String>? candidateImgs;
  // final String? candidateName;
  // final String? candidateDescription;
  // final String? candidateBreed;
  // final int? candidateAge;

  // const CandidateDetail({
  //   this.candidateId,
  //   this.candidateImgs,
  //   this.candidateName,
  //   this.candidateDescription,
  //   this.candidateBreed,
  //   this.candidateAge,
  // });

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final textTheme = Theme.of(context).textTheme;
    final candidateId = ModalRoute.of(context)!.settings.arguments;
    final selectedCandidate = DUMMY_CANDIDATES
        .firstWhere((candidate) => candidate.candidateId == candidateId);

    return Scaffold(
      appBar: MyMaterialAppBar(
        selectedCandidate.candidateName,
        () {},
        Icon(
          Icons.more_horiz,
        ),
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: selectedCandidate.candidateImgs
                .map(
                  (image) => Container(
                    child: Center(
                      child: Image.network(image, fit: BoxFit.cover),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(),
          ),

          Container(
            padding: EdgeInsets.symmetric(
                vertical: mq.size.height * 0.05,
                horizontal: mq.size.width * 0.1),
            child: Row(
              children: [
                Text(
                  selectedCandidate.candidateName +
                      ', ' +
                      selectedCandidate.candidateAge +
                      ', ' +
                      selectedCandidate.candidateBreed,
                  style: textTheme.headline2,
                ),
              ],
            ),
          ),
          // candidate description section
          Container(
            padding: EdgeInsets.symmetric(horizontal: mq.size.width * 0.05),
            child: Text(
              selectedCandidate.candidateDescription,
              style: textTheme.bodyText1,
            ),
          ),
          // like or dislike candidate
          LikeDislikeCTAs(
            mq: mq,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     InkWell(
          //       child: Icon(
          //         Icons.block,
          //         color: Colors.black,
          //         size: mq.textScaleFactor * 10,
          //       ),
          //     ),
          //     InkWell(
          //       child: Icon(
          //         Icons.favorite,
          //         color: Colors.red,
          //         size: mq.textScaleFactor * 10,
          //       ),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
