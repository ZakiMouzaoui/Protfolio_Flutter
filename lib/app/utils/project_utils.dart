class ProjectModel {
  final String banner;
  final List<String> icons;
  final String title;
  final String description;
  final String link;
  final String? imagesFolder;
  ProjectModel( {
    required this.banner,
    required this.icons,
    required this.title,
    required this.description,
    required this.link,
    this.imagesFolder,
  });
}

List<ProjectModel> projectUtils = [
  ProjectModel(
    banner: 'assets/imgs/ecommerce-flutter-showcase.png',
    icons: ['assets/imgs/flutter.png', 'assets/imgs/firebase-logo.png'],
    title: 'Full Stack Ecommerce App(Flutter + Firebase)',
    description:
        'This project involved the development of a comprehensive e-commerce application using the Flutter framework for the front end and Firebase as the backend infrastructure.',
    link: 'https://github.com/ZakiMouzaoui/az_store',
    imagesFolder: "ecommerce_app"
  ),
  ProjectModel(
    banner: 'assets/imgs/anime-app-showcase.png',
    icons: ['assets/imgs/flutter.png', 'assets/imgs/jikan-logo.png'],
    title: 'Anime App(Flutter + Jikan API)',
    description:
        'This project involved the development of a mobile application using the Flutter framework to create a user-friendly interface for anime enthusiasts. The Jikan API, which serves as an unofficial MyAnimeList API, was integrated to fetch and display information about various anime series, movies, and characters.',
      imagesFolder: "anime_app", link: 'https://github.com/ZakiMouzaoui/anime_app'
  ),
  ProjectModel(
    banner: 'assets/imgs/fitness-app-showcase.png',
    icons: ['assets/imgs/flutter.png'],
    title: 'Fitness App Ui(Flutter)',
    description:
        'This project focused on crafting the user interface (UI) design for a fitness application. The UI is designed to be visually appealing, intuitive, and user-friendly. It includes various screens and components such as workout tracking, exercise details and progress charts',
    link: 'https://github.com/ZakiMouzaoui/fitness_app_ui',
      imagesFolder: "fitness_app"
  ),
  ProjectModel(
    banner: 'assets/imgs/food-delivery-showcase.png',
    icons: ['assets/imgs/flutter.png'],
    title: 'Food Delivery App UI(Flutter)',
    description:
        'This is a just Plant App UI by using flutter, source code is also available, check below.',
    link: 'https://github.com/sudeshnb/flutter_plant_app.git',
      imagesFolder: "food_delivery_app"
  ),
  ProjectModel(
    banner: 'assets/imgs/ecommerce-web-showcase.png',
    icons: ['assets/imgs/mongo-db-icon.png', 'assets/imgs/express-js-logo.png', 'assets/imgs/react-icon.png', 'assets/imgs/nodejs-icon-logo.png'],
    title: 'E-commerce Website (MERN Stack)',
    description:
    'Designed and implemented a full-fledged e-commerce website using the MERN (MongoDB, Express.js, React, Node.js) stack. Integrated features such as product listings, user authentication, shopping cart functionality, and secure payment gateways.',
    link: 'https://github.com/ZakiMouzaoui/full-stack-ecommerce-website',
    imagesFolder: 'ecommerce-web'
  ),
  ProjectModel(
    banner: 'assets/imgs/brain-ai-showcase.jpg',
    icons: ['assets/imgs/tensorflow-logo.jpg', 'assets/imgs/streamlit-logo.png'],
    title: 'Medical Platform for Brain Tumor Semantic Segmentation (Streamlit + TensorFlow)',
    description:
    'Streamlit and TensorFlow-powered medical platform for brain tumor segmentation. User-friendly web interface enables medical professionals to upload images and obtain segmented results.',
    link: 'https://github.com/sudeshnb/flutter_plant_app.git',
  ),
  ProjectModel(
    banner: 'assets/imgs/chat-app-showcase.png',
    icons: ['assets/imgs/flutter.png', 'assets/imgs/firebase-logo.png'],
    title: 'Chat App (Flutter + Firebase)',
    description:
    'Created a real-time messaging application using Flutter for the frontend and Firebase for backend services. The app allows users to send and receive messages, share multimedia',
    link: 'https://github.com/ZakiMouzaoui/whatsapp_clone',
  ),
  ProjectModel(
    banner: 'assets/imgs/cos-showcase.webp',
    icons: ['assets/imgs/django-logo.png'],
    title: 'Social Works Commission Website (Django)',
    description:
    "The website provides features such as member profiles, event management, and information dissemination, showcasing a robust and user-friendly platform tailored for the commission's needs.",
    link: 'https://github.com/ZakiMouzaoui/1cs_project_oeuvres_sociales',
  ),
];
