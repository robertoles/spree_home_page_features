#Spree Home Page Features

This adds a section to your spree home page where you can include 'features', which are basically news items. 


# Installation

First add the reference to your gem file

    # Gemfile
    gem 'spree_home_page_features', github: 'ricardoaandres/spree_home_page_features', branch: '2-3-stable'


Then from your console bundle it & install the migration

    bundle install
    bundle exec rake spree_home_page_features:install:migrations
    bundle exec rake db:migrate
    
You may want to import the required scripts (into `javascript/application.js`) to make it work

`//= require home_page_features`

I would totally recommend you to create your own styles to fit in your design. The original structure was modified, so the base styles will no work.

Finally initialize the extension

	$(function() {
  	  $('.flexslider').flexslider();
	});
	
For extended options please refer to [http://www.woothemes.com/flexslider](http://www.woothemes.com/flexslider/).


# What can I add to a new feature?


|Element    |Data type     |
|-----------|:------------:|
|Title      |string        |
|Description|text          |
|Image      |file          |
|Product    |Spree::Product|
|Taxon      |Spree::Taxon  |
|Published  |boolean       |

# Styles

When you create a feature in the backend, you have the option of setting a style. This will add the style as class to the feature div. I intended this to be used to allow the site administrator select a backdrop for the article they are writing. To set the available styles in the dropdown, simply add the list of styles you would like available to a decorator in your models directory...

    # app/models/spree/home_page_feature_decorator.rb
    Spree::HomePageFeature.styles = ['style1', 'style2', 'etc']

You can then define a css file in your assets folder which define the styles...

    # app/assets/stylesheets/store/home_page_feature_styles.css
    li.feature.style1 { background-color: purple }
    li.feature.style2 { background-color: lime }
    li.feature.etc    { background-color: orange }
