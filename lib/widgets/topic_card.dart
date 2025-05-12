
import 'package:clean_architecture_bloc/core/extensions/build_context_extension.dart';
import 'package:clean_architecture_bloc/core/extensions/size_extension.dart';

import '../core/components/app_image.dart';
import '../core/constants/imports.dart';
import '../features/home/data/models/home_model.dart';
import '../gen/assets.gen.dart';

class TopicCard extends StatelessWidget {
 final CommunityArticleModel  item;

  final double? width;
  const TopicCard({
    required this.item,
    super.key,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width:width,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Color(0xffE0F4ED),
            borderRadius: BorderRadius.circular(10),
            border:
            Border.all(color: context.extraLightGrey)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/images/activity_photo.png',
                      height: 140, fit: BoxFit.cover, width: double.infinity),
                //
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        color: context.secondary,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    padding: EdgeInsets.symmetric(horizontal: 4,vertical: 1),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Done',
                          style: context.titleSmall!.copyWith(
                              color: context.onPrimary,
                              fontWeight: FontWeight.w400),
                        ),
                        5.w,

                        SvgPicture.asset(Assets.icons.checkCircle),
                      ],
                    ),
                  ),
                )
              ],
            ),
            10.h,
            Text(
              item.articleName,
              style: context.titleSmall!
                  .copyWith(color: context.onSurface),
            ),
            6.h,
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                    child: AppImage.network(imageUrl: item.authorImage,height: 25,width: 25,)),
                7.w,
                Text(
                  item.authorName,
                  style: context.bodyMedium,
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}