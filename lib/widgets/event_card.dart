
import 'package:clean_architecture_bloc/core/extensions/build_context_extension.dart';
import 'package:clean_architecture_bloc/core/extensions/size_extension.dart';

import '../core/constants/imports.dart';
import '../features/home/data/models/home_model.dart';
import '../gen/assets.gen.dart';

class EventCard extends StatelessWidget {
  final double? width;
  final CommunityEventModel? item;
  const EventCard({
   required  this.item,
    super.key,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:width,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: context.cardColor,
          borderRadius: BorderRadius.circular(10),
          border:
          Border.all(color: context.extraLightGrey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Assets.images.temp2.image(height: 50),
              7.w,
              Expanded(
                child: Text(
                  item?.eventName??'',
                  style: context.bodyLarge!.copyWith(color: context.primary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
         7.h,
          Text('Therapy type',style: context.bodyMedium,),
          10.h,
          Row(
            children: [
            Icon(Icons.calendar_month),
              7.w,
              Expanded(
                child: Text(
                  '10/10/2025',
                  style: context.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}