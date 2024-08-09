<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home page</title>
</head>
<style>
    h1{
        text-align: center;
        color: green;
    }
    button{
        margin-left: 50%;
        background-color: red;
        color: azure;
    }
    button:hover{
        background-color: green;
    }
</style>
<body>
    <h1>You've logged in successfully.</h1>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, facere quas non porro maxime obcaecati accusantium repudiandae totam fugit at recusandae voluptate dicta expedita, corrupti eius vel? Ab, fugiat dolor!
    Exercitationem debitis qui, nostrum error officia, suscipit distinctio repellendus illum praesentium voluptate dolore! Officia fugiat deleniti perferendis, animi voluptates numquam aliquam magni vero in minus aspernatur, architecto saepe, esse quis.
    Possimus soluta illo pariatur quibusdam autem praesentium quisquam fugiat quam quia suscipit repellat corporis voluptatibus cumque, cupiditate iusto incidunt animi! Commodi corrupti reprehenderit nisi asperiores temporibus odio necessitatibus aut quam?
    Minima exercitationem, officia animi ratione, dolorum tenetur earum eligendi, fugit ducimus soluta quaerat commodi. Ad, perspiciatis tempore! Distinctio recusandae quae dolor voluptate voluptates. Eum ipsum quia minima soluta beatae quaerat?
    Esse autem eveniet voluptate earum. Sint, ducimus atque. Delectus, minus dicta unde ratione dolore aspernatur itaque? Eveniet et repudiandae nam ab, amet consequatur non quidem error ipsum aliquam veritatis fugit.</p>
    <button onclick="redirectToLogin()">Logout</button>
</body>
<script>
    function redirectToLogin() {
        window.location.href = "/Registration_Project/details.jsp";
    }
</script>
</html>