import 'dart:math';

import 'package:flutter/material.dart';

class RatingView extends StatefulWidget {
  const RatingView({Key? key}) : super(key: key);

  @override
  State<RatingView> createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  var _ratingPageController = PageController();
  var _starPosition = 200.0;
  var _rating = 0;
  var _selectedChipIndex = -1;
  var _isMoreDetailActive = false;
  var _moreDetailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          //Thanks note
          Container(
            height: max(300, MediaQuery.of(context).size.height * 0.3),
            child: PageView(
              controller: _ratingPageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildThanksNote(),
                _causeOfRating(),
              ],
            ),
          ),
          // DONE Button
          Positioned(
              bottom:0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.red,
                child: MaterialButton(
                  onPressed: _hideDialog(),
                  child: Text('Done'),
                  textColor: Colors.white,
            ),
          )),
          // SKIP Button
          Positioned(
            right: 0,
            child: MaterialButton(
              onPressed: _hideDialog(),
              child: Text('Skip')
          ),
          ),
          //Star Button
          AnimatedPositioned(
            top: _starPosition,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  5,(index) => IconButton(
                icon: index < _rating ? Icon(Icons.star, size: 32) : Icon(Icons.star_border, size :32),
                color: Colors.red,
                onPressed: (){
                  _ratingPageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                  setState(() {
                    _starPosition = 25.0;
                    _rating = index + 1;
                  });
                },
              ),
              ),
            ),
            duration: Duration(milliseconds: 300),
          ),
          // BACK BUTTON
          if(_isMoreDetailActive)
            Positioned(
                left: 0,
                top: 0,
                child: MaterialButton(
                  onPressed: (){
                    setState(() {_isMoreDetailActive = false;
                    });
                  },
                  child: Icon(Icons.arrow_back_ios),
                )
            ),
        ],
      ),
    );
  }
  _buildThanksNote() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Text('Thanks for using BiteRight',
          style: TextStyle(
            fontSize: 24,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text('We\'d love to get your feedback'),
        Text('How was your experience?'),
      ],
    );
  }

  _causeOfRating() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: !_isMoreDetailActive,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('What could be better?'),
                // CAUSE SELECTION
                Wrap(
                  spacing: 8.0,
                  alignment: WrapAlignment.center,
                  children: List.generate(
                      6, (index) => InkWell(
                    onTap: (){
                      setState(() {
                        _selectedChipIndex = index;
                      });
                    },
                    child: Chip(
                        label: Text('Text ${index + 1}'),
                      backgroundColor: _selectedChipIndex == index ? Colors.red : Colors.grey[300],
                    ),
                  ),
                  ),
                ),
                SizedBox(height: 16),
                InkWell(
                  onTap: (){
                    _moreDetailFocusNode.requestFocus();
                    setState(() {
                      _isMoreDetailActive = true;
                    });
                  },
                  child: Text('Want to tell us more?',
                      style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          replacement: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Tell us more'),
              Chip(label: Text('Text ${_selectedChipIndex + 1}')),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  focusNode: _moreDetailFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Write your review here...',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

  }
  _hideDialog(){
    if(Navigator.canPop(context))
      Navigator.pop(context);
  }
}
