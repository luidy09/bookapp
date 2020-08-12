import 'package:bookapp/app/components/custom_slider_thumb_circle.dart';
import 'package:bookapp/app/services/sql/db_helper.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final double sliderHeight;
  final void Function(double value) onChanged;
  final void Function() increase;
  final void Function() decrease;
  final int min;
  final int max;
  final fullWidth;
  final value;
  final List<Color> colors;

  CustomSlider(
      {this.colors,
      this.value,
      this.onChanged,
      this.increase,
      this.decrease,
      this.sliderHeight = 48,
      this.max = 10,
      this.min = 0,
      this.fullWidth = false});

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  DBHelper dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
  }

  @override
  Widget build(BuildContext context) {
    // print("BOOKSTATE percent VALUE IS ${widget.bookState.percent}");

    double paddingFactor = .2;

    if (this.widget.fullWidth) paddingFactor = .03;

    return Container(
      width: this.widget.fullWidth
          ? double.infinity
          : (this.widget.sliderHeight) * 5.5,
      height: (this.widget.sliderHeight),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(
          Radius.circular((this.widget.sliderHeight * .3)),
        ),
        gradient: new LinearGradient(
            colors: (widget.colors.length >= 2)
                ? widget.colors
                : [
                    const Color(0xFF00c6ff),
                    const Color(0xFF0072ff),
                  ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 1.00),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(this.widget.sliderHeight * paddingFactor,
            2, this.widget.sliderHeight * paddingFactor, 2),
        child: Row(
          children: <Widget>[
            InkWell(
              splashColor: Colors.white.withOpacity(.5),
              onTap: widget.decrease,
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    //   color: Colors.white.withOpacity(.5),
                    shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    '-',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: this.widget.sliderHeight * .5,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: this.widget.sliderHeight * .05,
            ),
            Expanded(
              child: Center(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white.withOpacity(1),
                    inactiveTrackColor: Colors.white.withOpacity(.5),

                    trackHeight: 4.0,
                    thumbShape: CustomSliderThumbCircle(
                      thumbRadius: this.widget.sliderHeight * .4,
                      min: this.widget.min,
                      max: this.widget.max,
                    ),
                    overlayColor: Colors.white.withOpacity(.4),
                    //valueIndicatorColor: Colors.white,
                    activeTickMarkColor: Colors.white,
                    inactiveTickMarkColor: Colors.red.withOpacity(.7),
                  ),
                  child: Slider(
                      value: widget.value,
                      onChanged: (value) {
                        widget.onChanged(value);
                      }),
                ),
              ),
            ),
            SizedBox(
              width: this.widget.sliderHeight * .05,
            ),
            InkWell(
              onTap: widget.increase,
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  //color: Colors.white.withOpacity(.5),
                  shape: BoxShape.circle,
                  /*image: DecorationImage(
                        image: AssetImage("assets/images/decrease.png"))*/
                ),
                child: Center(
                  child: Text(
                    '+',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: this.widget.sliderHeight * .4,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
