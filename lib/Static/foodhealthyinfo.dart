class FoodHealthyInfo {
  final String title;
  final String img;
  final String origin;
  final String description;
  final int stars;
  final List<String> benefits;

  FoodHealthyInfo({
    required this.title,
    required this.img,
    required this.origin,
    required this.description,
    required this.stars,
    required this.benefits,
  });
}

final List<FoodHealthyInfo> foodhealthyinfos = [
  FoodHealthyInfo(
    title: "Hoja Verde",
    img: "assets/images/verdurasHojaVerde.jpg",
    origin: "Sur de Europa",
    description:
        "Los vegetales de hoja verde son alimentos altamente nutritivos que se caracterizan por tener hojas de color verde oscuro. Son ricos en vitaminas, minerales y antioxidantes, lo que los convierte en una excelente opción para una alimentación saludable. ",
    stars: 4,
    benefits: [
      "Rico en vitaminas y minerales",
      "Ayuda a fortalecer el sistema inmunológico",
      "Beneficia la salud cardiovascular"
    ],
  ),
  FoodHealthyInfo(
    title: "Pescados Grasos",
    img: "assets/images/pescadosGrasos.jpg",
    origin: "Regiones Templadas",
    description:
        "Los pescados grasos son aquellos que contienen cantidades significativas de ácidos grasos omega-3, como el salmón, la caballa, el atún y la sardina. Estos pescados son conocidos por sus beneficios para la salud debido a su contenido de grasas saludables. ",
    stars: 5,
    benefits: [
      "Fuente de ácidos grasos omega-3",
      "Promueve la salud cerebral",
      "Ayuda a reducir la inflamación"
    ],
  ),
  FoodHealthyInfo(
    title: "Tomates",
    img: "assets/images/tomates.jpeg",
    origin: "Bajos Andes, Mexico",
    description:
        "Los tomates son frutas que se utilizan comúnmente como verduras en la cocina. Son conocidos por su característico color rojo brillante y su sabor jugoso y refrescante. Los tomates son una excelente fuente de nutrientes, como la vitamina C, que ayuda a fortalecer el sistema inmunológico, y el licopeno.",
    stars: 3,
    benefits: [
      "Rico en antioxidantes",
      "Promueve la salud cardiovascular",
      "Beneficia la salud ocular"
    ],
  ),
  FoodHealthyInfo(
    title: "Palta",
    img: "assets/images/palta.jpg",
    origin: "Áreas Tropicales",
    description:
        "La palta, también conocida como aguacate, es una fruta tropical de forma ovalada y pulpa cremosa. Su piel es verde oscuro y suave al tacto cuando está madura. La palta es famosa por ser una excelente fuente de grasas saludables.",
    stars: 2,
    benefits: [
      "Alto poder antioxidante",
      "Ayuda a disminuir los niveles de colesterol malo",
      "Excelente fuente de grasas saludables"
    ],
  ),
  FoodHealthyInfo(
    title: "Quinoa",
    img: "assets/images/quinoa.jpg",
    origin: "Región Andina",
    description:
        "La quinoa es un pseudocereal altamente nutritivo y libre de gluten. Se cultiva en la región andina y se considera un alimento básico en muchas culturas. La quinoa es rica en proteínas, fibra y varios nutrientes esenciales. Es una excelente opción para dietas vegetarianas y veganas.",
    stars: 4,
    benefits: [
      "Fuente de proteínas completas",
      "Alto contenido de fibra",
      "Rica en vitaminas y minerales"
    ],
  ),
  FoodHealthyInfo(
    title: "Nueces",
    img: "assets/images/nueces.jpg",
    origin: "Diversas regiones",
    description:
        "Las nueces son frutos secos con forma de cáscara dura y contenido interno comestible. Son una fuente rica de grasas saludables, proteínas, vitaminas y minerales. Las nueces se consideran beneficiosas para el corazón y se pueden incluir en una variedad de platos y recetas.",
    stars: 3,
    benefits: [
      "Promueven la salud cardiovascular",
      "Ricas en antioxidantes",
      "Ayudan a controlar el peso"
    ],
  ),
  FoodHealthyInfo(
    title: "Arroz integral",
    img: "assets/images/arrozintegral.jpg",
    origin: "Varias regiones",
    description:
        "llamado también arroz cargo, arroz pardo o arroz moreno, es arroz descascarillado, al que solo se le ha quitado la cáscara exterior.Aporta vitaminas como provitamina A, vitamina B1, B3 y B12; minerales como sodio, potasio, hierro, calcio y fósforo; hidratos de carbono y proteínas.",
    stars: 4,
    benefits: [
      "Ayuda en la pérdida de peso",
      "Es gran fuente de fibra",
      "Contiene gran cantidad de antioxidantes y minerales"
    ],
  ),
];
