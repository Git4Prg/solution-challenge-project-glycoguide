HOW TO USE THE GLYCOGUIDE WEB APP:
  # GlycoGuide
  GlycoGuide is a diabetes nutritional management website designed to help users manage their dietary choices and monitor their fasting blood sugar levels. It utilizes AI to analyze text prompts or images of food/nutritional labels and provides consumption guidelines tailored to the user's needs. Additionally, GlycoGuide offers pre-trained prompts for meal planning, snacks, dinner, and dessert.

  ## Installation of Web-App

  To get started with GlycoGuide, follow these steps:

  1. Clone the repository:
   git clone https://github.com/yourusername/glycoguide.git

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





    
