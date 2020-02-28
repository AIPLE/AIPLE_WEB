package beans;

public class AILearningOptionBean {
	private Integer inputSize;
	private String hiddenSize; // JSON 형식의 자료형으로 API 리턴 예정
	private Integer outputSize;
	private String activation;
	private Float weightDecayLambda ;
	private Boolean dropout;
	private Float dropoutRation;
	private Boolean batchNorm;
	private Integer epoch;
	private Integer miniDatchSize;
	private String optimizer; // SGD, Momentum, Nesterov, AdaGrad, RMSprop, Adam 종류
	private Integer optimizerParam;
	private String initStdType;
	private Float initStdValue;
	
	public Integer getInputSize() {
		return inputSize;
	}
	public void setInputSize(Integer inputSize) {
		this.inputSize = inputSize;
	}
	public String getHiddenSize() {
		return hiddenSize;
	}
	public void setHiddenSize(String hiddenSize) {
		this.hiddenSize = hiddenSize;
	}
	public Integer getOutputSize() {
		return outputSize;
	}
	public void setOutputSize(Integer outputSize) {
		this.outputSize = outputSize;
	}
	public String getActivation() {
		return activation;
	}
	public void setActivation(String activation) {
		this.activation = activation;
	}
	public Float getWeightDecayLambda() {
		return weightDecayLambda;
	}
	public void setWeightDecayLambda(Float weightDecayLambda) {
		this.weightDecayLambda = weightDecayLambda;
	}
	public Boolean getDropout() {
		return dropout;
	}
	public void setDropout(Boolean dropout) {
		this.dropout = dropout;
	}
	public Float getDropoutRation() {
		return dropoutRation;
	}
	public void setDropoutRation(Float dropoutRation) {
		this.dropoutRation = dropoutRation;
	}
	public Boolean getBatchNorm() {
		return batchNorm;
	}
	public void setBatchNorm(Boolean batchNorm) {
		this.batchNorm = batchNorm;
	}
	public Integer getEpoch() {
		return epoch;
	}
	public void setEpoch(Integer epoch) {
		this.epoch = epoch;
	}
	public Integer getMiniDatchSize() {
		return miniDatchSize;
	}
	public void setMiniDatchSize(Integer miniDatchSize) {
		this.miniDatchSize = miniDatchSize;
	}
	public String getOptimizer() {
		return optimizer;
	}
	public void setOptimizer(String optimizer) {
		this.optimizer = optimizer;
	}
	public Integer getOptimizerParam() {
		return optimizerParam;
	}
	public void setOptimizerParam(Integer optimizerParam) {
		this.optimizerParam = optimizerParam;
	}
	public String getInitStdType() {
		return initStdType;
	}
	public void setInitStdType(String initStdType) {
		this.initStdType = initStdType;
	}
	public Float getInitStdValue() {
		return initStdValue;
	}
	public void setInitStdValue(Float initStdValue) {
		this.initStdValue = initStdValue;
	}
}
