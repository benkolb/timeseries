<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="http://benkolb.github.io/favicon.ico">
<title>BK Time Series</title>
</head>
<body>
<h1>Time Series</h1>
<p>Create and make available a set of widely used macroeconomic time series.</p>

<?php $row = 1; if (($handle = fopen("data.csv", "r")) !== FALSE) { while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) { $num = count($data); echo " ","Record #",$row," "; $row++; for ($recordcount=0; $recordcount < $num; $recordcount++) { echo $data[$recordcount] . " \n"; } } fclose($handle); } ?>

<a href='#data'>data</a>

<a href="http://benkolb.github.io/">back</a>
</body>
</html>
