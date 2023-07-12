<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/RentInform/Rent-Inform-FE">
    <img src="app/assets/images/philadelphia_004_1276_pano_up.jpg" alt="Logo" width="900" height="315">
  </a>

<h3 align="center">RentInform</h3>

  <p align="center">
    Welcome to the front end repository for RentInform! <br /> RentInform is a web application built for the Turing School of Software and Design's Mod 3 Consultancy project. Read more about project requirements: https://backend.turing.edu/module3/projects/consultancy/
    <br />
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#video-demonstration">Video Demonstration</a></li>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#testing">Testing</a></li>
    <li><a href="#wire">Wireframes</a></li>
    <li><a href="#tech">Technical Solutions</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

<img src="https://user-images.githubusercontent.com/120869196/244508852-ba6ffa81-7ad6-4ff0-9b8c-31a73fc9ce5f.jpeg">

RentInform is a civic data tool designed to help prospective Philadelphia renters gather information about potential new homes, avoid financial and health hazards, and make informed renting decisions to best meet their household's needs.

The front end application handles user interaction through the browser, and is built on Rails with HTML and CSS styling. It is responsible for user authentication and authorization, and consumes RESTful endpoints exposed through the back end application to deliver data about search results, saved properties, and property details to the views. The front end is also responsible for passing specific data through via JSON requests to perform CRUD actions in the back end database (ex. saving a property for a specific user).

