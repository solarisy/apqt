package com.wismay.apqt.entity;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;


public class ${class.name} {

	public ${class.name}() {
	}
	
    <#list class.fields as field> 
	private ${field.type} ${field.name};
    </#list> 
    
    <#list class.fields as field> 
	public ${field.type} get${field.nameForPascal}(){
		return ${field.name};
	}
	
	public void set${field.nameForPascal}(${field.type} ${field.name}){
		this.${field.name}=${field.name};
	}
    </#list> 
   
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}