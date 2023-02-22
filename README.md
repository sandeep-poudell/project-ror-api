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

For Calling APIs

1. Create an Article
```
curl --location --request POST 'http://localhost:3000/article' \
--header "Content-Type: application/json" \
--data '{
    "title": "Article 1",
    "content": "Content of Article 1",
    "status": 1
}'
                    
```

2. Show all Articles
```
curl --location --request GET http://localhost:3000/article
```

3. Show an Article by ID
```
curl --location --request GET http://localhost:3000/article/1
```

4. Update an Article
```
curl --location --request PUT 'http://localhost:3000/article/3' \
--header "Content-Type: application/json" \
--data '{
"title": "Article 3 updated",
"content": "Content of Article 3 updated",
"status": 1
}'
```

5. Delete an Article
```
curl --location --request DELETE http://localhost:3000/article/4
```
