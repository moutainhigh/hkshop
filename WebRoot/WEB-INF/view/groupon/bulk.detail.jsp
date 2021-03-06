<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="../wrapper.prefix.jsp"/>

<section class="hbox stretch">
    <aside class="aside-md bg-white b-r" id="subNav">
        <section class="vbox">
            <header class="b-b header"><p class="h4">团购活动详情</p></header>
            <section class="scrollable w-f">
                <ul class="nav nav-pills nav-stacked no-radius">
                    <li class="b-b m-t-none-reset nav-map active" id="nav_base">
                        <a href="javascript:;">
                            <i class="fa fa-chevron-right pull-right m-t-xs text-xs icon-muted"></i>
                            <i class="fa fa-fw fa-ellipsis-v"></i>
                                                                                    基本信息
                        </a>
                    </li>
                </ul>
            </section>
        </section>
    </aside>
    
    <aside class="bg-white">
        <section class="vbox">
            <header class="header bg-white b-b clearfix">
                <div class="m-t-sm">
                    <a href="#subNav" data-toggle="class:hide" class="btn btn-sm btn-default active btn-nav-goods" btn_nav_goods_index="0">
                        <i class="fa fa-caret-right text fa-lg"></i>
                        <i class="fa fa-caret-left text-active fa-lg"></i>
                    </a>
                        <a href="javascript:;" class="btn btn-sm btn-default" id="button_cancel"><i class="fa fa-reply"></i> 返回</a>
                </div>
            </header>
              
            <section class="scrollable wrapper">
                <section class="panel panel-default portlet-item">
	                <header class="panel-heading">团购活动详情</header>
		            <table class="table table-striped2 m-b-none text-sm">
                        <tbody>
                            <tr>                    
                                <td class="col-sm-2">团购名称:</td>
                                <td class="col-sm-4">${bulk.title}</td>
                                <td class="col-sm-2">N件起团，N件生效:</td>
                                <td class="col-sm-4">${bulk.number}</td>
                            </tr>
                            <tr>                    
                                <td class="col-sm-2">团购开始时间：</td>
                                <td class="col-sm-4">
                                    <fmt:formatDate value="${bulk.startTime}" pattern="yyyy-MM-dd hh:mm"/>
                                </td>
                                <td class="col-sm-2">团购结束时间:</td>
                                <td class="col-sm-4">
                                    <fmt:formatDate value="${bulk.endTime}" pattern="yyyy-MM-dd hh:mm"/>
                                </td>
                            </tr>
                            <tr>                    
                                <td class="col-sm-2">团购总库存:</td>
                                <td class="col-sm-4">${bulk.inventorySum}</td>
                                <td class="col-sm-2">库存准量:</td>
                                <td class="col-sm-4">${bulk.inventory}</td>
                            </tr>
                            <tr>                    
                                <td class="col-sm-2">团购价格:</td>
                                <td class="col-sm-4">${bulk.price}</td>
                                <td class="col-sm-2">商品 sku:</td>
                                <td class="col-sm-4">${bulk.sku}</td>
                            </tr>
                            <tr>                    
                                <td class="col-sm-2">商品名称:</td>
                                <td class="col-sm-4">${bulk.goodsName}</td>
                                <td class="col-sm-2">可否使用积分:</td>
                                <td class="col-sm-4">
                                    <c:choose>
                                        <c:when test="${bulk.integral == 1}">
                                                                                                                                可用
                                        </c:when>
                                        <c:otherwise>
                                                                                                                                不可用 
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr>                    
                                <td class="col-sm-2">团购标签:</td>
                                <td class="col-sm-4">
                                    <c:set var="choosedArr" value="${fn:split(bulk.categoryId, ',')}" />
                                    <c:forEach items="${choosedArr}" var="choosed">
	                                    <c:forEach items="${categorys}" var="category">
	                                        <c:if test="${choosed == category.categoryId }">
				                                <label class="checkbox-inline">
				                                    <input type="checkbox" name="categoryIds" id="categoryId" value="${category.categoryId}" 
				                                       checked disabled/>${category.title}
				                                </label>
			                                </c:if>
	                                    </c:forEach>      
		                            </c:forEach>
                                </td>
                                <td class="col-sm-2"></td>
                                <td class="col-sm-4"></td>
                            </tr>
                        </tbody>
                    </table>
                </section>
            </section>
        </section>
    </aside>
</section>

<jsp:include page="../wrapper.suffix.jsp"/>
<script src="${STATIC_URL}/modules/groupon/js/bulk.detail.js" type="text/javascript"></script>