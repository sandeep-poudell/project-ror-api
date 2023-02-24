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


**For Calling APIs**

**ARTICLE RESOURCE**

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


**USER RESOURCE**

1. Create an User
```
curl --location --request POST 'localhost:3000/user' \
--header 'Content-Type: application/json' \
--data-raw '{
    "first_name": "User 2",
    "last_name": "User 2",
    "first_name_kana": "カタ",
    "last_name_kana": "カタ",
    "email": "user2@test.com",
    "password": "User1234",
    "gender": "male",
    "birth_date": "2000-06-25",
    "height": 180,
    "weight": 70
}'
                    
```

2. Auth Login [retrieve token]
```
curl --location --request POST 'localhost:3000/login' \
--header 'Content-Type: application/json' \
--data-raw '{
    "email": "user2@test.com",
    "password": "User1234"
}'
```

3. Get By ID [with token]
```
curl --location --request GET 'localhost:3000/user/self' \
--header 'token: e31bee8a-0671-4dee-bb1c-3e0a88abd8f4'
```

4. Update an User

```
curl --location --request PUT 'localhost:3000/user/self' \
--header 'token: e31bee8a-0671-4dee-bb1c-3e0a88abd8f4' \
--header 'Content-Type: application/json' \
--data-raw '{
"first_name": "User 2 updated",
"last_name": "User 2 updated",
"first_name_kana": "カタカタカタ",
"birth_date": "2000-01-01"
}'
```

5. Delete an User
```
curl --location --request DELETE 'localhost:3000/user/self' \
--header 'token: eeff0433-f589-4228-92dd-2f50910ded06'
```




