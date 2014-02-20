magicspec
=====================

A simple web automation test framework using [selenium-webdriver](http://docs.seleniumhq.org/projects/webdriver/),[watir-webdriver](https://github.com/watir/watir-webdriver),[page-object](https://github.com/cheezy/page-object) and [rspec](https://github.com/rspec/rspec). 

This should get you up and running magically.

Install magicspec
---------------
Install magicspec from rubygems

	gem install magicspec

Or clone from github, build the gem and install 

Create a magicspec project 
------------------------
Open a command console and type just like below:

	magicspec new your_project_name	
		
Run Examples
------------

Lazyman contains some examples that explain how to use magicspec writing your own test cases.

By default, magicspec runs examples using chrome browser, so make sure you installed google chrome and according [chrome driver](http://code.google.com/p/chromedriver/downloads/list)

Using following command to make everything running.

	cd your_project_name
	rspec

Add a new spec
------------

Add a new page
------------

Using Console
-------------
You can use eat console to debug your test in irb.

	cd your_project_name
	magicspec c

Understand magicspec project structure
------------------------------------

A magicspec project has a clean and simple structure. 

* app: holds your test code;
* config: where your config file placed;

* app->pages: puts all your pages files here;
* app->pages->components: sometimes,there are some html element that could be reused more than once, define a component, place the file here and you can include your components in your pages.

* app->spec: holds your testcase files;
* app->spec->shared: Image that, you are testing a system which need to login before any actions, so you want to define a login function which can be called from your cases. Define reused cases here.

* app->reports: the fold holds your test reports.

* app->support->matchers: defind your owner rspec matchers here.


Contributing to magicspec
-----------------------
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2013 easonhan. See LICENSE.txt for
further details.

