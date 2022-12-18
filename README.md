
<h1 align="center">
  <br>
  <a href="#"><img src="https://i.giphy.com/media/7pHTiZYbAoq40/giphy.webp" alt="Inception" width="300"></a>
  <br>
  Inception
  <br>
</h1>

<h4 align="center">This project aims to broaden your knowledge of system administration by using Docker and docker-compose.</h4>

<p align="center">
  <a href="https://badge.fury.io/js/electron-markdownify">
    <img src="https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white"
         alt=docker">
  </a>
  <a href="#"><img src="https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white"></a>
  <a href="#">
      <img src="https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white">
  </a>
  <a href="#">
    <img src="https://img.shields.io/badge/Hugo-black.svg?style=for-the-badge&logo=Hugo">
  </a>
  <a href="#">
    <img src="https://img.shields.io/badge/WordPress-%23117AC9.svg?style=for-the-badge&logo=WordPress&logoColor=white">
  </a>
</p>



<p align="center">
  <a href="#Project Overview">Project Overview</a> •
  <a href="#Building">Building</a> •
  <a href="#Author">Author</a> •
  <a href="#license">License</a>
</p>

## Project Diagram
![Diagram](https://i.imgur.com/L2rjKtK.png)

## Project Overview

* Every single image is built from scratch based on Alpine or Debian
  - NGINX.
  - MariaDB.
  - Wordpress.
  - Hugo.
  - Adminer.
  - Redis.
  - vSFTPd.
  - cAdvisor.
* Customizable credentials
  - Easily changle all credentials and secret by editing `.env` file.
* HTTPS only (TLSv1.3)
* Seprate Volumes for Wordpress and MariaDB for persistance
* Cross platform (duh)
  - Windows, macOS and Linux ready.
* Makefile for easy building and running or cleaning.

## :gear: Building

To run this project you need `Docker` and `docker-compose` installed on your computer.


```bash
# Clone this repository
$ git clone https://github.com/ahkecha/Inception

# Go into the repository
$ cd Inceptions

# A Simple make will fire up Inceptions
$ make all

# rebuild the containers
$ make build

# delete all containers
$ make fclean
```

## Author

@ahkecha


## License
GPL
---
> GitHub [@ahkecha](https://github.com/ahkecha) &nbsp;&middot;&nbsp;

