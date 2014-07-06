`riemann-dash` on Heroku
----------------------

Easily deploy [riemann-dash](https://github.com/aphyr/riemann-dash) on Heroku. To set up:

    $ git clone https://github.com/jonasschneider/riemann-dash-heroku
    $ cd riemann-dash-heroku
    $ heroku create
    $ heroku addons:add redistogo:nano
    $ git push heroku master

