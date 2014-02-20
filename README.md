magicspec
=====================

A simple web automation test framework using [selenium-webdriver](http://docs.seleniumhq.org/projects/webdriver/),[watir-webdriver](https://github.com/watir/watir-webdriver),[page-object](https://github.com/cheezy/page-object) and [rspec](https://github.com/rspec/rspec). 

This should get you up and running magically.  Much like rails this should scaffold tests and make it easy to add new specs an pages using generators and templates.

Install magicspec
---------------
Install magicspec from rubygems

	Open a Windows Command Prompt.
	At the command prompt, type "gem install magicspec"

Or clone from github, build the gem and install 

Create a magicspec project 
------------------------
Open a Windows Command Prompt. Switch directories to some location suitable for storing your project. 

Example:

	C:\Windows\System32>cd ../../Users/dv223/"My Documents"


Type the dialog below to create your project.
*Note: Project name must not contain spaces!

	magicspec new <your_project_name_here>	

Change directories into the directory to make sure it exists.


	cd <your_project_name_here)

The directory should contain these three folders;

	app
	bin
	config

The directory should contain the this file;

	.rspec

Run Examples
------------

Lazyman contains some examples that explain how to use magicspec writing your own test cases.

By default, magicspec runs examples using chrome browser. Make certain Google Chrome is installed with the approriate driver [chrome driver](http://code.google.com/p/chromedriver/downloads/list)

Within a Command Prompt window, use the following command to make sure everything is configured properly.

	cd <your_project_name_here>
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

