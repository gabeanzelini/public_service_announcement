Public Service Announcement
===========================

Public Service Announcement is a Rails Engine allowing for the centralized management of public alerts.


Install
-------

Add this line to your Gemfile:

	gem 'public_service_announcement'
	
Then at the commandline:
	
	bundle install
	rake psa:migrations:copy
	rake db:migrate
	
Finally, add the code to output the messages to your application.html.erb file:

	<ul class="announcements">
		<% public_service_announcements.each do |announcement| %>
			<li><%= announcement %></li>
		<% end %>
	</ul>
	
And for haml:

	%ul.announcements
		- public_service_announcements.each do |announcement|
			li=announcement
			
Of course, you can actually format them anyway you like but this is how I do it.

Usage
-----

Navigate to:

	/psas
	
Create new announcement with a message, start date, and end date. You may, optionally, include max views, route regex to match, and/or user agent regex to match. The route and user agent regexes will default to exact match unless you specify either ^ or $.