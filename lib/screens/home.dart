import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: ListView(
          children: [
                Text("О нас",
                style: Theme.of(context).textTheme.headline1
                ),

                const Padding(padding: EdgeInsets.symmetric(vertical: 16)),
                Text("Турагентство МэриЯн предлагает услуги по подбору и организации туров, "
                "экскурсий и эксклюзивно-индивидуальных программ под запрос, "
                "в любой точке мира и в особенности в республике Крым, "
                "где мы вляемся Встречающей стороной.",
                style: Theme.of(context).textTheme.bodyText1
                ),
        

                const Padding(padding: EdgeInsets.symmetric(vertical: 12)),
                Text("Путешествие может быть идеальным только в том случае, "
                "если в нем предусмотрено абсолютно все. "
                "Поэтому все заботы от покупки авиабилетов и бронирования гостиницы "
                "до трансфера из аэропорта и заказа экскурсий мы возьмем на себя. "
                "Вам останется лишь наслаждаться отдыхом.",
                style: Theme.of(context).textTheme.bodyText1),

                const Padding(padding: EdgeInsets.symmetric(vertical: 16)),
                Image.network("https://sun9-65.userapi.com/impg/O7y71Fx_lc-rBCPEGk81uJTolx5Y5SZXPAWRWw/DI7LAlthoyo.jpg?size=2560x458&quality=96&sign=4195ea067d8fc56d6a1ca9004f1643f8&type=album")
          ],
      ),
    );
  }
}