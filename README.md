# Static sites with Heroku

The site is optimized to be deployed on Heroku, but can be deployed anywhere. First bundle the gems:

    bundle

Then you can start the server with foreman:

    foreman start

Then you can head to http://localhost:5000 to view the site as you work on it.

## Using Bower (optional)

Bower was used to manage some of the front end packages, but you shouldn't have to worry about that, if you do care, install bower with npm:

    npm install bower -g

Bower allows us to do cool things like manage our front-end packages easier or install them like this:

    bower install jquery modernizr underscore
