<%@page import="java.util.Random"%>
<%@ page import="memberControl.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="image/favicon.ico">
<link rel="icon" href="image/favicon.ico">
<meta charset="UTF-8">
<title>Aiple</title>
</head>
<body>
	<header>
		<jsp:include page="general/top.jsp" flush="false" />
	</header>
	<section>
		<form action="" method="post">
			<div>inputSize / Integer : <input type="text" name="inputSize"></div>
			<div>hiddenSize / String : <input type="text" name="hiddenSize"></div>
			<div>outputSize / Integer : <input type="text" name="outputSize"></div>
			<div>activation / String : <input type="text" name="activation"></div>
			<div>weightDecayLambda / Float : <input type="text" name="weightDecayLambda"></div>
			<div>dropout / Boolean : <input type="checkbox" name="dropout"></div>
			<div>dropoutRation / Float : <input type="text" name="dropoutRation"></div>
			<div>batchNorm / Boolean : <input type="checkbox" name="batchNorm"></div>
			<div>epoch / Integer : <input type="text" name="epoch"></div>
			<div>miniDatchSize / Integer : <input type="text" name="miniDatchSize"></div>
			<div>optimizer / String : 
			<select name="optimizer">
				<option value="0">SGD
				<option value="1">Momentum
				<option value="2">Nesterov
				<option value="3">AdaGrad
				<option value="4">RMSprop
				<option value="5">Adam
			</select>
			</div>
			<div>optimizerParameter / Integer : <input type="text" name="optimizerParam"></div>
			<div>initStandardType / String : 
				<select name="initStdType">
					<option value="-1">--Select-- 
					<option value="0">he
					<option value="1">Xavier
				</select>
			</div>
			<div>initStandardValue / Float : <input type="text" name="initStdValue"></div>
			<input type="submit" value="확인">
		</form>
	</section>
	<footer>
		<jsp:include page="general/bottom.jsp" flush="false" />
	</footer>
</body>
</html>