# jsp-sample-mysql-01
単純な SELECT の読み出し ( Java8 )

## C:\app\tomcat21\WEB-INF\lib\mysql-connector-java-8.0.21.jar

## lightbox.xml : "C:\xampp\tomcat\conf\Catalina\localhost\lightbox.xml"
```xml
<Context
	displayName="Web Application Home"
	docBase="c:\app\tomcat21"
	path="/lightbox"
	reloadable="true"
	useNaming="false">
</Context>
```

```java
Class.forName("com.mysql.jdbc.Driver");
try {
    conn = DriverManager.getConnection(
        "jdbc:mysql://localhost/lightbox?user=root&password=&characterEncoding=UTF-8"
    );

    conn.close();
}
catch (Exception e) {
    out.println( e.getMessage() );
}
```
