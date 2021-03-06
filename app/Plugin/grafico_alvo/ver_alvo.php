<?php

//Parâmetros
$parameters = $_GET['table_data'];
$showLabel = $_GET['showlabel'] == "1";
$showScale = $_GET['showscale'] == "1";

$width = $_GET['width'];
$height = $_GET['height'];

if ($width == "") {
	$width = 500;
}
if ($height == "") {
	$height = 500;
}

$zones = 10;

$zonewidth = ($width*0.9)/$zones;
$zoneheight = ($height*0.9)/$zones;




//Inclui Pontos no Gráfico

$parameters = explode(';', $parameters);
$angle = 360/count($parameters);
$cX = width/2;
$cY = height/2;
$k = 0;
$colorStatus = array($color_darkgrey, $color_green, $color_yellow, $color_strongred, $color_blue);


foreach ($parameters as $parameter) {
	$atributos = explode(",", $parameter);
	$descricao = $atributos[0];
	$prioridade = $atributos[1];
	$andamento = $atributos[2];
	$cor = $colorStatus[$atributos[3]];
	
	$radius = (100 - str_replace('%', '', $andamento))*($zonewidth*10)/100/2;
	
	if ($prioridade == 'A') {
		$tamanho = 10;
	}
	if ($prioridade == 'B') {
		$tamanho = 7;
	}
	if ($prioridade == 'C') {
		$tamanho = 5;
	}
	
	$points[] = array(DrawCirclePointX($cX, $radius, $angle*$k), DrawCirclePointY($cY, $radius, $angle*$k), $tamanho, $descricao, $cor);	
	$k++;
}




//Pontos na circunferência

function DrawCirclePointX($cX, $radius, $angle) {
	$circlePointX = $cX+$radius*cos(deg2rad($angle));
	return $circlePointX;
}
function DrawCirclePointY($cY, $radius, $angle) {
	$circlePointY = $cY+$radius*sin(deg2rad($angle));
	return $circlePointY;
}

?>
<script type="text/javascript">
	function $(obj){
		return window.document.getElementById(obj);
	}
</script>

<img id="alvo" src="http://<?php echo $_SERVER['HTTP_HOST'] . $this->base; ?>/alvo.php?width=<?php echo $_GET['width']; ?>&height=<?php echo $_GET['height']; ?>&showscale=<?php echo $_GET['showscale']; ?>&showlabel=<?php echo $_GET['showlabel']; ?>&table_data=<?php echo $_GET['table_data']; ?>" usemap="#targetmap" />
<map id="targetmap" name="targetmap">
<?php
foreach ($points as $point) {
	$plot = $point;
	$plotX = $plot[0] + ($width/2);
	$plotY = $plot[1] + ($height/2);
	$plotZ = $plot[2];
	$plotLabel = $plot[3];
	?>
	<area shape="circle" coords="<?php echo $plotX.','.$plotY.','.$plotZ; ?>" onmouseout="$('<?php echo $plotLabel; ?>').style.display = 'none';" onmouseover="$('<?php echo $plotLabel; ?>').style.display = 'inline';" href="sun.htm" alt="<?php echo $plotLabel; ?>" caption="<?php echo $plotLabel; ?>" />
	<?php
	
}
?>

</map>

<?php
foreach ($points as $point) {
	$plot = $point;
	$plotX = $plot[0] + ($width/2);
	$plotY = $plot[1] + ($height/2);
	$plotZ = $plot[2];
	$plotLabel = $plot[3];
	?>
	<div id="<?php echo $plotLabel; ?>" style="left:<?php echo ($plotX+25) ?>;top:<?php echo ($plotY+25) ?>;position:absolute;display: none; background-color:lightyellow;border: 1px solid #AAA;"><?php echo $plotLabel; ?></div>
	<?php
	
}
?>
