 <!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Mobile Shop</title>

	<script language = "javascript" type="text/javascript">
		function Calculate(obj) {
			var total = 0;
			var items = document.getElementsByClassName("item price");
			
			for (var i = 0; i < items.length; i++) {

				if (items[i].checked) {
					total += parseFloat(items[i].value);

				}
			
			}
			myspan.innerText = total+"yuan";
			// var item = document.getElementById("itemprice");




		}

	</script>
</head>

<body>

	<div class="image" name="image">
		<input type="checkbox" class="item price" value="4500" onclick="Calculate(this)">Chdajibaheck<br/>
		
	</div>
	<div class="image" name="image">
		<input type="checkbox" class="item price" value="100" onclick="Calculate(this)">CheckCheck<br/>
		
	</div>
	<br><span id="myspan">0</span>
</body>

</html> 
