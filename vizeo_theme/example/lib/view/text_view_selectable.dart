import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vizeo_theme/vizeo_theme.dart';
import 'package:flemme/flemme.dart';

class TextViewSelectable extends StatelessWidget {
  const TextViewSelectable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            VzText.typePrimary(
              data: "Selectable Primary",
            ),
            VzText.typePrimary(
              data: "Selectable Primary Custom",
              textStyleCustom: TextStyle(
                color: Colors.green,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            VzText.typeSecondary(
              data: "Selectable Secondary",
            ),
            VzText.typeSecondary(
              data: "Selectable Secondary Custom",
              textStyleCustom: TextStyle(
                color: Colors.yellowAccent,
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            VzText.typeTertiary(
              data: "Selectable Tertiary",
            ),
            VzText.typeTertiary(
              data: "Selectable Tertiary Custom",
              textStyleCustom: TextStyle(
                color: Colors.red,
                fontSize: 8.0,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        VzText.typePrimary(
          data:
              """Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis
obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam
nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,
tenetur error, harum nesciunt ipsum debitis quas aliquid.""",
          color: Colors.indigo[200],
        ).withPadding(
          padding: const EdgeInsets.all(32.0),
        ),
        const Gap(10.0),
        const VzText.typePrimary(
          data:
              """Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis
obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam
nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,
tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,
quia. Quo neque error repudiandae fuga? Ipsa laudantium molestias eos 
sapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam
recusandae alias error harum maxime adipisci amet laborum. Perspiciatis 
minima nesciunt dolorem! Officiis iure rerum voluptates a cumque velit 
quibusdam sed amet tempora. Sit laborum ab, eius fugit doloribus tenetur 
fugiat, temporibus enim commodi iusto libero magni deleniti quod quam 
consequuntur! Commodi minima excepturi repudiandae velit hic maxime
doloremque. Quaerat provident commodi consectetur veniam similique ad 
earum omnis ipsum saepe, voluptas, hic voluptates pariatur est explicabo 
fugiat, dolorum eligendi quam cupiditate excepturi mollitia maiores labore 
suscipit quas? Nulla, placeat. Voluptatem quaerat non architecto ab laudantium
modi minima sunt esse temporibus sint culpa, recusandae aliquam numquam 
totam ratione voluptas quod exercitationem fuga. Possimus quis earum veniam 
quasi aliquam eligendi, placeat qui corporis!""",
        ),
      ],
    );
  }
}
