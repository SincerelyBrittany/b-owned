# README
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/SincerelyBrittany/b-owned">
    <img src="https://github.com/SincerelyBrittany/b-owned/blob/master/app/assets/images/logo.png" alt="Logo" width="300" height="80">
  </a>
</div>
  <h3 align="center">B. Owned</h3>

<div align="center">
    <p>This rails application allows for individuals to search for black owned businesses. </p>
   <p> There is two ways to sign in:
    1. As a business owner where you will be able to add companies that you own. 
    2. As a user who will be able to search for companies. </p>
    <p>All users and owners have the ability to create personalized list that they can add muiltple companies too. In addition, a user/owner is able to follow/favorite companies of their liking. All users can delete/edit their list at any time. </p>
    <p> Lastly, it allows an administrator to CRUD all functions in the app. </p>
    </div>
    <br />
    <div align="center">
    <a href="https://b-owned.herokuapp.com/login">View Example</a>
    <a href="https://www.youtube.com/watch?v=l1rQYSUjRu8">View Demo</a>
    ·
    <a href="https://github.com/SincerelyBrittany/b-owned/issues">Report Bug</a>
    ·
    <a href="https://github.com/SincerelyBrittany/b-owned/issues">Request Feature</a></div>


<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Usage](#usage)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)

<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://example.com)

This project allows a business owner to create a company and add its location which will be shown on the company show page using the google maps API [Google_Maps_API](https://developers.google.com/maps/documentation)

### Built With
* [Ruby-on-Rails](https://guides.rubyonrails.org/)
* [byebug](https://rubygems.org/gems/byebug/versions/9.0.6)
* [Google_Maps_API](https://developers.google.com/maps/documentation)
*  Blood 💉, Sweat 💦, and Tears <span style='font-size:100px;'>&#128546;</span> 


<!-- GETTING STARTED -->
## Getting Started

To get the application started you must have ruby installed on your computer. Checkout the ruby on rails [getting-started-guide](https://guides.rubyonrails.org/v5.0/getting_started.html) to learn how to install it on your device. 

### Prerequisites

Before running your server, you will need to install the gems and add content to your database manually or you can use the seeds file:

To install the gems run the following:

```sh
bundle install
```

To run your migrations and update your db/schema.rb file to match the structure of the database, run the following:

```sh
rails db:migrate
```

To create data in the database, run the following:
```sh
rails db:seed
```

```sh
rails s
```
and then go to your favorite browser and visit this webpage "http://localhost:3000" 

### Installation

1. Get a free API Key at [Google_Maps_API](https://developers.google.com/maps/documentation)

2. Clone the repo
```sh
git clone https://github.com/SincerelyBrittany/b-owned.git
```
3. Install the gemfile packages
```sh
bundle install
```
4. Created a ``.env`` file, add the file to your gitignore, and enter your API KEYS:
```JS
  GOOGLE_KEY = "KEY_HERE"
  GOOGLE_CLIENT_ID = "ID_HERE"
  GOOGLE_CLIENT_SECRET = "SECRET_HERE"
```
<!-- USAGE EXAMPLES -->
## Usage

<a href="https://www.youtube.com/watch?v=l1rQYSUjRu8">View Demo</a> on ways to use the application.

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/SincerelyBrittany/b-owned/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<!-- CONTACT -->
## Contact
Connect/Follow me:

[![Linkedin][linkedin-shield]][linkedin-url]
[![Twitter][twitter-shield]][twitter-url]
[![Dev.to][dev-to-shield]][dev-to-url]


<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Youtube](https://youtube.com)
* [Google](https://google.com)
* [Flatiron School](https://flatironschool.com/)


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/SincerelyBrittany/b-owned.svg?style=flat-square
[contributors-url]: https://github.com/SincerelyBrittany/b-owned/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/SincerelyBrittany/b-owned.svg?style=flat-square
[forks-url]: https://github.com/SincerelyBrittany/b-owned/network/members
[stars-shield]: https://img.shields.io/github/stars/SincerelyBrittany/b-owned.svg?style=flat-square
[stars-url]: https://github.com/SincerelyBrittany/b-owned/stargazers
[issues-shield]: https://img.shields.io/github/issues/SincerelyBrittany/b-owned.svg?style=flat-square
[issues-url]: https://github.com/SincerelyBrittany/b-owned/issues
[license-shield]: https://img.shields.io/github/license/SincerelyBrittany/b-owned.svg?style=flat-square
[license-url]: https://github.com/SincerelyBrittany/b-owned/blob/master/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/sincerelybrittany/
[twitter-shield]:https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2Ftwitter.com%2FSincerelyBrittt
[twitter-url]: https://twitter.com/SincerelyBrittt
[dev-to-url]: https://dev.to/sincerelybrittany
[dev-to-shield]:https://img.shields.io/badge/-Dev.to-black.svg?style=flat-square&logo=dev.to&colorB=555
[product-screenshot]: https://github.com/SincerelyBrittany/b-owned/blob/master/app/assets/images/main_page.png
[logo-screenshot]: https://github.com/SincerelyBrittany/b-owned/blob/master/app/assets/images/logo.png
