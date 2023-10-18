import 'package:flutter/material.dart';
import 'package:flutter_project_base/gen/assets.gen.dart';
import 'package:flutter_project_base/presentation/views/widgets/app_form_field.dart';
import 'package:flutter_project_base/presentation/views/widgets/coupon/coupon_widget.dart';
import 'package:flutter_project_base/shared/extensions/widget_extensions.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: true,
    home: DemoPage(),
  ));
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const _TextFieldPage()),
                );
              },
              child: const Text('TextField'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const _CouponPage()),
                );
              },
              child: const Text('Button'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const _CouponPage()),
                );
              },
              child: const Text('Product'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const _CouponPage()),
                );
              },
              child: const Text('Carousel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const _CouponPage()),
                );
              },
              child: const Text('Switch'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const _CouponPage()),
                );
              },
              child: const Text('Checkbox'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const _CouponPage()),
                );
              },
              child: const Text('Radio Button'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const _CouponPage()),
                );
              },
              child: const Text('TabBar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const _CouponPage()),
                );
              },
              child: const Text('NavigationBar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const _CouponPage()),
                );
              },
              child: const Text('Coupon'),
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}

class _TextFieldPage extends StatelessWidget {
  const _TextFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text Field')),
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppFormField()
          ],
        ).paddingAll(16),
      ),
    );
  }
}


class _CouponPage extends StatelessWidget {
  const _CouponPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coupon'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CouponWidget(
            width: 288,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF086D46),
                    Color(0xFF077A4E),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: Assets.images.bgCoupon.provider())),
            firstChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.images.coupon.image().paddingSymmetric(horizontal: 16),
              ],
            ),
            secondChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                const Text(
                  'Giảm 40% + FREESHIP',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Hết hạn trong 10 tiếng',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 11),
                SizedBox(
                  height: 24,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(90, 24),
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      textStyle:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {},
                    child: Text('Lưu voucher'),
                  ),
                )
              ],
            ).paddingSymmetric(horizontal: 12),
          ),
          const SizedBox(height: 32),
          CouponWidget(
            height: 108,
            border: const BorderSide(color: Color(0xFFE9EDF3)),
            backgroundColor: Colors.white,
            firstChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.images.coupon
                    .image(width: 70, height: 76, fit: BoxFit.cover)
              ],
            ).paddingSymmetric(horizontal: 16),
            secondChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                const Text(
                  'Giảm 40% + FREESHIP',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Hết hạn trong 10 tiếng',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFFF4545),
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  height: 24,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 24),
                      padding: EdgeInsets.zero,
                      elevation: 0,
                      backgroundColor: Color(0xFFE1F0DE),
                      foregroundColor: Color(0xFF086D46),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      textStyle:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {},
                    child: Text('Sử dụng ngay'),
                  ),
                )
              ],
            ).paddingSymmetric(horizontal: 12),
          )
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
