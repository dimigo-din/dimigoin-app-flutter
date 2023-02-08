import 'package:flutter/material.dart';

import 'package:dimigoin/themes/color_theme.dart';
import 'package:dimigoin/themes/text_theme.dart';

class MealCard extends StatelessWidget {
  final String type;
  final String meal;
  final String time;
  final int index;
  final bool now;
  final Function toggleSchedulePannel;

  const MealCard({
    super.key,
    required this.type, 
    required this.meal,
    required this.time,
    required this.index,
    required this.now,
    required this.toggleSchedulePannel
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 180, // 165
        maxWidth: 340
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: now ? DimigoinColor.DIMI_MAGENTA : Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: now ? const EdgeInsets.only(
              left: 10,
              right: 10
            ) : null,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        type,
                        style: DimigoinTextStyle.T2.copyWith(
                          color: now ? Colors.white : Colors.black
                        )
                      ),
                      GestureDetector(
                        onTap: () => toggleSchedulePannel(index),
                        child: Text(
                          "$time  >",
                          style: DimigoinTextStyle.T6.copyWith(
                            color: now ? Colors.white : DimigoinColor.DIMI_MAGENTA
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15
                      ),
                      // child: Text(
                      //   meal,
                      //   style: DimigoinTextStyle.T5.copyWith(
                      //     color: now ? Colors.white : DimigoinColor.C2,
                      //     fontWeight: FontWeight.w500
                      //   ),
                      // ),
                      child: SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                                strutStyle: const StrutStyle(fontSize: 16),
                                text: TextSpan(
                                  text: meal,
                                  style: DimigoinTextStyle.T5.copyWith(
                                    color: now ? Colors.white : DimigoinColor.C2,
                                    fontWeight: FontWeight.w500
                                  )
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}