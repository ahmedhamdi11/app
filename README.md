
# Secure Shield Application

Welcome to the Secure Shield application, your comprehensive solution designed to safeguard against cybersecurity threats such as malware, frauds, attacks, and phishing emails.
Leveraging the potent Secure Shield API [Secure Shield API]( https://github.com/ahmedhamdi11/Secure-Shield-API ),
our application integrates cutting-edge technology to provide real-time protection and awareness, enhancing your digital security posture.
Alongside this, we integrate news updates from [NewsAPI](https://newsapi.org) ,
offering you the latest global cybersecurity news, ensuring you're informed and one step ahead of potential cyber threats.


## Features:
- Real-Time Threat Detection: Utilizes the [Secure Shield API]( https://github.com/ahmedhamdi11/Secure-Shield-API ) to detect and protect against malware, frauds, attacks, and phishing emails.
  - Malware Protection: Secure Shield uses the malware detection endpoint to scan files for malware. Users can upload files and receive instant feedback on whether the file contains any 
    malicious elements.
  - Fraud Detection: Secure Shield uses fraud card detection endpoint to identify potential fraudulent credit card transactions. Users can input transaction details and 
    receive predictions on the likelihood of fraud.
  - Attack Detection: Secure Shield utilizes the Secure Shield API's attack detection endpoint to detect and classify different types of cyber attacks. It analyzes network traffic and classifies it into 
    categories such as DoS Attack, Probe Attack, Privilege Attack, Access Attack, or Normal traffic.
  - Phishing Email Detection: The application employs the phishing email endpoint to classify emails as either phishing or safe. It analyzes the email content and provides users with 
    information on potential phishing attempts.
    
- Cybersecurity Awareness: Access to vital information and articles that guide users on protecting themselves against various cybersecurity threats.
- Latest Cybersecurity News: Integration with [NewsAPI](https://newsapi.org) to fetch and display the latest global cybersecurity news, keeping users informed.
- User Authentication: Secure sign-in through Firebase authentication using Google accounts, providing a personalized experience tailored to each user.
- Responsive and Interactive UI: A carefully designed user interface that is responsive on all mobile devices, enhanced with smooth animations for a more engaging and user-friendly experience.


## Technical Stack:
- Framework: The application is built using Flutter, offering a seamless cross-platform development experience.
- State Management: Utilizes Cubit for state management, ensuring a clean, maintainable, and scalable codebase.
- Design Pattern: Adopts the Model-View-ViewModel (MVVM) design pattern, promoting a structured and efficient approach to app development.
- HTTP Requests: Leverages the Dio package for making HTTP requests, including comprehensive error handling capabilities to ensure stability and reliability.
- Authentication: Integrates Firebase for user authentication, allowing for secure and convenient sign-in options.

## Screenshots:

### Splash-Screen
![splash_view](https://github.com/ahmedhamdi11/secure_shield/assets/113295140/40f808d3-3fe4-4d40-a79b-dd4d3100eae3)

### Onboarding
![onboarding](https://github.com/ahmedhamdi11/secure_shield/assets/113295140/be227a76-838b-40aa-8bff-d085eedb1f29)

### Auth
![auth](https://github.com/ahmedhamdi11/secure_shield/assets/113295140/f80e75ac-575a-47f3-ab33-21ba01eacbd1)


### Explore
![explore](https://github.com/ahmedhamdi11/secure_shield/assets/113295140/517856ca-6516-4f57-a434-51ccae445e2e)

### AI Predictions
![ai_models](https://github.com/ahmedhamdi11/secure_shield/assets/113295140/2ae52432-6640-4d54-9429-6d5c8fa4c0ac)

