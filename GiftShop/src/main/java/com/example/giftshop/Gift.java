package com.example.giftshop;

/**
 * This class was automatically generated by the data modeler tool.
 */

@javax.persistence.Entity
@javax.persistence.Table(name = "Gift")
public class Gift implements java.io.Serializable {

	static final long serialVersionUID = 1L;

	@org.kie.api.definition.type.Label(value = "Identifier")
	private java.lang.Long id;
	@org.kie.api.definition.type.Label(value = "Type of the gift, i.e.: Flower,")
	private java.lang.String type;
	@org.kie.api.definition.type.Label(value = "Price of this gift")
	private java.math.BigDecimal price;
	@org.kie.api.definition.type.Label(value = "Address to deliver this gift")
	private java.lang.String deliveryAddress;
	@org.kie.api.definition.type.Label(value = "Name of the person buying the gift")
	private java.lang.String buyerName;
	@org.kie.api.definition.type.Label(value = "Message to be included in the gift card")
	private java.lang.String message;
	@org.kie.api.definition.type.Label(value = "Fee of this delivery according to the distnace")
	private java.math.BigDecimal deliveryFee;

	public Gift() {
	}

	@javax.persistence.GeneratedValue(strategy = javax.persistence.GenerationType.AUTO, generator = "GIFT_ID_GENERATOR")
	@javax.persistence.Id
	@javax.persistence.SequenceGenerator(name = "GIFT_ID_GENERATOR", sequenceName = "GIFT_ID_SEQ")
	public java.lang.Long getId() {
		return this.id;
	}

	public void setId(java.lang.Long id) {
		this.id = id;
	}

	public java.lang.String getType() {
		return this.type;
	}

	public void setType(java.lang.String type) {
		this.type = type;
	}

	public java.math.BigDecimal getPrice() {
		return this.price;
	}

	public void setPrice(java.math.BigDecimal price) {
		this.price = price;
	}

	public java.lang.String getDeliveryAddress() {
		return this.deliveryAddress;
	}

	public void setDeliveryAddress(java.lang.String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}

	public java.lang.String getBuyerName() {
		return this.buyerName;
	}

	public void setBuyerName(java.lang.String buyerName) {
		this.buyerName = buyerName;
	}

	public java.lang.String getMessage() {
		return this.message;
	}

	public void setMessage(java.lang.String message) {
		this.message = message;
	}

	public java.math.BigDecimal getDeliveryFee() {
		return this.deliveryFee;
	}

	public void setDeliveryFee(java.math.BigDecimal deliveryFee) {
		this.deliveryFee = deliveryFee;
	}
	
	public Gift(java.lang.Long id, java.lang.String type,
			java.math.BigDecimal price, java.lang.String deliveryAddress,
			java.lang.String buyerName, java.lang.String message,
			java.math.BigDecimal deliveryFee) {
		this.id = id;
		this.type = type;
		this.price = price;
		this.deliveryAddress = deliveryAddress;
		this.buyerName = buyerName;
		this.message = message;
		this.deliveryFee = deliveryFee;
	}
	
	@Override
	public String toString() {
		return "Gift [buyerName=" + buyerName + ", deliveryAddress=" + deliveryAddress + ", deliveryFee=" + deliveryFee
				+ ", id=" + id + ", message=" + message + ", price=" + price + ", type=" + type + "]";
	}

	
}