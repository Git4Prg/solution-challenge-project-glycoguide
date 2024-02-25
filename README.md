HOW TO USE THE GLYCOGUIDE WEB APP:
  # GlycoGuide
  GlycoGuide is a diabetes nutritional management website designed to help users manage their dietary choices and monitor their fasting blood sugar levels. It utilizes AI to analyze text prompts or images of 
  food/nutritional labels and provides consumption guidelines tailored to the user's needs. Additionally, GlycoGuide offers pre-trained prompts for meal planning, snacks, dinner, and dessert.

  ## Installation of Web-App

  To get started with GlycoGuide, follow these steps:

  1. Clone the repository:
   git clone https://github.com/Git4Prg/solution-challenge-project-glycoguide.git

  2. Navigate to the project directory:  cd glycoguide
  3. Install dependencies using npm: npm install
  4. Create a .env file in the root directory of the project and add the necessary environment variables: PORT=3000
        JWT_SECRET=your_jwt_secret
        MONGODB_URI=your_mongodb_uri
        API_KEY=your_api_key
     
  Replace your_jwt_secret with a random string for JWT token generation, your_mongodb_uri with your MongoDB connection URI, and your_api_key with the API key required for your project.

  # Usage
  To start the GlycoGuide server, run: npm start

  Or, if you want to run the server in development mode with auto-restart on file changes, use: npm run dev
  Once the server is running, you can access GlycoGuide in your web browser at http://localhost:3000.

  ## Contributing
  Contributions to GlycoGuide are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request. Make sure to follow the Contributing Guidelines.







  ## Installation of the mobile-app

  # Flutter Project

  Welcome to the Flutter project! This project is built using the Flutter framework for creating beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.

  ## Installation

  To install and run this project locally on your machine, follow these steps:

  ### Prerequisites

  Before you begin, make sure you have the following installed on your system:

  - Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
  - Git: [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

  ### Clone the Repository

  Clone this repository to your local machine using Git:

  git clone https://github.com/Git4Prg/solution-challenge-project-glycoguide.git

  Navigate to the Project Directory
Navigate to the cloned repository's directory: cd flutter-project

Get Dependencies
Run the following command to get the dependencies required for the project: flutter pub get

Run the Project
Connect your device or emulator and run the project using the following command: flutter run

This command will build and run the Flutter application on your connected device or emulator.

# NOTE 
The Flutter App was tested on Pixel_3a_API_34_extension_level_7_x86_x64
