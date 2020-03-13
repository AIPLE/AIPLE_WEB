
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, aboutAPI.*"%>
<%@ page import="java.util.*, beans.*"%>
<jsp:useBean id="UID" class="aboutAPI.UUIDControl" />
<jsp:useBean id="Option" class="aboutAPI.AILearningOption" />
<%
	AILearningOptionBean optionBean = new AILearningOptionBean();
	String loginSession = (String)session.getAttribute("loginSession");
	Object result;
	if(loginSession == null){
		result = UID.createUUID("unknown:"+session.getId());
	}else{
		result = UID.createUUID("user:"+ loginSession);
	}
	if(result.equals("false")){
		%>
	 	<script>
	 		alert("고유번호 생성에 실패하였습니다. 다시 시도해주세요.");
	 		history.back();
	 	</script>
		<%
	}else{
		optionBean.setInputSize(Integer.parseInt(request.getParameter("inputSize")));
		optionBean.setHiddenSize(request.getParameter("hiddenSize"));
		optionBean.setOutputSize(Integer.parseInt(request.getParameter("outputSize")));
		optionBean.setActivation(request.getParameter("activation"));
		optionBean.setWeightDecayLambda(Float.parseFloat(request.getParameter("weightDecayLambda")));
		optionBean.setDropout(Boolean.parseBoolean(request.getParameter("dropout")));
		optionBean.setDropoutRation(Float.parseFloat(request.getParameter("dropoutRation")));
		optionBean.setBatchNorm(Boolean.parseBoolean(request.getParameter("batchNorm")));
		optionBean.setEpoch(Integer.parseInt(request.getParameter("epoch")));
		optionBean.setMiniDatchSize(Integer.parseInt(request.getParameter("miniDatchSize")));
		optionBean.setOptimizer(request.getParameter("optimizer"));
		optionBean.setOptimizerParam(Integer.parseInt(request.getParameter("optimizerParam")));
		optionBean.setInitStdType(request.getParameter("initStdType"));
		optionBean.setInitStdValue(Float.parseFloat(request.getParameter("initStdValue")));
		
		Option.optionSetting(UUID.fromString(result.toString()), optionBean);
		response.sendRedirect("../Index.jsp");
	}
	
%>