Demo Project: Reddit Content Viewer
===================================

Demo project for Park Bench Digital new developer project.


TODO:
Add emailing features.
Add pagination.
Add user account administration. 


Ruby on Rails
-------------

* Utilizing routes file to control pointer for webiste root.
* Utilizing a database connection for persistent application information storage.
* Using Models 
	- To represent objects from databases, 
	- Object-relational mapping.
* Using Controllers 
	- To manipulate database information using Models in an object oriented manner, and
	- To prepare and stage necessary information for Views to render controller action results.
* Using Views
	- To recieve prepared display data, and output the data appropriately on the page. 
* Using database migration files to update application database schema.
	- Adding/removing columns, 
	- Adding/removing indices, 
	- Modifying column data type.
* Using database migrations to populate default setup data
	- Such as a default demo user account, and main menu items.
* Using basic forms for basic actions such as user login.
* Using Rails sessions to store persistent session data 
	- Such as the currently logged in user.
* Using flash hash to store ephemeral messages that last only until the next browser request. 
	- Store both a message and a message tone, so that negative tones can be presented in red, and positive tones be presented in green.
* Using partial templates to store redundant view template code, 
	- Such as error message display for every form.
* Using layouts to store shared site-wide elements, 
	- Such as the site-wide application header bar.
* Using custom helper methods to assist with Views rendering.
	- Refactored out for application-wide usage.
	- For example, to abstract the call to displaying form errors of an object.
* Using custom route to allow action name to be displayed in url with an aesthetic hyphen rather than an underscore.
	- For example, '/account/change-password' instead of '/account/change_password'


HTML, Forms
-----------

* Updating  Models with form submissions
* Using rails form helpers to generate forms in an object-aware manner.
	- When an object is provided, its attributes are automatically filled into the form fields.
* Using form data validation to ensure data matches requirements before saving.
	- Attribute data validation information stored on the Model layer of the application.
* Handling form error and outputting them to user.
	- When an error occurs during an attempt to save a Model object,
	- The user is returned to the form again, 
	- With a list of validation errors in the user's inputted data outputed,
	- With the form prepopulated with the user's original data so that the user does not have to type them all again.
	- The offending input field is also colored red.


Security
--------

* Implementing secure user authentication 
	- Using "has_secure_password" to store hashed password digests using bcrpt-ruby gem.
	TODO: Using before_action callback to protect sensitive actions from performing without being logged in.
* Using Rails sessions to store persistent session data.
	- Store user.id and user.username to remmember acrosse browser requests that the user is logged in.
	- Sessions stored securely using default Ruby on Rails "CookieStore", which prevents tampering by the calculation of a digest.
* Preventing the assignment of prohibited object attributes during the mass-assignment process
	- By using Ruby on Rails's "Strong Parameters", which will only allow submitted form POST parameters to update a specific selection of allowed object attributes.
* Preventing Cross-Site Request Forgery
	- By default, which adds a security token to all HTML form submissions, so that Ruby knows that the data action request was submitted by the actual user on the actual form on the actual web application.
* Preventing SQL injection
	- By always submitting database queries in a way such that Ruby on Rails handles user inputted data before insertion into an SQL query.


HTML, CSS
---------

* Using the CSS box model styling attributes to add borders, colors, and spacing for aesthetic layout.
* Using the CSS positioning model for custom arrangemnts of items for interface layout.
	- Custom positioning of the Application title in the header bar.
	- Custom positioning of the User login account links in the header bar.
* Using CSS rounded corners for aesthetic effect.
* Using standard pseudo-selectors to adjust links (anchor tag) behavior and appearance.
* Factoring out common CSS styles into generic classes
* Giving html elements multiple CSS classes to take advantage of refactored CSS styles.
* Using CSS Reset (http://meyerweb.com/eric/tools/css/reset/)
	- To reset all attribute values to zero or equivalent default, 
	- So that consistent layout style is displayed to all users across all browsers.
* Using CSS Hover pseudo-selector to add basic user interactivity without Javascript.
	- For example, feed items get a light shade of blue when the mouse hovers over them.
* Using CSS Float to allow text to wrap around images in an aesthetic manner.

HTML, JavaScript
----------------

* Allow Flash Notices to be dismissable by the user,
	- The user may click on a close box to make the div element be removed from the page DOM.
	- Adds to aesthetic appeal of the website achievable only through JavaScript.
* Leverage JQuery JavaScript library.
	- Ensure the consistent, reliable, and predictable execution of JavaScript code across all the most popular versions of web browsers, while ensuring productivity of programmer's time and energy.


Consumption of RESTful API
--------------------------
