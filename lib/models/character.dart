import 'package:flutter/material.dart';

class Character {
  final String name;
  final String imagePath;
  final String description;
  final List<Color> colors;

  Character({this.name, this.imagePath, this.description, this.colors});
}

List characters = [
  Character(
    name: "Kevin",
    imagePath: "assets/images/Kevin_minions.png",
    description:
        "Sir Kevin KBE (formerly known as Kevin) is one of the Minions and the protagonist in the film Minions. Kevin is a tall, two-eyed minion with sprout cut hair and is usually seen wearing his golf apparel. Kevin loves to make fun of and tease people or Minions, shown when he made fun of Jerry and teases him for being a coward. He loves playing golf and cricket. In the film Minions he is the leader of the trio in search of a new master. He truly cares about the well-being of the Minion tribe (which is dependent on them having a proper master).",
    colors: [Colors.orange.shade200, Colors.deepOrange.shade400]
  ),
  Character(
    name: "Agnes",
    imagePath: "assets/images/Agnes_gru.png",
    description:
    "Agnes Gru it is one of Gru and Lucy's three adopted daughters, alongside her sisters Margo and Edith. She is the youngest child of the three sisters. She greatly adores unicorns, as shown on various occasions. Agnes is a little girl with dark brown eyes. Her long black hair is tied in an upwards ponytail with a red scrunchie. Most of the time, Agnes wears blue overalls over a yellow and brown striped t-shirt, and white sneakers with yellow socks. She also wears a white ballet outfit like Edith and Margo (at the ballet recital). For pajamas, Agnes wears a long blue nightshirt covered with teddy bears and polar bear slippers; her hair stays the same. On her birthday, Agnes is wearing a dress that resembles a princess riding a unicorn. The colors are similar to her regular outfit. She also wears a blue princess hat on her head.",
      colors: [Colors.pink.shade200, Colors.redAccent.shade400]
  ),
  Character(
    name: "Gru",
    imagePath: "assets/images/Gru.png",
    description:
    "Gru comes from a long lineage of villain as shown with dozen of statues of his ancestors in Dru's hideout. Although his hometown is unknown, in an interview with Ellen DeGeneres he claimed he was from Albuquerque, New Mexico. As a child he had always dreamed of going to the moon. He made a prototype rocket out of macaroni and an actual working prototype rocket. For most of his childhood he was neglected and ignored by his mother, and it is unknown if this is what inspired him to become a supervillain, or if the Gru family is a family of supervillains, although his mother showed no signs of being one. He has worked with Dr. Nefario, who builds gadgets and weapons for Gru, for some time and based on what Dr. Nefario said, they have been planning the moon heist for a long time.",
      colors: [Colors.grey.shade200, Colors.blueGrey.shade400]
  )
];
