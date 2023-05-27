# Security-Misconfiguration - VersexHomeAutomation Application

## Database
1. Install XAMPP (link: https://www.apachefriends.org/de/index.html)
2. Start the ApacheWebserver and MYSQL Database <br>
Link: http://localhost/phpmyadmin/
3. Create new user "versex" password "hs@hK5D7I(p2I[hu" in phpmyadmin
4. Create new database with the name "versex-home-automation-db"
5. Import database schema from "database/versex-home-automation-db.sql"

## Backend
1. Add following User-Secret in Visual Studio:
```
{
    "ConnectionStrings": {
        "DBConnection": "server=localhost;port=3306;user=versex;password=hs@hK5D7I(p2I[hu;database=versex-home-automation-db;"
    },
    "JWTSettings": {
        "JWT_VALIDITY_DURATION": "08:00:00",
        "JWT_SECRET": "eyJSb2xlIjoiQWRtaW4iLCJJc3N1ZXIiOiJJc3N1ZXIiLCJVc2VybmFtZSI6IkphdmFJblVzZSIsImV4cCI6MTY1NTI5Njc4MiwiaWF0IjoxNjU1Mjk2NzgyfQ"
    }
}
```
2. Start the backend service from Visual Studio <br>
Link: https://localhost:7227/swagger/index.html

## Frontend
1. Start the frontend with the command ```ng serve --open``` <br>
Link: http://localhost:4200
2. Login-Page: <br>
   Admin:<br>

    -    username:    <b>admin</b> <br>
    -    password:    <b>test123</b> <br

   User:<br>

    -    username:    <b>user</b> <br>
    -    password:    <b>test123</b>

Do not use this demo application in production, contains security vulnerabilities!
