import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PolicyScr extends StatefulWidget {
  const PolicyScr({super.key});

  @override
  State<PolicyScr> createState() => _PolicyScrState();
}

class DescriptionItem extends StatelessWidget {
  final String title;
  final int indexTitle;
  final List<String> description = [
    "Trên toàn bộ sản phẩm đều có thể mua với giá được chiết khấu cao khi đăng ký trở thành Người Bán. Đồng thời Người Bán có thể nhận hoa hồng khi giới thiệu thành công cho bạn bè/ bên thứ ba mua sản phẩm trên .Bằng việc minh bạch thông tin sản phẩm và hướng dẫn chi tiết, happybreakfast giúp người dùng tìm được sản phẩm tốt nhất cho mình và với những ai đam mê kinh doanh, happybreakfast sẽ giúp bạn vận hành, tối ưu toàn diện công việc kinh doanh của mình.",
    "Thời hạn đối trả hàng hóa khi mua hàng tại happybreakfast được thực hiện trong thời hạn 14 ngày kể từ khi nhận được yêu cầu đổi trả từ Khách hàng. thực hiện theo phương thức một đổi một hoặc hoàn tiền bằng cách chuyển khoản vào tài khoản của khách hàng. Mọi chi phí phát sinh nếu có trong quá trình đối trả hàng hóa sẽ do chịu.",
    "Việc tính phí giao hàng sẽ được  niêm yết công khai rõ ràng cho mỗi lần giao sản phẩm. happybreakfast sẽ thực hiện giao hàng đúng địa chỉ khách hàng yêu câu và trong thời hạn từ 03 đến 07 ngày tùy địa điểm giao hàng được áp dụng. Nếu có bất kỳ sự phát sinh nào gây chậm trễ cho việc giao hàng,  sẽ thông báo ngay trong ngày cho Khách hàng để hai bên cùng giải quyết.Nghĩa vụ chung của bên bán và bên muaMỗi giao dịch sẽ được thực hiện đầy đủ theo đúng quy định của pháp luật hiện hành. Mọi phát sinh khi mua bán hàng hóa được giao dịch theo phương thức thỏa thuận trực tiếp giữa hai bên hoặc theo Hợp đồng điện tử đã ký kết giữa bên bán và bên mua.Bên bán và bên mua phải thực hiện theo đúng quy định của pháp luật, thực hiện đầy đủ các quyền lợi và nghĩa vụ như cam kết khi phát sinh cho mỗi lần giao dịch mua bán hàng hoá."
  ];

  DescriptionItem({super.key, required this.title, required this.indexTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              SvgPicture.asset("assets/image/hand_coin.svg"),
              Text(title),
            ],
          ),
        ),
        const Divider(
          height: 1,
          thickness: 0.5,
        ),
        Text(description[indexTitle]),
        const SizedBox(height: 20,)
      ],
    );
  }
}

class _PolicyScrState extends State<PolicyScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
            height: 26,
            width: 26,
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back))),
        title: const Text(
          "Điều khoản & Chính sách",
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DescriptionItem(
                title: "Chính sách giá",
                indexTitle: 0,
              ),
              DescriptionItem(
                title: "Chính sách đổi trả",
                indexTitle: 1,
              ),
              DescriptionItem(
                title: "Chính sách giao hàng",
                indexTitle: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
