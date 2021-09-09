import 'package:flutter/material.dart';
import 'package:hire_me/widgets/petTinder/candidateItem.dart';

import '../../models/petTinder/data.dart';

class CandidatesStack extends StatefulWidget {
  const CandidatesStack({Key? key}) : super(key: key);

  @override
  CandidatesStackState createState() => CandidatesStackState();
}

class CandidatesStackState extends State<CandidatesStack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: DUMMY_CANDIDATES
          .map((candidate) => CandidateItem(
                candidateId: candidate.candidateId,
                candidateName: candidate.candidateName,
                candidateImgs: candidate.candidateImgs,
                candidateAge: candidate.candidateAge,
                candidateGender: candidate.candidateGender,
                candidateDescription: candidate.candidateDescription,
              ))
          .toList(),
    );
  }
}
