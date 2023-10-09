class Projects{
  String thumbnail;
  String title;
  String date;
  String details;
  String link;
  List<String> toolsIcon;
  List<String> tools;

  Projects({
    required this.thumbnail,
    required this.title,
    required this.date,
    required this.details,
    required this.link,
    required this.toolsIcon,
    required this.tools,
  });
}

List<Projects> projectList = [
  Projects(
    thumbnail: 'assets/images/flutter_portfolio.jpeg',
    title: 'Flutter Portfolio',
    date: '2023',
    details: 'Flutter Portfolio is my first portfolio designed to present a comprehensive overview of my identity, skills, and ongoing projects. Crafted using Flutter, it is also responsive to mobile and web.',
    link: 'https://mychal-portfolio.web.app/',
    tools: ['Flutter'],
    toolsIcon:['assets/images/flutter.png'],
  ),
  Projects(
    thumbnail: 'assets/images/chalgpt.jpg',
    title: 'Chal-GPT',
    date: '2023',
    details: 'Chal-GPT, a mobile app inspired by ChatGPT, offering users a familiar and powerful AI chat experience. It goes a step further with a robust account system that seamlessly integrates OpenAI API for intelligent responses and relies on Firebase for secure data storage, ensuring a personalized and secure chat environment.',
    link: 'https://drive.google.com/uc?id=1h54a1TPCLg4jiDGk4w-QtgKXghDLCaB7',
    tools: ['Flutter','Firebase'],
    toolsIcon:['assets/images/flutter.png', 'assets/images/firebase.png'],
  ),
  Projects(
    thumbnail: 'assets/images/weebpedia.jpg',
    title: 'Weebpedia',
    date: '2023',
    details: 'Weebpedia is a dedicated haven for anime enthusiasts, offering a comprehensive database of anime series and movies. Powered by the animedb API, it ensures accurate and up-to-date information, making it the go-to source for anime lovers seeking details on their favorite shows and films.',
    link: '',
    tools: ['Flutter'],
    toolsIcon:['assets/images/flutter.png'],
  ),
  Projects(
    thumbnail: 'assets/images/pandesalApp.jpg',
    title: 'Santos Pandesal App',
    date: '2023',
    details: 'Pandesal App is an ongoing flutter project, designed to mimic an online shopping experience for bakeries. With its user-friendly features such as an efficient "Add to Cart" system, a comprehensive product showcase, and convenient pickup or delivery options, it aims to deliver a seamless and delightful shopping experience for bakery customers.',
    link: 'https://drive.google.com/uc?id=1WZ3iS1nAUTlXGBq2BvN8mxOqYKq62EBM',
    tools: ['Flutter',],
    toolsIcon:['assets/images/flutter.png',],
  ),
  Projects(
    thumbnail: 'assets/images/geriassis.png',
    title: 'GeriAssis',
    date: '2022-2023',
    details: 'GeriAssis is an innovative mobile app that serves as virtual memory box and offers a range of assistive options to assist the elderly users and its respective guardians. This application has a notification system that guardians can set in order broadcast important daily tasks reminder and also scheduled important dates. It also comes with a virtual memory box in form of photos and diaries in order for them to cherish and recall their memorable times in their lives.',
    link: 'https://drive.google.com/uc?id=1n46ou1cUAze71ZsAz1NDgMlYDmW5HIMy',
    tools: ['Flutter', 'Firebase'],
    toolsIcon:['assets/images/flutter.png', 'assets/images/firebase.png'],
  ),
  Projects(
    thumbnail: 'assets/images/amide.jpg',
    title: 'AMIDE',
    date: '2022-2023',
    details: 'AMIDE, or Assistive Monitoring In-house Device for the Elderly, is an innovative technology designed to enhance the well-being and safety of elderly individuals. It incorporates advanced sensors to continuously monitor vital health parameters such as heart rate, oxygen levels, temperature, weight, and height, providing valuable data for caregivers and healthcare professionals. AMIDE also features a user-friendly interface for setting up daily reminders, ensuring comprehensive care and support for the elderly.',
    link: 'https://drive.google.com/uc?id=1FgIrN6RZAC-sj7CN5VzMMnDpN93gZLVK',
    tools: ['Flutter', 'Firebase', 'C++'],
    toolsIcon:['assets/images/flutter.png', 'assets/images/firebase.png', 'assets/images/cplusplus.png'],
  ),
  Projects(
    thumbnail: 'assets/images/bloodlife.png',
    title: 'BloodLife',
    date: '2021',
    details: ' BloodLife is an interactive website for anyone who are in need of blood and for someone that wants to donate blood. It is a website wherein you can find a blood donator. This website can provide you a list of donators near you so that blood donation will be more accessible to all. Additionally, even blood donators could submit their entries to find suitable blood needers. This website could be a bridge to many people to save more lives in our society. We also provide informations about blood donating.',
    link: 'https://github.com/mychaalll/BloodLife/tree/main',
    tools: ['HTML', 'CSS', 'PHP', 'MYSQL'],
    toolsIcon:['assets/images/html.png', 'assets/images/css.png', 'assets/images/php.png', 'assets/images/mysql.png'],
  ),
  Projects(
    thumbnail: 'assets/images/knockdowntheprisoner.png',
    title: 'Knock Down the Prisoner',
    date: '2020',
    details: '"Knock Down the Prisoner" is a unique adaptation of the Filipino game "Tumbang Preso," adding a twist to the traditional gameplay. In this version, players control an airplane-like video game, where the objective is to attack the opponent\'s can while simultaneously defending their own. It combines the nostalgic elements of the classic game with the excitement of aerial combat strategy.',
    link: 'https://github.com/VoidInSpace/Knock-Down-the-Prisoner',
    tools: ['Unity', 'C#',],
    toolsIcon:['assets/images/unity.png', 'assets/images/csharp.png',],
  ),
  Projects(
    thumbnail: 'assets/images/votingsystem.png',
    title: 'Voting System',
    date: '2018',
    details: 'The Voting System incorporates an intuitive admin panel designed to streamline the management of the voting process. The admin panel empowers administrators to effortlessly oversee and reset vote counts, along with the flexibility to add new users and candidates. Additionally, the system features a user-friendly voting panel that enables registered users to cast their votes securely and efficiently. ',
    link: 'https://github.com/mychaalll/VotingSystem/tree/main',
    tools: ['C#',],
    toolsIcon:['assets/images/csharp.png',],
  ),
];
