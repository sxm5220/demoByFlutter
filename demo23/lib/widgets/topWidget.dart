import 'dart:math' as math;

import 'package:demo23/widgets/stacked_row.dart';
import 'package:flutter/material.dart';

import '../models/trip_data.dart';

class TopWidget extends StatefulWidget {
  const TopWidget({super.key, required this.data, required this.offset});
  final TripData data;
  final double offset;

  @override
  State<TopWidget> createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // print("🦐top:${widget.data.id} -${widget.data.user.uid}");
    double gauss = math.exp(-(math.pow((widget.offset.abs() - 0.5), 2) / 0.05));
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.zero,
        child: Stack(
          alignment: Alignment.center,
          children: [
            //下层
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              bottom: 10,
              width: isExpanded ? 210 : 200,
              height: 230,
              child: BottomAnimateWidget(
                gauss: gauss,
                data: widget.data,
                offset: widget.offset,
              ),
            ),
            //上层
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              bottom: isExpanded ? 55 : 10,
              child: GestureDetector(
                // onPanUpdate: onPanUpdate, //上拉、下拉
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: TopAnimateWidget(
                  data: widget.data,
                  offset: widget.offset,
                  gauss: gauss,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }*/
}

class TopAnimateWidget extends StatefulWidget {
  const TopAnimateWidget(
      {super.key,
      required this.gauss,
      required this.data,
      required this.offset});
  final double gauss;
  final TripData data;
  final double offset;

  @override
  State<TopAnimateWidget> createState() => _TopAnimateWidgetState();
}

class _TopAnimateWidgetState extends State<TopAnimateWidget> {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(widget.gauss * widget.offset.sign, 0),
      child: SizedBox(
        //padding: EdgeInsets.symmetric(vertical: 10),
        height: 230,
        width: 200,
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 1),
            ],
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Stack(
            children: [
              /*Hero(
              tag: 'bg${data.id}',
              child: */
              /*Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(data.imagePath),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.darken),
                  ),
                ),
              ),*/
              // ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  width: double.infinity,
                  widget.data.imagePath,
                  alignment: Alignment(-widget.offset.abs(), 0),
                  fit: BoxFit.none,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*Hero(
                      tag: 'date${data.id}',
                      child:*/
                      Text(
                        widget.data.date,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      // ),
                      const SizedBox(height: 5),
                      FractionallySizedBox(
                        widthFactor: 0.8,
                        child: /* Hero(
                        tag: 'title${data.id}',
                        child:*/
                            Text(
                          widget.data.title,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),

                        //),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomAnimateWidget extends StatefulWidget {
  const BottomAnimateWidget(
      {super.key,
      required this.gauss,
      required this.data,
      required this.offset});
  final double gauss;
  final TripData data;
  final double offset;

  @override
  State<BottomAnimateWidget> createState() => _BottomAnimateWidgetState();
}

class _BottomAnimateWidgetState extends State<BottomAnimateWidget> {
  @override
  Widget build(BuildContext context) {
    var currentIsDark = Theme.of(context).brightness == Brightness.dark;
    return Transform.translate(
      offset: Offset(-10 * widget.gauss * widget.offset.sign, 0),
      child: Container(
        decoration: BoxDecoration(
          color: currentIsDark ? Colors.white : Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(8),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: StackedRow(
              items: widget.data.userList
                  .map(
                    (user) => /*Hero(
                                  tag: "user${widget.data.id}${user.uid}",
                                  child:*/
                        CircleAvatar(
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                          radius: 13, backgroundImage: NetworkImage(user.img)),
                    ),
                    //),
                  )
                  .toList(),
              size: 30,
              direction: TextDirection.rtl,
              xShift: 15,
            ),
          ),
        ),
      ),
    );
  }
}
