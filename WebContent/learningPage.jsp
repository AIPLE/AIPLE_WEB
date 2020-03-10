<%@page import="java.util.Random"%>
<%@ page import="memberControl.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="image/favicon.ico">
<link rel="stylesheet" href="css/learningPage.css">
<link rel="icon" href="image/favicon.ico">
<meta charset="UTF-8">
<title>Aiple</title>
</head>
<body>
	<header>
		<jsp:include page="general/top.jsp" flush="false" />
	</header>
	<section>
		<form action="ProcPage/AILearningInsertProc.jsp" method="post">
			<ul id="inputForm">
				<li class="ui-state-default" id="1"><span
					class="ui-icon ui-icon-arrowthick-2-n-s" style="float: right;"></span>
					<div class="false">
						<b>layer</b>
						<div>
							inputSize / Integer : <input type="text" name="inputSize">
						</div>
						<div>
							hiddenSize / String : <input type="text" name="hiddenSize">
						</div>
						<div>
							outputSize / Integer : <input type="text" name="outputSize">
						</div>
						<div>
							activation / String : <input type="text" name="activation">
						</div>
						<div>
							weightDecayLambda / Float : <input type="text"
								name="weightDecayLambda">
						</div>
						<div>
							dropout / Boolean : <input type="checkbox" name="dropout"
								value="true">
						</div>
						<div>
							dropoutRation / Float : <input type="text" name="dropoutRation">
						</div>
						<div>
							batchNorm / Boolean : <input type="checkbox" name="batchNorm"
								value="true">
						</div>
						<div>
							epoch / Integer : <input type="text" name="epoch">
						</div>
						<div>
							miniDatchSize / Integer : <input type="text" name="miniDatchSize">
						</div>
						<div>
							optimizer / String : <select name="optimizer">
								<option value="SGD">SGD
								<option value="Mometum">Momentum
								<option value="Nesterov">Nesterov
								<option value="AdaGrad">AdaGrad
								<option value="RMSprop">RMSprop
								<option value="Adam">Adam
							</select>
						</div>
						<div>
							optimizerParameter / Integer : <input type="text"
								name="optimizerParam">
						</div>
						<div>
							initStandardType / String : <select name="initStdType">
								<option value="-1">--Select--
								<option value="he">he
								<option value="Xavier">Xavier
							</select>
						</div>
						<div>
							initStandardValue / Float : <input type="text"
								name="initStdValue">
						</div>
					</div>
					<input type="button" onclick="delLayer()" value="레이어 제거" />
				</li>
			</ul>
			<input type="button" id="addLayer" value="레이어 추가" /> <input
				type="submit" value="확인">
		</form>
		<script>
			var layerNv = 1;
			var setClass = true;
			$(function() {
				$("#inputForm").sortable({
					placeholder : "itemBoxHighlight",
					start : function(event, ui) {
						ui.item.data('start_pos', ui.item.index());
					},
					stop : function(event, ui) {
						var spos = ui.item.data('start_pos');
						var epos = ui.item.index();
						// reorder();
					}
				})

				$("#inputForm").disableSelection();
				$("#addLayer").click(function() {
					layerNv++;
					$("#inputForm").append(content());
					setClass = !setClass;
				});
			});
			function delLayer(){
				$(this).unwrap();
			}
			function content() {
				var content = '<li class="ui-state-default" id="1"><span class="ui-icon ui-icon-arrowthick-2-n-s" style="float: right;"></span>'
						+ '<div class="false">'
						+ '<b>layer</b>'
						+ '<div>inputSize / Integer : <input type="text" name="inputSize"></div>'
						+ '<div>hiddenSize / String : <input type="text" name="hiddenSize"></div>                             '
						+ '<div>outputSize / Integer : <input type="text" name="outputSize"></div>                            '
						+ '<div>activation / String : <input type="text" name="activation"></div>                             '
						+ '<div>weightDecayLambda / Float : <input type="text" name="weightDecayLambda"></div>                '
						+ '<div>dropout / Boolean : <input type="checkbox" name="dropout" value="true"></div>                 '
						+ '<div>dropoutRation / Float : <input type="text" name="dropoutRation"></div>                        '
						+ '<div>batchNorm / Boolean : <input type="checkbox" name="batchNorm" value="true"></div>             '
						+ '<div>epoch / Integer : <input type="text" name="epoch"></div>                                      '
						+ '<div>miniDatchSize / Integer : <input type="text" name="miniDatchSize"></div>                      '
						+ '<div>optimizer / String :                                                                          '
						+ '<select name="optimizer">                                                                          '
						+ '<option value="SGD">SGD                                                                        '
						+ '<option value="Mometum">Momentum                                                               '
						+ '<option value="Nesterov">Nesterov                                                              '
						+ '<option value="AdaGrad">AdaGrad                                                                '
						+ '<option value="RMSprop">RMSprop                                                                '
						+ '<option value="Adam">Adam                                                                      '
						+ '</select>                                                                                          '
						+ '</div>                                                                                             '
						+ '<div>optimizerParameter / Integer : <input type="text" name="optimizerParam"></div>                '
						+ '<div>initStandardType / String :                                                                   '
						+ '<select name="initStdType">                                                                    '
						+ '<option value="-1">--Select--                                                              '
						+ '<option value="he">he                                                                      '
						+ '<option value="Xavier">Xavier                                                              '
						+ '</select>                                                                                      '
						+ '</div>                                                                                             '
						+ '<div>initStandardValue / Float : <input type="text" name="initStdValue"></div>                     '
						+ '<input type="button" onclick="delLayer()" value="레이어 제거" />                                      '
						+ '</div>                                                                                                '
						+ '</li>'
				return content
			}
		</script>
	</section>
	<footer>
		<jsp:include page="general/bottom.jsp" flush="false" />
	</footer>
</body>
</html>