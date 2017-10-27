##### IMPORTANT: This is the new repository for our project. We switched to the Laravel Framework since with the NodeJS framework we had to do a lot of nested callbacks (see http://callbackhell.com/).

# ConUShop [![Build Status](https://travis-ci.com/z-alex/ConUShop.svg?token=epYMsfdC5GNowz3V2jMd&branch=master)](https://travis-ci.com/z-alex/ConUShop)

## Website Info

[www.conushop.com](http://conushop.com/)

**Admin Accounts:**

*Admin 1:*
- Username: ```admin1@conushop.com```
- Password: ```admin```

*Admin 2:*
- Username: ```admin2@conushop.com```
- Password: ```admin```

*Admin 3:*
- Username: ```admin3@conushop.com```
- Password: ```admin```

## Team 9 Members
- Jean-Michel Laliberté
- Alex Zhang
- Helen Zhang
- Batoul Yehia
- Yufeng Ding
- Sophia Quach
- Melissa Duong
- Karine Zhang
- Wei He

## Installation (do once)
1) We recommend that you use Xampp to run the Laravel framework app by following [this tutorial](https://www.codementor.io/magarrent/how-to-install-laravel-5-xampp-windows-du107u9ji).
2) Change Xampp's MySQL password to isY2metT by following [this tutorial](https://www.roodex.com/blog/change-password-phpmyadmin-mysql-xampp/).
3) Clone the Repository into htdocs with the folder named as laravel instead of ConUShop.

## Database Synchronization (do everytime the database model is modified)
1) Open the terminal.
2) Go to the project repository folder.
3) Type ```php artisan database:sync``` and press enter.

## Dependencies Synchronization (do everytime the dependecy list changes)
1) Open the terminal.
2) Go to the project repository folder.
3) Type ```composer update --no-scripts``` and press enter.

## Open the website on your local computer
- Go to ```laravel.dev``` on your browser (if you followed the tutorial in the installation step).
