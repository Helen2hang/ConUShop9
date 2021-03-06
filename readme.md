##### IMPORTANT: This is the new repository for our project. We switched to the Laravel Framework since with the NodeJS framework we had to do a lot of nested callbacks (see http://callbackhell.com/).

## Repository history

 - Remember, we had this repository in the beginning (iteration 1 + beginning of iteration 2): https://github.com/Helen2hang/SOEN343 (We were using NodeJS and migrated after)

 - And after, we used this repository (itrations 2, 3 and 4): https://github.com/z-alex/ConUShop (The team was splitted after)

 - And for the iterations 4 and 5, here we are!

# ConUShop [![Build Status](https://travis-ci.com/z-alex/ConUShop9.svg?token=epYMsfdC5GNowz3V2jMd&branch=master)](https://travis-ci.com/z-alex/ConUShop9)

## Website Info

[www.conushop.com](http://conushop.com/)

**Admin Accounts:**

*Admin 1:*
- Username: ```admin1@conushop.com```
- Password: ```admin123```

*Admin 2:*
- Username: ```admin2@conushop.com```
- Password: ```admin123```

*Admin 3:*
- Username: ```admin3@conushop.com```
- Password: ```admin123```

*Client 1:*
- Username: ```client1@conushop.com```
- Password: ```client123```

*Client 2:*
- Username: ```client2@conushop.com```
- Password: ```client123```

*Client 3:*
- Username: ```client3@conushop.com```
- Password: ```client123```

## Team 9 Members
- Jean-Michel Laliberté
- Alex Zhang
- Helen Zhang
- Yufeng Ding
- Karine Zhang

## Installation (do once)
1) We recommend that you use Xampp to run the Laravel framework app by following [this tutorial](https://www.codementor.io/magarrent/how-to-install-laravel-5-xampp-windows-du107u9ji).
2) Change Xampp's MySQL password to isY2metT by following [this tutorial](https://www.roodex.com/blog/change-password-phpmyadmin-mysql-xampp/).
3) Clone the Repository into htdocs with the folder named as laravel instead of ConUShop.

## Database Synchronization (do everytime the database model is modified)
1) Open the terminal.
2) Go to the project repository folder.
3) Type ```php artisan database:sync``` and press enter.
4) Type ```php artisan databaseTest:sync``` and press enter. (To update the testing database)

## Dependencies Synchronization (do everytime the dependecy list changes)
1) Open the terminal.
2) Go to the project repository folder.
3) Type ```composer update --no-scripts``` and press enter.

## Open the website on your local computer
- Go to ```laravel.dev``` on your browser (if you followed the tutorial in the installation step).

## How to use vagrant (An alternative to Xampp)
1) Install virtual box
2) Install vagrant
3) add the homestead virtual box
4) install the plugin from the composer
5) "cd" into the project then: composer require laravel/homestead --dev
6) php vendor/bin/homestead make

vagrant up - starts virtual machine
vagrant halt - power off virtual machine
