# Project 2 Evaluation
[inline code comments]()
## Technical Requirements
**3: Excelling**
>Includes many well-structured models, and advanced functionality such as authorization, 3rd-party API integration, or other technology not covered in class

## Creativity and Interface
**3: Excelling**
>The app is fully responsive, incorporates outside technologies such as Flexbox. App incorporates modern UI themes, and adds unique flair.

## Code Quality
**3: Excelling**
>No major code quality issues, makes use of Ruby best practices appropriately, and follows techniques such as separation of concerns, abstraction, and encapsulation

## Deployment and Functionality
**2: Performing**
>Application contains no major errors, is deployed correctly, and contains a custom Heroku app name appropriate for the app.

>Look into using environment variables for your S3 key so you can get images to show up again on your deployed app.

## Planning / Process / Submission
**1: Progressing**
>App is submitted, with basic evidence of planning. Documentation exists, but lacks common areas such as setup instructions, description of application functionality and link to deployed application.

>Make sure to write up your README.md with all of the information required by the project prompt.

## Code Comments

```diff
diff --git a/app/assets/javascripts/jquery.raty.js b/app/assets/javascripts/jquery.raty.js
index c583651..b538a6c 100755
--- a/app/assets/javascripts/jquery.raty.js
+++ b/app/assets/javascripts/jquery.raty.js
@@ -9,6 +9,9 @@
  *
  */

+// Because this is not a js created specific for this project but rather from a
+// third party, best practice would be to put it in vendor/assets/javascripts
+
 ;
 (function($) {
   'use strict';
diff --git a/app/assets/stylesheets/application.css.scss b/app/assets/stylesheets/application.css.scss
index 2ffbe0c..a7cdfdf 100644
--- a/app/assets/stylesheets/application.css.scss
+++ b/app/assets/stylesheets/application.css.scss
@@ -1,6 +1,8 @@
  @import "bootstrap-sprockets";
  @import "bootstrap";
-
+ // Nice use of @import and the boostrap gem for styling
+// One thing to address: When the window is sized all the way in, the nav inverts
+// but also covers some of the main
  .book {
    height: 350px;
    width: 250px;
diff --git a/app/controllers/books_controller.rb b/app/controllers/books_controller.rb
index 7888179..cfb80cb 100644
--- a/app/controllers/books_controller.rb
+++ b/app/controllers/books_controller.rb
@@ -1,5 +1,9 @@
 class BooksController < ApplicationController
 before_action :authenticate_user!, only: [:new, :edit]
+# Really interesting method here of using search filters and an adaptive
+# index view. You could have also set up routes and views for categories
+# that books would be nested within, but I like the decision here to just
+# use categories as a filter.
   def index
     if params[:category].blank?
     @books = Book.all.order('author ASC, title ASC')
diff --git a/app/controllers/reviews_controller.rb b/app/controllers/reviews_controller.rb
index d139215..9673f75 100644
--- a/app/controllers/reviews_controller.rb
+++ b/app/controllers/reviews_controller.rb
@@ -1,6 +1,7 @@
 class ReviewsController < ApplicationController
 before_action :find_book
 before_action :authenticate_user!, only: [:new, :edit]
+# good use of before_action to enforce user authentication

 def new
   @review = Review.new
diff --git a/app/models/user.rb b/app/models/user.rb
index b87888e..ea76060 100644
--- a/app/models/user.rb
+++ b/app/models/user.rb
@@ -1,6 +1,7 @@
 class User < ApplicationRecord
   # Include default devise modules. Others available are:
   # :confirmable, :lockable, :timeoutable and :omniauthable
+  # Good job bringing in Devise for your user model
 has_many :books
 has_many :reviews

diff --git a/app/views/books/index.html.erb b/app/views/books/index.html.erb
index df0d101..cb07af6 100644
--- a/app/views/books/index.html.erb
+++ b/app/views/books/index.html.erb
@@ -1,10 +1,14 @@
-<h1 class = "current-category"><%= params[:category]%></h1>
-
+<%# use an if statement here to avoid generating a blank h1 in the case
+that there is no category filter applied %>
+<% if params[:category] %>
+  <h1 class = "current-category"><%= params[:category]%></h1>
+<% end %>


 <div class ="row">
 <% @books.each do |book|%>
 <div class = "col-md-3">
+  <%# Nice use of bootstrap for layout styling and responsiveness %>
 <a href="/books/<%= book.id %>">
   <%=image_tag book.book_img, class: "book" %>
 </a>
diff --git a/app/views/books/new.html.erb b/app/views/books/new.html.erb
index 1e772e3..41b8895 100644
--- a/app/views/books/new.html.erb
+++ b/app/views/books/new.html.erb
@@ -2,3 +2,4 @@
 <br/>

 <%= render 'form' %>
+<%# Good aherence to best practice here via the use of a form partial %>
diff --git a/app/views/books/show.html.erb b/app/views/books/show.html.erb
index 91c899d..4262db1 100644
--- a/app/views/books/show.html.erb
+++ b/app/views/books/show.html.erb
@@ -45,6 +45,8 @@
     </div>
   </div>

+<%# Move the content of these script tags into the app/assets/javascripts folder
+either on application.js or as a separate js file (separation of concerns)%>
   <script>
   $('.review-rating').raty({
     readOnly: true,
diff --git a/app/views/layouts/application.html.erb b/app/views/layouts/application.html.erb
index 57afebe..1e3b8b4 100644
--- a/app/views/layouts/application.html.erb
+++ b/app/views/layouts/application.html.erb
@@ -18,6 +18,7 @@
         <% if current_user %>
         <li><%= link_to "Add Book", new_book_path%></li>
         <%end%>
+        <%# Nice UI here using a bootstrap dropdown ++ %>
         <li class="dropdown">
           <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Categories <span class="caret"></span></a>
           <ul class="dropdown-menu" role="menu">
diff --git a/app/views/layouts/mailer.html.erb b/app/views/layouts/mailer.html.erb
index cbd34d2..2058fb6 100644
--- a/app/views/layouts/mailer.html.erb
+++ b/app/views/layouts/mailer.html.erb
@@ -3,7 +3,7 @@
   <head>
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
     <style>
-      /* Email styles need to be inline */
+       /*Email styles need to be inline */
     </style>
   </head>

diff --git a/app/views/reviews/edit.html.erb b/app/views/reviews/edit.html.erb
index 4974a42..d39fb36 100644
--- a/app/views/reviews/edit.html.erb
+++ b/app/views/reviews/edit.html.erb
@@ -11,6 +11,7 @@
 </div>

 <script>
+// Move this to app/assets/javascripts
 $('#rating-form').raty({
   path: '/assets',
   scoreName: 'review[rating]'
diff --git a/config/routes.rb b/config/routes.rb
index c56b56b..c6026d9 100644
--- a/config/routes.rb
+++ b/config/routes.rb
@@ -1,5 +1,6 @@
 Rails.application.routes.draw do
   devise_for :users
+# Good job setting up a redirect for the root

 root 'books#index'
 resources :books do
diff --git a/db/migrate/20170227183728_add_user_id_to_books.rb b/db/migrate/20170227183728_add_user_id_to_books.rb
index dfa3bbe..0caa811 100644
--- a/db/migrate/20170227183728_add_user_id_to_books.rb
+++ b/db/migrate/20170227183728_add_user_id_to_books.rb
@@ -1,5 +1,7 @@
 class AddUserIdToBooks < ActiveRecord::Migration[5.0]
   def change
     add_column :books, :user_id, :integer
+    # If you wanted to more specifically designate this as a foreign key:
+    # add_reference :books, :user, foreign_key: true
   end
 end
diff --git a/db/migrate/20170228035309_add_attachment_book_img_to_books.rb b/db/migrate/20170228035309_add_attachment_book_img_to_books.rb
index 7371f12..e860956 100644
--- a/db/migrate/20170228035309_add_attachment_book_img_to_books.rb
+++ b/db/migrate/20170228035309_add_attachment_book_img_to_books.rb
@@ -1,4 +1,5 @@
 class AddAttachmentBookImgToBooks < ActiveRecord::Migration
+  # Great job setting up your schema to work with paperclip
   def self.up
     change_table :books do |t|
       t.attachment :book_img
```
