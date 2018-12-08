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



Today is June 13th
I have the category creation working
I have the import business method working
I took away a couple of attributes like description
Need to modify Schema with our values. 
Double check whether we can import just some columns
take a look at the gravator for on the Business Side and the picture uploader
Can I upload multiple pictures?
I may have to change the Username gravatar for feature as well depending.
Modified some stuff on business show and new pages.


Fixing heroku
dont know where the gitignore file is


8 24 18
I just fixed business attributes, but i removed email, this is throwing an error because apparenlty the gravatar was tied to the business email which is now gone.  Investigate ways to go around this.


<%= #gravatar_fors business, size: 50 %><%= gravatar_for @business %>

migration
class AddImageToBusinesses < ActiveRecord::Migration[5.1]
  def change
    add_column :businesses, :image, :string
  end
end

new.html.erb
<%= f.label :email %>
  <%= f.email_field :email, class: 'form-control' %>
  
  <%= f.label "Add image" %>
  <%= f.file_field :image %>
  
  9 15 18
  Couldnt load infowindow with search results.
  Search controller = @businesses
  Business controller in search = load_businessz after @businesses
  load_businessz = Instead of Business.all   use @businesses
  
  <div class="span4 box-container">
                <div class="holder">
                  <a class="overlay" href="#" title="property title">
                    <span class="more"></span>
                    <% if business.image_url.present? %>
                      <%= link_to image_tag(business.image_url.to_s), business %>
                    <% else %>
                      <%= link_to image_tag("http://placehold.it/300x190"), business %>
                    <% end %>
                    <div class="prop-info">
      <h3 class="prop-title"><%= link_to business.name, business %></h3>
      <ul class="more-info clearfix">
        <li class="info-label clearfix"><span class="pull-left">Phone:</span>
        <span class="qty pull-right"><%= business.phone %></span></li>
        <li class="info-label clearfix"><span class="pull-left">Location:</span>
        <span class="qty pull-right"><%= business.city.capitalize %>, <%= business.state.upcase %></span></li>
      </ul>
    </div>
    
    
  <%= gravatar_for user, size: 50 %>
    
    
    problem: 
    
    work on Google API error: over query limit.  unsupported argument error 0 when you search
    only when u do it by location.
    
    
    
    acts_as_mappable    work on this in rails 5
    
    
  #  stores.sort_by{|s| s.distance_to("brooklyn")}
  
  scripts
  
  twoo.each do |x|
  grades[x.name]=x.id
  end
  
  zooo.each do |x|
  x.category1_id=grades[x.category1]
  end
  
  zooo.each do |x|
  x.category2_id=grades[x.category2]
  end
  
  zooo.each do |x|
  x.category3_id=grades[x.category3]
  end
  
  zooo.each do |x|
  x.category1_id=0 if x.category1_id==nil
  x.category2_id=0 if x.category2_id==nil
  x.category3_id=0 if x.category3_id==nil
  end
  
  zooo.each{|x| x.category1_id=grades[category1]}
  
  zooo.each do |x|
  x.save
  end
  
  FOR DELETION
  Business.where("id > 11412 AND id < 60000").delete_all
  
  Select range from array
  bus=Business.all[10..100]
  
  Select specific from array
  use=Business.find(1)
  
  jjjjjjjjj
  
Business.where("id > 11413 AND id < 60000").delete_all

num=11412
zooo.each do |x|
x.id=num
num+=1
end












116061zoo

79845


num=11412
zooo.each do |x|
busz=Business.new
busz.id=num
busz.name=x.name
busz.city=x.city
busz.state=x.state
busz.zipcode=x.zipcode
busz.address1=x.address1
busz.address2=x.address2
busz.category1_id=x.category1_id
busz.category2_id=x.category2_id
busz.category3_id=x.category3_id
busz.category1=x.category1
busz.category2=x.category2
busz.category3=x.category3
busz.phone=x.phone
busz.website=x.website
busz.longitude=x.longitude
busz.latitude=x.latitude
busz.save
num+=1
end



array=["Accounting & Tax Services", "Arts, Culture & Entertainment", "Auto Sales & Service", "Banking & Finance", "Business Services", "Community Organizations", "Dentists & Orthodontists", "Education", "Health & Wellness", "Health Care", "Home Improvement", "Insurance", "Internet & Web Services", "Legal Services", "Lodging & Travel", "Marketing & Advertising", "News & Media", "Pet Services", "Real Estate", "Restaurants & Nightlife", "Shopping & Retail", "Sports & Recreation", "Transportation", "Utilities", "Wedding", "Events & Meetings"]


array.each do |x|
cat=Category.new
cat.name=x
cat.save
end