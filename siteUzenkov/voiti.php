<?php session_start(); ?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <a href="index.php"><h1>ГЛАВНАЯ</h1></a>
    <?php
require('connect.php');
if(isset($_POST['username']) and isset($_POST['password'])) {
$username = $_POST['username'];
$password = $_POST['password'];

$query = "SELECT * FROM users WHERE username='$username' and password='$password'";
$result = mysqli_query($connection, $query) or die(mysqli_error($connection));
$count = mysqli_num_rows($result);

if($count == 1) {
$_SESSION['username'] = $username;
} else {
$fmsq = "Ошибка - неверное имя или пароль";
}
}
if(isset($_SESSION['username'])) {
$username = $_SESSION['username'];
echo "<h1>Вы вошли, $username</h1> ";
echo "<a href='logaut.php'><h1>Выйти</h1></a>";
}
?>

<?php if(isset($fmsq)) { ?><div class="alert-false" role="alert"> <?php echo $fmsq; ?> </div><?php } ?>
<form class="form-avt" method="POST">
<center><input type="text" name="username" placeholder="Username" required></center>
<center><input type="password" name="password" placeholder="Password" required></center>
<center><button type="submit" id="avt">Войти</button><center>

</form>

    <!-- <form action="#" method="get" style="display: flex; flex-direction: column">
        <label for="name">E-mail</label>
        <input type="text" name="email" placeholder="example@mail.ru" required="">
        <label for="name">Пароль</label>
        <input type="password" name="password" placeholder="paSsw0rd!" required="">
        <input type="submit" value="Войти"> -->
    </form>
    <br>
    Все поля обязательны!
</body>
</html>
<!-- http://fb7920kc.bget.ru/ -->