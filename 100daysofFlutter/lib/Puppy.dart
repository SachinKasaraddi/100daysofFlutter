class Puppy {
  final String imagePath;
  final String puppyType;
  final bool isMale;
  final String name;
  final String breed;
  final double weight;
  final int age;
  final String address;

  Puppy(this.imagePath, this.puppyType, this.isMale, this.name, this.breed,
      this.weight, this.age, this.address);

  static List<Puppy> getPuppiesList() {
    Puppy puppy1 = Puppy(
        "assets/images/pet3.jpeg",
        "Puppy",
        true,
        "Pippa",
        "Border colli",
        2,
        3,
        'A, Kharvai, M I D C, Behind Hope India Ltd, Badlapur');
    Puppy puppy2 = Puppy(
        "assets/images/pet4.jpeg",
        "Puppy",
        true,
        "Pickle",
        "Bulldog",
        1.2,
        3,
        'A, Kharvai, M I D C, Behind Hope India Ltd, Badlapur');

    Puppy puppy3 = Puppy(
        "assets/images/pet5.jpeg",
        "Adult",
        false,
        "Blossom",
        "Maltese puddle",
        2.4,
        3,
        'A, Kharvai, M I D C, Behind Hope India Ltd, Badlapur');
    Puppy puppy4 = Puppy(
        "assets/images/pet6.jpeg",
        "Puppy",
        true,
        "Hailey",
        "Pitbull",
        3.4,
        3,
        'A, Kharvai, M I D C, Behind Hope India Ltd, Badlapur');
    Puppy puppy5 = Puppy(
        "assets/images/pet7.jpeg",
        "Puppy",
        true,
        "Kiki",
        "Spaniel",
        4.4,
        3,
        'A, Kharvai, M I D C, Behind Hope India Ltd, Badlapur');
    Puppy puppy6 = Puppy("assets/images/pet8.jpeg", "Adult", false, "Missy",
        "Cross", 2, 3, 'A, Kharvai, M I D C, Behind Hope India Ltd, Badlapur');
    Puppy puppy7 = Puppy("assets/images/pet1.jpeg", "Puppy", true, "Nora",
        "Corgi", 2, 3, 'A, Kharvai, M I D C, Behind Hope India Ltd, Badlapur');
    Puppy puppy8 = Puppy("assets/images/pet2.jpeg", "Adult", false, "Basil",
        "Cross", 2, 3, 'A, Kharvai, M I D C, Behind Hope India Ltd, Badlapur');
    Puppy puppy9 = Puppy(
        "assets/images/pet9.jpeg",
        "Puppy",
        true,
        "Tessa",
        "Border colli",
        1.7,
        3,
        'A, Kharvai, M I D C, Behind Hope India Ltd, Badlapur');
    return List.unmodifiable([
      puppy1,
      puppy2,
      puppy3,
      puppy4,
      puppy5,
      puppy6,
      puppy7,
      puppy8,
      puppy9
    ]);
  }
}
