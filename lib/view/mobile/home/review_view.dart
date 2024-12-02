import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/custom_text.dart';
import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/utils/static_data.dart';
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
                'Your REVIEWS',
                fontSize: 15.sp,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                color: ColorUtils.grey99,
              ),
              SizedBox(
                height: 10.w,
              ),
              CustomText(
                'Trusted by thousands',
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: ColorUtils.black29,
              ),
              SizedBox(
                height: 10.w,
              ),
              RichText(
                text: TextSpan(
                  text: '4.9',
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w800,
                    color: ColorUtils.primaryColor,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' out of 5',
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
                '600,000+ ratings. Here are just some of the kind words we\nhave received.',
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
                                offset: Offset(0, 10),
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
                                    5,
                                        (index) {
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
          // CarouselSlider(
          //   items:
          //   testimonials.map((testimonial) {
          //     return Container(
          //       padding: const EdgeInsets.all(16),
          //       margin: const EdgeInsets.symmetric(horizontal: 8),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(12),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.grey.withOpacity(0.5),
          //             spreadRadius: 2,
          //             blurRadius: 5,
          //             offset: const Offset(0, 3),
          //           ),
          //         ],
          //       ),
          //       child: Text(
          //         testimonial,
          //         style: const TextStyle(fontSize: 16),
          //         textAlign: TextAlign.center,
          //       ),
          //     );
          //   }).toList(),
          //   options: CarouselOptions(
          //     // aspectRatio: 16 / 6, // Adjust aspect ratio as needed
          //     viewportFraction: 0.1, // Adjust the visible fraction of items
          //     initialPage: 0,
          //     enableInfiniteScroll: true,
          //     autoPlay: false,
          //     autoPlayInterval: const Duration(seconds: 3),
          //     autoPlayAnimationDuration: const Duration(milliseconds: 800),
          //     autoPlayCurve: Curves.fastOutSlowIn,
          //     enlargeCenterPage: false,
          //     scrollDirection: Axis.horizontal,
          //   ),
          // ),
          //     // CarouselSlider(
          //     //     items: [
          //     //       Container(
          //     //         // width: 250,
          //     //         color: Colors.red,
          //     //         child: Text("hjzghjxbcbxzh bxjkbjkvbj njkxcnjkv nvxjkcbgjkv mnjcxjkv nxjkcv"),
          //     //       )
          //     //     ],
          //     //     options: CarouselOptions(
          //     //       aspectRatio: 16/2,
          //     //       viewportFraction:
          //     //       0.1,
          //     //       initialPage: 0,
          //     //       enableInfiniteScroll: true,
          //     //       reverse: false,
          //     //       autoPlay: false,
          //     //       autoPlayInterval:
          //     //       const Duration(seconds: 3),
          //     //       autoPlayAnimationDuration:
          //     //       const Duration(milliseconds: 800),
          //     //       autoPlayCurve: Curves.fastOutSlowIn,
          //     //       enlargeCenterPage: false,
          //     //       // enlargeFactor: 0.3,
          //     //       onPageChanged: (index, reason) {
          //     //         /*setState(() {
          //     //               _currentIndex = index;
          //     //             });*/
          //     //       },
          //     //       scrollDirection: Axis.horizontal,
          //     //     )),
        ],
      ),
    );
  }
}
