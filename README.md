magicspec
=====================

A simple web automation test framework using [selenium-webdriver](http://docs.seleniumhq.org/projects/webdriver/),[watir-webdriver](https://github.com/watir/watir-webdriver),[page-object](https://github.com/cheezy/page-object) and [rspec](https://github.com/rspec/rspec). 

This should get you up and running magically.  Much like rails this should scaffold tests and make it easy to add new specs an pages using generators and templates.

Install magicspec
---------------
Install magicspec from rubygems

	gem install magicspec

Or clone from github, build the gem and install 

Create a magicspec project 
------------------------
Open a command console and type just like below:

	magicspec new your_project_name	
		
Install project dependencies
------------
Dependencies are mangaged via bundler.
Go to the root folder and run `bundle install`


Run Examples
------------

Magicspec contains some examples that explain how to use magicspec writing your own test cases.

By default, magicspec runs examples using chrome browser, so make sure you installed google chrome and according [chrome driver](http://code.google.com/p/chromedriver/downloads/list)

Using following command to make everything running.

	cd your_project_name
	rspec

Add a new spec
------------
magicspec new_spec NAME

Add a new page
------------
magicspec new_page NAME

Running
------------
Althogh there is a magicspec run command, you can and should use the usual rspec commands.

Understand magicspec project structure
------------------------------------

A magicspec project has a clean and simple structure. 

* app: The top folder that contains test code.
* config: The folder which holds .  You set things such as tags and your browser here.

* app->pages: Page files are here.
* app->pages->components: Reusable page components.

* app->spec: Spec files are located here.
* app->spec->shared: Reusable components here.

* app->reports: This folder holds your test reports.

* app->support->matchers: defind your owner rspec matchers here.


