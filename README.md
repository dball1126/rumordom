# Ruby on Rails Tutorial sample application

This is the sample application for
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

## License

All source code in the [Ruby on Rails Tutorial](http://railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

For more information, see the
[*Ruby on Rails Tutorial* book](http://www.railstutorial.org/book).



up to chapter 13   need to finish listing 13.41 error messages...

up to 13.58   keep an eye on microposts = reviews

up to listing 13.59 


up to listing 13.62       start making data in the website and try to pull businesses and reviews on a feed...maybe a new feed with a new page. 




up to 14.5 14.6 

14.10

up to 14.16 listing

up to 14.31

finished 14


trying to add timestamps to experiences


working on timestamps for _experiences.erb still but now trying to still fox following users and businesses at the same time look at users controller business controller relationships and relationshipz



just added: 
belongs_to :followerz, class_name: "User", optional: true
  belongs_to :followedz, class_name: "Business", optional: true
  
  just took out remote: true
  
  4/5/2018
  
  Still having major trouble following both businesses and users at the same time.  Lately I changed belongs_to over to has_many in model when compared to rumordom and the book
  
  
  $("#followz_form").html("<%= escape_javascript(render('businesses/followz')) %>");
$("#followerzs").html('<%= @business.followerzs.count %>');  

changed @user and 's over to @business and now it works with remote forms

Check routes.  Issue in routes.



app view static pages home   review feed     the feed is not working


just finished experiences

Fixed following.  
Somewhat fixed the feed....Try changing Experience to Review (top one in user model)


check app controllers businesses controllers


Must Fix current_user   4 28 18

check businesses not users start at 13.3.5

i need to add :picture to the experience database and create and change the table
need to reset database just added :picture to it


need to fix experience page.


up to line 19 on businesses show on youtube video 535  5 10 2018

Trying to fix the search method for businesses



PLAN:1. Look at Organization.  Comment out the valid geocode and before save geocode and import records with coordinates.   2. uncomment the geocode and import records that need to be geocoded but only after speaking to Google about pricing.