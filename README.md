# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


      <%=button_to 'Delete', article_path(article), method: :delete, onclick: "return confirm('Are you sure you want to delete this article?');"  %>

This indicates that the correct path for the destroy action is indeed article_path(article), not articles_path. The confusion might come from the fact that articles_path is used for the index and create actions, while article_path(article) is used for actions that require an id, like show, edit, update, and destroy.

unsplash