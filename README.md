# Constellation Detection App

![Star Recon](https://github.com/all-coder/Star-Recognition-App/assets/65776242/769948c9-3dfc-42f5-af62-b702f37b1d3d)

## Overview

The Constellation Detection App is developed for Gagan Vedhi at IIT Tirupati. It allows users to upload images of the night sky, process them to detect constellations, and view the weather based on the user's location. The app is built using Flutter for the front-end, Flask for the back-end, and integrates Firebase for cloud storage and OpenWeatherMap API for weather updates.

## Features
- **Constellation Detection**: Upload night sky images, which are processed by Python scripts to identify constellations.
- **Weather Integration**: Displays current weather conditions using the OpenWeatherMap API based on the user’s location.
- **Cloud Storage**: Stores both raw and processed images in Firebase and retrieves them via URLs.

## Technology Stack
- **Flutter**: Mobile app development framework.
- **Flask**: Back-end server to manage the communication between the app and Python scripts.
- **Firebase**: Cloud storage for image handling.
- **OpenWeatherMap API**: For displaying the current weather.

## Installation

To set up the project locally, follow the steps below:

### Prerequisites
Make sure you have the following installed:
- Flutter SDK
- Python 3.x
- Firebase account setup
- OpenWeatherMap API key
- Git

### Steps to Install

1. **Clone the repository**:
   ```bash
   git clone https://github.com/all-coder/Star-Recognition-App.git
   cd Star-Recognition-App

