import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/color_shade.dart';
import 'form_card.dart';

class FormLoading extends StatefulWidget {
  const FormLoading({
    super.key,
  });

  @override
  State<FormLoading> createState() => _FormLoadingState();
}

class _FormLoadingState extends State<FormLoading>
    with TickerProviderStateMixin {
  late AnimationController _appearanceController;

  late Animation<double> _indicatorSpaceAnimation;

  late Animation<double> _largeBubbleAnimation;

  late AnimationController _repeatingController;
  final List<Interval> _dotIntervals = const [
    Interval(0.25, 0.8),
    Interval(0.35, 0.9),
    Interval(0.45, 1.0),
  ];

  @override
  void initState() {
    super.initState();

    _appearanceController = AnimationController(
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    _indicatorSpaceAnimation = CurvedAnimation(
      parent: _appearanceController,
      curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      reverseCurve: const Interval(0.0, 1.0, curve: Curves.easeOut),
    ).drive(Tween<double>(
      begin: 0.0,
      end: 60.0,
    ));

    _largeBubbleAnimation = CurvedAnimation(
      parent: _appearanceController,
      curve: const Interval(0.3, 1.0, curve: Curves.elasticOut),
      reverseCurve: const Interval(0.5, 1.0, curve: Curves.easeOut),
    );

    _repeatingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _showIndicator();
  }

  @override
  void didUpdateWidget(FormLoading oldWidget) {
    super.didUpdateWidget(oldWidget);

    _showIndicator();
  }

  @override
  void dispose() {
    _appearanceController.dispose();
    _repeatingController.dispose();
    super.dispose();
  }

  void _showIndicator() {
    _appearanceController
      ..duration = const Duration(milliseconds: 750)
      ..forward();
    _repeatingController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _indicatorSpaceAnimation,
      builder: (context, child) {
        return SizedBox(
          height: _indicatorSpaceAnimation.value,
          child: child,
        );
      },
      child: Stack(
        children: [
          AnimatedBubble(
            animation: _largeBubbleAnimation,
            left: 12,
            bottom: 12,
            bubble: StatusBubble(
              repeatingController: _repeatingController,
              dotIntervals: _dotIntervals,
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedBubble extends StatelessWidget {
  const AnimatedBubble({
    super.key,
    required this.animation,
    required this.left,
    required this.bottom,
    required this.bubble,
  });

  final Animation<double> animation;
  final double left;
  final double bottom;
  final Widget bubble;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      bottom: bottom,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform.scale(
            scale: animation.value,
            alignment: Alignment.bottomLeft,
            child: child,
          );
        },
        child: bubble,
      ),
    );
  }
}

class StatusBubble extends StatelessWidget {
  const StatusBubble({
    super.key,
    required this.repeatingController,
    required this.dotIntervals,
  });

  final AnimationController repeatingController;
  final List<Interval> dotIntervals;

  @override
  Widget build(BuildContext context) {
    return FormCard(
      widget: Container(
        width: 60,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlashingCircle(
              index: 0,
              repeatingController: repeatingController,
              dotIntervals: dotIntervals,
            ),
            FlashingCircle(
              index: 1,
              repeatingController: repeatingController,
              dotIntervals: dotIntervals,
            ),
            FlashingCircle(
              index: 2,
              repeatingController: repeatingController,
              dotIntervals: dotIntervals,
            ),
          ],
        ),
      ),
    );
  }
}

class FlashingCircle extends StatelessWidget {
  const FlashingCircle({
    super.key,
    required this.index,
    required this.repeatingController,
    required this.dotIntervals,
  });

  final int index;
  final AnimationController repeatingController;
  final List<Interval> dotIntervals;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: repeatingController,
      builder: (context, child) {
        final circleFlashPercent = dotIntervals[index].transform(
          repeatingController.value,
        );
        final circleColorPercent = sin(pi * circleFlashPercent);

        final brightColor = Theme.of(context).colorScheme.onPrimary;
        final darkColor = Theme.of(context).colorScheme.primary.shade400;

        return Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.lerp(
              darkColor,
              brightColor,
              circleColorPercent,
            ),
          ),
        );
      },
    );
  }
}
