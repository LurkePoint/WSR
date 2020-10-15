<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

	<?php
require('connect.php');
if(isset($_POST['username']) && isset($_POST['password'])) {
$username = $_POST['username'];
$email = $_POST['email'];
$password = $_POST['password'];
$query = "INSERT INTO users (username, email, password) VALUES ('$username', '$email', '$password')";
$result = mysqli_query($connection, $query);
if($result) {
$smsq = "Регистрация прошла успешно";
} else {
$fsmsq = "Ошибка - недопустимое имя или почта";
}
}
?>



<a href="index.php"><h1>ГЛАВНАЯ</h1></a>
<?php if(isset($smsq)) { ?><center><div class="alert-true" role="alert"> <?php echo $smsq; ?> </div></center><?php } ?>
<?php if(isset($fsmsq)) { ?><center><div class="alert-false" role="alert"> <?php echo $fsmsq; ?> </div></center><?php } ?>
<form class="form-reg" method="POST">
<center><input type="text" name="username" placeholder="Username" required></center>
<center><input type="email" name="email" placeholder="E-mail" required></center>
<center><input type="password" name="password" placeholder="Password" required></center>
<center><button type="submit" id="reg">Зарегистрироваться</button></center>

</form>
    
   
    <center><p>Все поля обязательны!</p></center>
    
</body>
</html>