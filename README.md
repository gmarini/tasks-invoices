![Tasks and Invoices](https://raw.githubusercontent.com/gmarini/tasks-invoices/master/docs/images/rrails.jpg "Tasks and Invoices")


# Table of Contents

* [Key technologies used](#tech-used) 
* [Summary of the Project](#project-summary) 
* [Steps](#project-steps) 
* [Team Members](#team-members)

# <a name="tech-used"></a>Key technologies used

`Ruby on Rails, HTML, CSS, HAML, SASS, SQLite and Bootstrap.`

# <a name="project-summary"></a>Summary
The idea of this project is take a tutorial that I found on [this](http://arubystory.blogspot.com.au/p/tutorials.html "A Ruby Story") site and make a similar one, but changing the structure of the database, adding file managment and user authentication
with the social networks using the `devise` and `omniauth` gems.

This project will be a site that allows people register, and make some tasks which will be like requests for a job with a deadline, a title, a description of the job and maybe some files attached to complete the job especification.

Once the task is saved the owner of the site gets an email with this information and then when he starts to work on the job sets the start time, once it is finished it sets the finish time and the site will make an invoice with the data from the user that made the requested task and the time it takes.

# <a name="project-steps"></a>Summary of the steps
1.  First of all you have to create your rails app.
	`rails new tasks-invoices`

2.  We have to add all the gems that we will need in the Gemfile on the root directory
	```
	gem 'haml'
	gem 'simple_form'
	gem 'bootstrap-sass', '~> 3.2.0'
	gem 'sass-rails', '~> 4.0.3'
	```
3. 	Run `bundle install` to download and install all the gems file that we don't have installed yet.

4. 	We are going to have a simple database schema
5. 	
	![Database diagram](https://raw.githubusercontent.com/gmarini/tasks-invoices/master/docs/images/simple-database.jpg "Database")

	Now we need to create all the models
		rails generate model Task title:string note:text deadline:datetime completed:datetime
		rails generate model Job task:references summary:string description:text start:datetime finish:datetime rate:float
	And we have to add  the directives `null: false, default: ""` to title and note in the tasks table and in summary in the jobs table as well as `default: ""` in description and `index: true` in task.
	After that we need to generate a migration: `rake db:migrate`.
5. 	Create the controllers for the pages
		`rails generate controller Pages home about`
	Then put `root 'pages#home'` in the routes.rb files
6. 	Add `@import 'bootstrap';` at the end of the application.css, then add .scss to the end of the name of the file and add `//= require bootstrap` after the jquery directives and before the tree directive in the application.js.
7. 	Create the `home` action in the page controller and also made the interface for it in `home.html.erb`
8. 	Add the directive `resources: tasks, except: [:index]` to the `routes.db` file, the except part is because we don't need an index action due to that we are going to show our tasks on the home page.
9. 	We need to generate the controller for task `rails generate controller tasks` and add the actions for new and create
10. 	Install bootstrap for simple_forms `rails generate simple_form:install --bootstrap`
11. 	Create the modal that is going to show the new task form using `simple_forms`

# <a name="team-members"></a>Team Members
* [Gustavo M. Marini](http://gustavommarini.com.ar "My personal Website (Under construction)")
