<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<title>User Registration Details</title>

<style>

body{
    font-family:Arial;
    background:#e6e6e6;
    margin:0;
}

.container{
    width:700px;
    margin:40px auto;
    background:white;
    padding:30px;
    border:1px solid gray;
    box-shadow:0 0 10px rgba(0,0,0,0.2);
}

h2{
    text-align:center;
    color:white;
    background-color:#0066cc;
    padding:10px;
}

table{
    width:100%;
    border-collapse:collapse;
}

td{
    padding:10px;
    border-bottom:1px solid #ddd;
}

.label{
    font-weight:bold;
    color:#555;
    width:40%;
}

</style>

</head>

<body>

<%

String username = request.getParameter("username");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String password = request.getParameter("password");
String confirm = request.getParameter("confirm");
String dob = request.getParameter("dob");
String gender = request.getParameter("gender");
String qualification = request.getParameter("qualification");
String college = request.getParameter("college");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");
String pincode = request.getParameter("pincode");
String question = request.getParameter("question");
String answer = request.getParameter("answer");
String address = request.getParameter("address");
String agree = request.getParameter("agree");

%>

<div class="container">

<h2>User Registration Successful</h2>

<table>

<tr>
<td class="label">User Name</td>
<td><%= username %></td>
</tr>

<tr>
<td class="label">Email</td>
<td><%= email %></td>
</tr>

<tr>
<td class="label">Phone Number</td>
<td><%= phone %></td>
</tr>

<tr>
<td class="label">Password</td>
<td><%= password %></td>
</tr>

<tr>
<td class="label">Confirm Password</td>
<td><%= confirm %></td>
</tr>

<tr>
<td class="label">Date of Birth</td>
<td><%= dob %></td>
</tr>

<tr>
<td class="label">Gender</td>
<td><%= gender %></td>
</tr>

<tr>
<td class="label">Qualification</td>
<td><%= qualification %></td>
</tr>

<tr>
<td class="label">College Name</td>
<td><%= college %></td>
</tr>

<tr>
<td class="label">City</td>
<td><%= city %></td>
</tr>

<tr>
<td class="label">State</td>
<td><%= state %></td>
</tr>

<tr>
<td class="label">Country</td>
<td><%= country %></td>
</tr>

<tr>
<td class="label">Pincode</td>
<td><%= pincode %></td>
</tr>

<tr>
<td class="label">Security Question</td>
<td><%= question %></td>
</tr>

<tr>
<td class="label">Security Answer</td>
<td><%= answer %></td>
</tr>

<tr>
<td class="label">Address</td>
<td><%= address %></td>
</tr>

<tr>
<td class="label">Terms & Conditions</td>
<td><%= agree %></td>
</tr>

</table>

</div>

</body>

</html>