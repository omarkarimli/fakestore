import 'package:cached_network_image/cached_network_image.dart';
import 'package:fakestore/controller/home/home_controller.dart';
import 'package:fakestore/model/l10n/l10n.dart';
import 'package:fakestore/model/products/products.dart';
import 'package:fakestore/model/utils.dart';
import 'package:fakestore/view/profile/profile_page.dart';
import 'package:fakestore/view/ui/circular_progress.dart';
import 'package:fakestore/view/ui/progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'shopPay',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            actions: [
              IconButton(
                onPressed: () => _.onChangeAsc(),
                icon: _.isAsc
                    ? const Icon(
                        Icons.arrow_upward, size: 28,
                      )
                    : const Icon(Icons.arrow_downward),
              ),
              IconButton(
                  onPressed: () {
                    Get.to(ProfilePage());
                  },
                  icon: const Icon(Icons.account_circle_rounded, size: 28,),
              ),
            ],
          ),
          drawer: Drawer(
            child: Column(
              children: [
                ListTile(
                  onTap: () => _.onCloseSession(),
                  title: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context)!.signOff,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const Icon(Icons.logout_outlined),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          body: ProgressHUD(
            loading: _.isLoading,
            child: SafeArea(
              child: GetBuilder<HomeController>(
                id: 'ListProducts',
                builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
                      itemCount: _.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildCard(_.products[index], context, _);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCard(Product item, BuildContext context, HomeController _) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: 272,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                  ),
                  child: CachedNetworkImage(
                    height: 96,
                    fit: BoxFit.scaleDown,
                    imageUrl: item.image!,
                    placeholder: (context, url) => SizedBox(
                      width: 10,
                      height: 10,
                      child: CircularProgress(
                        height: 5,
                        width: 5,
                      ),
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/sinimagen.png',
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  color: Colors.black12,
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    item.title!,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              top: 0,
              child: GestureDetector(
                onTap: () => _.goToDetailProduct(item.id.toString(),item),
                child: Container(
                  width: 48, height: 48,
                  decoration: const BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                  ),
                  child: const Icon(
                    Icons.favorite_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () => _.goToDetailProduct(item.id.toString(),item),
                child: Container(
                  width: 48, height: 48,
                  decoration: const BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 16,
              child: Text(
                '\$ ${item.price.toString()}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
