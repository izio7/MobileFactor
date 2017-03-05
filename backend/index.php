<?php
if (isset($_POST['email'])) {
    echo "POST DATA<br>";
    print_r($_POST);
}
?>

<center>

<form action="/">
    <input type="text" id="fu" name="login"/><br>
    <input type="password" name="pass"/><br>
    <input type="submit"/>

</form>

</center>


<!---->
<!--<script type="application/javascript">-->
<!--    window.onload = function () {-->
<!--        //alert('asd');-->
<!--        //document.getElementById('fu').value = "123";-->
<!--        document.getElementsByName('login')[0].value = "123";-->
<!--    }-->
<!---->
<!--</script>-->