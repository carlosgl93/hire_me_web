import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:hire_me/models/petTinder/candidate.dart';
import 'package:hire_me/widgets/petTinder/candidateDetail.dart';
import '../../models/petTinder/data.dart';

class CandidateItem extends StatelessWidget {
  final int candidateId;
  final String? candidateName;
  final List<String> candidateImgs;
  final String? candidateAge;
  final Gender? candidateGender;
  final String? candidateDescription;
  final String? candidateBreed;

  const CandidateItem({
    required this.candidateId,
    required this.candidateName,
    required this.candidateImgs,
    required this.candidateAge,
    required this.candidateGender,
    this.candidateDescription,
    this.candidateBreed,
  });

  String get genderText {
    switch (candidateGender) {
      case Gender.Male:
        return 'Macho';
      case Gender.Female:
        return 'Hembra';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    void selectCandidate(BuildContext context) {
      Navigator.of(context).pushNamed(
        CandidateDetail.routeName,
        arguments: candidateId,
      );
    }

    final mq = MediaQuery.of(context);
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () => selectCandidate(context),
      child: Card(
        child: Column(
          children: [
            Container(
              child: CarouselSlider(
                items: candidateImgs
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Row(
                children: [
                  Text(
                    '$candidateName, ',
                    style: textTheme.headline2,
                  ),
                  SizedBox(
                    width: mq.size.width * 0.005,
                  ),
                  Text(
                    '$candidateAge años. ',
                    style: textTheme.headline2,
                  ),
                  Text(' $genderText', style: textTheme.headline2),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Text(
                  candidateDescription as String,
                  style: textTheme.bodyText1,
                ),
              ),
            )
          ],
        ),
        // like or dislike CTAs
      ),
    );
  }
}
