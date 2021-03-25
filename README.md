Find Recipe API

To use this app

First run bundle install.
Then, start the app with ruby run.rb

Implementing Bundler
Bundler allows you to denote which gems the app uses and lock your specific version. Then, it gives others a command to automatically install those gems. It's a great gem version tracker for large apps.

Start by using bundle init and then you can add gems to the gemfile.

Include the bundler by adding require 'bundler' and Bundler.require to the top of your code.

Creating a run file with bin
Using bin is a common method to allow us to run our executable without calling ruby in our terminal.

Deliverables

In this project , i'm allowing user to find their favourite recipe , they can also find recipe by typing ingredient whatever they have available , they also can see instruction for the recipe and summary .