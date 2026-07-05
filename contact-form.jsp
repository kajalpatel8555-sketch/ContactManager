<!DOCTYPE html>
<html>
<head>
    <style>
        body{
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .container{
            width: 400px;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
        }

        input{
            width: 100%;
            padding: 8px;
            margin: 8px 0;
        }

        button{
            background: blue;
            color: white;
            padding: 10px;
            border: none;
            width: 100%;
        }
    </style>
    <title>Add Contact</title>
</head>
<body>

<div class="container">
    <h2>Add Contact</h2>

    <form action="contacts" method="post">
        <input type="text" name="name" placeholder="Enter Name">

        <input type="text" name="email" placeholder="Enter Email">

        <input type="text" name="phone" placeholder="Enter Phone">

        <button type="submit">Add Contact</button>
    </form>
</div>

</body>
</html>