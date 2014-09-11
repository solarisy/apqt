[#ftl] 
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!-- namespace必须指向Dao接口 -->
<mapper namespace="com.wismay.apqt.repository.${class.name}Dao">
	<resultMap id="${class.name?uncap_first}Map" type="com.wismay.apqt.entity.${class.name}">
		<id property="id" column="id" />
		[#list class.fields as field] 
		<result property="${field.name}" column="${field.columnName}" />
	    [/#list] 
	</resultMap>
	
	<!-- 根据Id查询 -->
	<select id="getById" parameterType="int" resultMap="${class.name?uncap_first}Map">
		select * from ${class.tableName} where deleted=1 and id=${r"#{id}"}
	</select>
	
	<!-- 查询所有 -->
	<select id="getAll" resultMap="${class.name?uncap_first}Map">
		select * from ${class.tableName} where deleted=1
	</select>

	
	<!-- 查询 -->
	<select id="searchPage" parameterType="map" resultMap="${class.name?uncap_first}Map">
		select * from ${class.tableName} t 
		<where>
			<if test="true">
				AND t.deleted=1
			</if>
		</where>
		order by id DESC 
		LIMIT ${r"#{pageStart},#{pageSize}"}
	</select>
	
	<!-- 查询总数 -->
	<select id="searchCount" parameterType="map" resultType="Long">
		select count(1) from  ${class.tableName} t 
		<where>
			<if test="true">
				AND t.deleted=1
			</if>
		</where>
	</select>

	<!-- 保存 -->
	<insert id="save" parameterType="com.wismay.apqt.entity.${class.name}" useGeneratedKeys="true" keyProperty="id">
		insert into ${class.tableName} (
			[#list class.fields as field]${field.columnName},[/#list])
		values (
			[#list class.fields as field]${r"#{"}${field.Name}${r"}"},[/#list])
	</insert>
	
	<!-- 更新 -->
	<update id="update" parameterType="com.wismay.apqt.entity.${class.name}">
		update ${class.tableName} t set 
			t.id=${r"#{id}"} 
			[#list class.fields as field]
			<if test="${field.name} != null and ${field.name} != '' ">
				,${field.columnName}=${r"#{"}${field.name}${r"}"}
			</if>
			[/#list]
		where t.id=${r"#{id}"}
	</update>
	
	<!-- 删除 -->
	<delete id="delete" parameterType="int">
	     update ${class.tableName} set deleted=0 where id=${r"#{id}"}
	</delete>
	

</mapper> 
