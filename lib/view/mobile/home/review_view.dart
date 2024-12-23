import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/custom_text.dart';
import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/utils/static_data.dart';
import 'package:bete_tselot_web/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppReviewView extends StatelessWidget {
  const AppReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.w),
      child: Column(
        children: [
          Column(
            children: [
              CustomText(
                StringUtils.yourReviews,
                fontSize: 15.sp,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                color: ColorUtils.grey99,
              ),
              SizedBox(
                height: 10.w,
              ),
              CustomText(
                StringUtils.trustedByThousands,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: ColorUtils.black29,
              ),
              SizedBox(
                height: 10.w,
              ),
              RichText(
                text: TextSpan(
                  text: StringUtils.fourPointNine,
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w800,
                    color: ColorUtils.primaryColor,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: StringUtils.outOf5,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: ColorUtils.greyaa,
                          fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.w,
              ),
              CustomText(
                StringUtils.ratings,
                fontSize: 14.sp,
                textAlign: TextAlign.center,
                fontFamily: FontUtils.poppins,
                fontWeight: FontWeight.normal,
                color: ColorUtils.black77,
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                TestimonialsList.testimonials.length,
                    (index) => SizedBox(
                  width: 350.w,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: ColorUtils.grey2a.withOpacity(0.2),
                                offset: const Offset(0, 10),
                                blurRadius: 10)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: List.generate(
                                    5,(index) {
                                      return Icon(
                                        Icons.star,
                                        color: ColorUtils.primaryColor,
                                        size: 20.w,
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Expanded(
                                    child: CustomText(
                                      TestimonialsList.testimonials[index]['name'] ?? "",
                                      fontWeight: FontWeight.bold,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.end,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 8.w,
                            ),
                            CustomText(
                              TestimonialsList.testimonials[index]['feedback'] ?? "",
                              fontSize: 12.sp,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
