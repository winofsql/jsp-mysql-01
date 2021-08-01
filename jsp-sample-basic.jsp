<%@ page
    language="java"
    import="java.sql.*"
    contentType="text/html;charset=utf-8" %>
<%!
// *********************************************************
// ローカル関数
// *********************************************************
%>
<%
// *********************************************************
// ページ処理
// *********************************************************
request.setCharacterEncoding("utf-8");

String title = "MySQL";

%>
<!DOCTYPE html>
<html>
<head>
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css">

<style>
#main {
    font-size: 24px;
}

#mysql {
    white-space: pre;
}
</style>

</head>
<body>
<div id="main">
<div class="alert alert-primary"><%= title %></div>
<div id="mysql" class="m-5">
<% 
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver");

try {

    conn = DriverManager.getConnection(
        "jdbc:mysql://localhost/lightbox?user=root&password=&characterEncoding=UTF-8"
    );

    // ステートメント
    stmt = conn.createStatement();
    // SQL 実行
    rs = stmt.executeQuery("select * from 社員マスタ");

    while( rs.next() ) {
                
        out.println(rs.getString("社員コード"));
        out.println(rs.getString("氏名"));
        out.println(rs.getString("フリガナ"));
        out.println(rs.getString("所属"));
        out.println(rs.getString("性別"));
        out.println(rs.getString("作成日"));
        out.println(rs.getString("更新日"));
        out.println(rs.getString("給与"));
        out.println(rs.getString("手当"));
        out.println(rs.getString("管理者"));
        out.println(rs.getString("生年月日"));

        out.print("<hr>");
    }

    rs.close();
    stmt.close();
    conn.close();

}
catch (Exception e) {
    out.println( e.getMessage() );
}

%>

</div>
</div>
</body>
</html>
