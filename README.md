# Booking

This is a Java (Spring Boot) backend of Ionic/Angular application. It is for demonstration purposes only. It uses Ionic/Angular as a front end technology and Spring Boot as a backend RESTful API.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Make sure the you hava Java and MySQL server installed. 
For development I was using Spring Tool Suite but you can use Eclipse also to edit the code. 

### Installing

After installing all necessary elements you can clone this repository and open application in your IDE. Because this is a Maven project all dependencies will be automatically downloaded. Next, you should edit the application.properties file to adjust the application to your environment: 


```
spring.datasource.username='enter your db username'
spring.datasource.password='enter your db password'
```

These are the values you should change according to your credentials for connecting to the database, assuming that MySQL server is running on localhost. 
Otherwise, you should also change the connection string. 


```
spring.datasource.url=jdbc:mysql://localhost:3306/booking?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC
```

File storage properties could also be changed to your desired location or you can leave it as it is.

```
file.upload-dir=/images/uploads
```

The next line sets the URL from where uploaded pictures by the user could be downloaded. 
Here you should insert the IP address and port of your server where Spring Boot is running.

```
file.download-url='http://<server ip address>:<port>
```


## Deployment

After setting all the properties you should deploy complete content on your server.

As this is Spring Boot Application with embedded Apache Tomcat server it is only needed to create executable JAR file and running it.

Using command line navigate into the root folder of the application and execute the next command: 

```
**for Linux**
./mvnw package

**for Windows**
mvnw package
```

After finishing, the JAR file with the name of your application is created in the target folder.

Before running the application you should run a script on your MySQL server for creating db with some data which you can add, delete or modify later.
The name of the script is booking.sql and it is placed at the root of the application folder.

Now navigate to target folder where JAR file is created and execute the next command in the command line:


```
java -jar <exact name of the file>.jar
```

Your application should be up and running on Apache Tomcat and you can start using it.



## Built With

* [Spring Boot](https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/)
* [MySQL](https://dev.mysql.com/doc/)
* [Spring Tool Suite](https://spring.io/guides/gs/sts/)


## Author

* **Željko Jeličić** 
