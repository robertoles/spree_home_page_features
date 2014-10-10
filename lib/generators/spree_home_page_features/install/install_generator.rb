module SpreeHomePageFeatures
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def add_javascripts
        append_file 'app/assets/javascripts/frontend/all.js', "//= require frontend/spree_home_page_features\n"
        append_file 'app/assets/javascripts/backend/all.js', "//= require backend/spree_home_page_features\n"
      end

      def add_stylesheets
        inject_into_file 'app/assets/stylesheets/frontend/all.css', " *= require frontend/spree_home_page_features\n", :before => /\*\//, :verbose => true
        inject_into_file 'app/assets/stylesheets/backend/all.css', " *= require backend/spree_home_page_features\n", :before => /\*\//, :verbose => true
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_home_page_features'
      end

      def run_migrations
         res = ask 'Would you like to run the migrations now? [Y/n]'
         if res == '' || res.downcase == 'y'
           run 'bundle exec rake db:migrate'
         else
           puts 'Skipping rake db:migrate, don\'t forget to run it!'
         end
      end
    end
  end
end