- [Production Website](https://rent-inform-36792dcf8db2.herokuapp.com/)
- [Backend Service](https://sheltered-harbor-92742.herokuapp.com/)
  - To reach endpoint append `/api/v0/search?street='123-main-street'&zip='12345'` to URL linked above
  - See more endpoints [here](https://github.com/RentInform/BE-Rent-Inform)
- Github repositories:
  * Front End: [![Github][Github]][project-fe-gh-url]
  * Back End: [![Github][Github]][project-be-gh-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Video demonstration:

https://user-images.githubusercontent.com/120869196/252794482-5458c2ec-a1bd-4c38-8eb7-fba32d4f0265.mp4

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With:

* [![Ruby][Ruby]][Ruby-url]
* [![Rails][Rails]][Rails-url]
* [![Tailwind][Tailwind]][Tailwind-url]
* [![PostgreSQL][Postgres]][Postgres-url]
* [![CircleCI][CircleCI]][CircleCI-url]
* [![Heroku][Heroku]][Heroku-url]

Integrations:
* RentInform's front end application uses OAuth with Google for user authentication and log in
  * Gem: `omniauth-google-oauth2`, more information [here](https://github.com/zquestz/omniauth-google-oauth2) 
* Tailwind was used for CSS styling
  * Gem: `tailwindcss-rails`, more information [here](https://github.com/rails/tailwindcss-rails)
* New Relic was used for monitoring and observability
  * Gem: `newrelic_rpm`, more information [here](https://docs.newrelic.com/docs/apm/agents/ruby-agent/installation/install-new-relic-ruby-agent/) 

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

To demo RentInform on your local machine, follow these steps: 

### Back End Repository

1. Clone the back end [repo](https://github.com/RentInform/BE-Rent-Inform)
2. Follow instructions in the backend repo `README`

### Front End Repository
1. Clone this repo `git clone git@github.com:RentInform/Rent-Inform-FE.git`
2. Register for a MapQuest API Key [here](https://developer.mapquest.com/documentation/)
3. Navigate to the local repository: `cd Rent-Inform-FE`
4. Run: `bundle install`
5. Run: `rails db:{create,migrate}`
6. Run: `bundle exec figaro install`
7. Add `GOOGLE_CLIENT_ID`, `GOOGLE_CLIENT_SECRET`, `MAPQUEST_KEY`, and `NEW_RELIC_LICENSE_KEY` to `config/application.yml` file 
8. Run: `rails s` to start rails server
9. Visit: http://localhost:5000/

### Prerequisites
- Ruby Version 3.1.1
- Rails Version 7.0.5

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- Testing -->
## Testing

`bundle exec rspec` will run the entire test suite. *All tests are passing at time of writing.*

The team tested happy paths, sad paths, and edge cases when needed. Error messages were added where applicable. 


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Wireframes -->
## Wireframes

<details>
  <summary><code>Route: "/"</code></summary>
  Landing Page:
  <pre>
    <code>
      <img src="https://user-images.githubusercontent.com/120869196/244521339-51800267-c6e8-4c31-b7df-6962ab76e4e2.png" alt="Wire Frame" width="100%">
    </code>
  </pre>
</details>

<details>
  <summary><code>Route: "/login"</code></summary>
  Log in Page:
  <pre>
    <code>
      <img src="https://user-images.githubusercontent.com/120869196/244521810-3641a282-be5a-4fba-8199-af59933d3262.png" alt="Wire Frame" width="100%">
    </code>
  </pre>
</details>

<details>
  <summary><code>Route: "/sign_up"</code></summary>
  Sign up Page:
  <pre>
    <code>
      <img src="https://user-images.githubusercontent.com/120869196/244522084-5ee0fd40-7f39-4349-b66a-a1b80449c657.png" alt="Wire Frame" width="100%">
    </code>
  </pre>
</details>

<details>
  <summary><code>Route: "/dashboard"</code></summary>
  User Dashboard - New User Page:
  <pre>
    <code>
      <img src="https://user-images.githubusercontent.com/120869196/244522274-257ec12c-4409-47a8-859c-8fd1a4dc1af2.png" alt="Wire Frame" width="100%">
    </code>
  </pre>
  User Dashboard - Search + Saved Properties Page:
  <pre>
    <code>
      <img src="https://user-images.githubusercontent.com/120869196/244522377-f1573124-3713-4e13-95f2-45d6f70e6265.png" alt="Wire Frame" width="100%">
    </code>
  </pre>
</details>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Technical Solutions -->
## Technical Solutions

As part of the Consultancy project requirements, the RentInform team challenged ourselves to implement three stretch technologies during the two-week design and development process. We selected these technologies based on the challenges we anticipated facing while building out our MVP, and adjusted our choices to reflect our individual and team learning goals as well as blockers that came up during the course of working on the project.

### Background Workers
* <b>Challenge:</b> The available data on certification of rental compliance was only available in a CSV format, the number of entries in the list was very large (500K+), and the data needed significant de-duplication and normalization to be able to successfully query by address.
* <b>Solution:</b> We used the Rails Active Job framework, Sidekiq, and Redis to declare and run a job to read in the CSV file, sanitize the data, and populate our back end Postgres database with Property records. While our first draft job worked in development, we exceeded the memory limit of our Heroku deployment when we ran the job in production. To address this, we broke the single job into three smaller jobs with a single responsibility each, and also split our CSV file so that the most memory-intensive portion of the task was completed in batches. A future extension might include adding jobs to periodically download a new CSV from the City of Philadelphia’s website and a job to handle breaking the large CSV into multiple smaller parts for faster processing.

### Observability
* <b>Challenge:</b> Once our application was deployed, we did not have a good way to measure response times, track performance, or analyze how the app was working in production beyond reviewing errors and logs.
* <b>Solution:</b> We researched popular observability platforms with free access tiers, including Honeybadger and New Relic. We decided on New Relic for this project because it offered an easy-to-read metrics dashboard with information on page response and loading times.  We configured New Relic for both our front end and back end repositories, and ran some experiments interacting with our application to help us determine where best to utilize caching.

### Caching
* <b>Challenge:</b> Two of the API endpoints that expose data for the front end of our application rely on both database queries and external API calls, and were running slowly (10-15+ seconds per call) when first deployed. This delay resulted in a less-than-ideal experience for our users.
* <b>Solution:</b> After interacting with our application running live and reviewing data from New Relic, we realized that the endpoints for searching properties and getting more details for a property were running slowest, and were good candidates for low-level caching since they contained information that was not likely to change quickly (addresses and scores). We used the `Rails.cache` syntax and some [helpful documentation](https://www.honeybadger.io/blog/rails-low-level-caching/) to cache these requests in the front end service object that handles the call to the back end API, and noticed immediate improvements in response times. We decided not to implement caching for other API calls that would change frequently, such as the request to get all saved properties for a specific user.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- ROADMAP -->
## Roadmap

Features added to MVP 2.0 as of July 2023:
* Build out property details page for displaying more information about property to users
* Add map with address marker to property details page
* Add information about nearby parks to property details page
* Update UI to improve accessibility and design
  
Additional features, functionality, and potential refactors:
* Standard user registration and log in (to be added to the OAuth workflow)
* Two-factor authentication
* Improve search to match on zipcode and/or lat & lon coordinates
  * Allow a visitor to search properties with different queries 
* Expanded error handling 
  * Could potentially include rescuing from standard Rails errors
* Implement more details for the user through additional external API calls
  * Amenities: Grocery stores, schools, libraries
  * Commute time to workplace from searched property
  * Aggregate score for the property from within the application
* Allow a user to add notes for the property
* Compare properties
* Share properties
* Allow users to export their saved properties to Google Drive

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

* Caroline Peri: [![Linkedin][linkedin]][caroline-li-url] [![Github][Github]][caroline-gh-url]
* Grace Joh: [![Linkedin][linkedin]][grace-li-url] [![Github][Github]][grace-gh-url]
* Logan Cole: [![Linkedin][linkedin]][logan-li-url] [![Github][Github]][logan-gh-url]
* Stephen McPhee: [![Linkedin][linkedin]][stephen-li-url] [![Github][Github]][stephen-gh-url]

<b>Special Thanks:</b> Jamison Ordway, our instructor and project manager

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Install Tailwind CSS with Ruby on Rails](https://tailwindcss.com/docs/guides/ruby-on-rails)
* [How to Setup Tailwind 3 on Rails 7](https://dev.to/software_writer/how-to-setup-tailwind-3-on-rails-7-2dbo)
* [Banner Image - Philly Skyline](https://www.skylinescenes.com/products/philadelphia-skyline-panorama-2-2-2)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/RentInform/Rent-Inform-FE.svg?style=for-the-badge
[contributors-url]: https://github.com/RentInform/Rent-Inform-FE/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/RentInform/Rent-Inform-FE.svg?style=for-the-badge
[forks-url]: https://github.com/RentInform/Rent-Inform-FE/network/members
[stars-shield]: https://img.shields.io/github/stars/RentInform/Rent-Inform-FE.svg?style=for-the-badge
[stars-url]: https://github.com/RentInform/Rent-Inform-FE/stargazers
[issues-shield]: https://img.shields.io/github/issues/RentInform/Rent-Inform-FE.svg?style=for-the-badge
[issues-url]: https://github.com/RentInform/Rent-Inform-FE/issues
[license-shield]: https://img.shields.io/github/license/RentInform/Rent-Inform-FE.svg?style=for-the-badge
[license-url]: https://github.com/RentInform/Rent-Inform-FE/blob/main/LICENSE.txt
[linkedin]: https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white
[caroline-li-url]: https://www.linkedin.com/in/carolineperi/
[grace-li-url]: https://www.linkedin.com/in/graceehjoh/
[logan-li-url]: https://www.linkedin.com/in/logan-cole-ab2179188/
[stephen-li-url]: https://www.linkedin.com/in/smcphee19/
[product-screenshot]: images/screenshot.png
[Ruby]: https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[Ruby-url]: https://www.ruby-lang.org/en/
[Rails]: https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[Rails-url]: https://rubyonrails.org/
[Tailwind]: https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white
[Tailwind-url]: https://tailwindcss.com/
[Postgres]: https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white
[Postgres-url]: https://www.postgresql.org/
[Redis]:  	https://img.shields.io/badge/redis-%23DD0031.svg?&style=for-the-badge&logo=redis&logoColor=white
[Redis-url]: https://redis.io
[CircleCI]: https://img.shields.io/badge/circleci-343434?style=for-the-badge&logo=circleci&logoColor=white
[CircleCI-url]: https://circleci.com/
[RSpec]: https://user-images.githubusercontent.com/120869196/244528226-7b4e762f-5c24-4a6e-9dec-65c20dcdae32.png
[RSpec-url]: https://rspec.info/documentation/
[Heroku]: https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white
[Heroku-url]: https://devcenter.heroku.com/articles/getting-started-with-rails7
[Github]: https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white
[project-fe-gh-url]: https://github.com/RentInform/Rent-Inform-FE
[project-be-gh-url]: https://github.com/RentInform/BE-Rent-Inform
[caroline-gh-url]: https://github.com/cariperi
[grace-gh-url]: https://github.com/grace-joh
[logan-gh-url]: https://github.com/exasperlnc
[stephen-gh-url]: https://github.com/SMcPhee19

<!-- * [Video Presentation]()    <div>
    <video src=“our-video-url” controls width=”340" height=”260">
    </video>
   </div> -->
