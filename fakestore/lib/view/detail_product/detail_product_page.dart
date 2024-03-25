import 'package:cached_network_image/cached_network_image.dart';
import 'package:fakestore/controller/detail_product/detail_product_controller.dart';
import 'package:fakestore/model/l10n/l10n.dart';
import 'package:fakestore/view/ui/circular_progress.dart';
import 'package:fakestore/view/ui/fs_ratings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailProductController>(
      init: DetailProductController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.toNamed('/home');
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CachedNetworkImage(
                    width: double.maxFinite,
                    height: 160.0,
                    fit: BoxFit.scaleDown,
                    imageUrl: _.product.image!,
                    placeholder: (context, url) => SizedBox(
                      width: 10,
                      height: 10,
                      child: CircularProgress(
                        width: 10,
                        height: 10,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        Image.asset(
                          'assets/images/sinimagen.png',
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                  ),
                  const SizedBox(height: 32,),
                  SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          _.product.title!,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context)!.price,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              '\$ ${_.product.price.toString()}',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context)!.ratings,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${_.product.rating!.rate}',
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                                FSRating(
                                  rating: _.product.rating!.rate!,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context)!.votes,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${_.product.rating!.count}',
                                  style:
                                  Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.thumb_up_alt_outlined,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 32),
                          color: Colors.black12,
                          height: 1,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          S.of(context)!.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          _.product.description!,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 128,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: SizedBox(
            height: 54,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
                  color: Colors.black87,
                ),
                child: FloatingActionButton(
                  onPressed: () => _.goCardBuy(),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  child: Text(
                    S.of(context)!.buy,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
