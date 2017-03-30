/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.sams.entity.order;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 订单管理Entity
 * @author wangqingxiang
 * @version 2017-03-30
 */
public class Order extends DataEntity<Order> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	private String code;		// 编号
	private String total;		// 总额
	private String remark;		// 备注
	private String textA;		// 销售主管审批
	private String textB;		// 财务主管审批
	private String textC;		// 领导审批
	
	public Order() {
		super();
	}

	public Order(String id){
		super(id);
	}

	@Length(min=0, max=64, message="名称长度必须介于 0 和 64 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=64, message="编号长度必须介于 0 和 64 之间")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}
	
	@Length(min=0, max=500, message="备注长度必须介于 0 和 500 之间")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@Length(min=0, max=255, message="销售主管审批长度必须介于 0 和 255 之间")
	public String getTextA() {
		return textA;
	}

	public void setTextA(String textA) {
		this.textA = textA;
	}
	
	@Length(min=0, max=255, message="财务主管审批长度必须介于 0 和 255 之间")
	public String getTextB() {
		return textB;
	}

	public void setTextB(String textB) {
		this.textB = textB;
	}
	
	@Length(min=0, max=255, message="领导审批长度必须介于 0 和 255 之间")
	public String getTextC() {
		return textC;
	}

	public void setTextC(String textC) {
		this.textC = textC;
	}
	
}