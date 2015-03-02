Zepnik
=======

Zepnik was created to speed up bootstrapping Ruby Sinatra web apps. It employs many of the best-practices from around the web in a very easy to use structure.

# Installing

After running these three commands, you'll be ready to start defining your routes and running your app:

    git clone git@github.com:mikemackintosh/zepnik <projectname>
    cd <projectname>
    ./build.sh <projectname>
    
# Usage

### In Development

    shotgun --server=thin --port=8000 config.ru

### In Production

    unicorn -c config/unicorn.rb -E production
