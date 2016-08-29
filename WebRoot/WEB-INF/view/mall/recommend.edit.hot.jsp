<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../wrapper.prefix.jsp"/>
<%
// 动态获得地址配置
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link href="${STATIC_URL}/plugins/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
<section class="hbox stretch">
    <aside class="aside-md bg-white b-r">
        <section class="vbox">
            <header class="b-b header">
                <p class="h4"> <c:choose> <c:when test="${goodsRecommend!=null}">编辑</c:when><c:otherwise>添加</c:otherwise></c:choose></p>
            </header>
            <section class="scrollable wrapper w-f">
                <form class="form-horizontal" id="edit_form"
                	 action=<c:choose> <c:when test="${goodsRecommend!=null}">"${BASE_URL}/goodsRecommend/edit"</c:when>
                	 	<c:otherwise>"${BASE_URL}/goodsRecommend/add"</c:otherwise>
                	 	</c:choose> method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="goodsSku" class="col-sm-3 control-label"><font class="red">* </font>商品sku</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="goodsSku" name="goodsSku" value="${goodsRecommend.goodsSku}" 
                                onkeydown="if(event.keyCode==13)return false;" placeholder="请输入" />
                             </div>
                     </div><div class="line line-dashed line-lg pull-in"></div>
                    <div class="form-group">
                        <label for="filepath" class="col-sm-3 control-label"><font class="red">* </font>图片</label>
                            <div class="col-sm-7">
							  
					  		   <c:if test="${goodsRecommend.filepath !=null and goodsRecommend.filepath!=''}">
					  		   
					  		   <a href="${IMG_URL}${goodsRecommend.filepath}" >
							  	<img alt="" src="${IMG_URL}${goodsRecommend.filepath}" border="0" style="height: 80px; width: 100;">
					  		  </a>
					  		  <div style="margin-top: 20px"></div>
								<input type="file" name="businessImageFile" id="businessImageFile" value="${goodsRecommend.filepath}"
								 class="filestyle" data-icon="false"data-buttonText="上传图片"
								  data-classbutton="btn btn-default" 
								  data-classinput="form-control inline input-s" />
							  
								</c:if>
								<c:if test="${goodsRecommend.filepath ==null or goodsRecommend.filepath==''}">
									<input type="file" name="businessImageFile" id="businessImageFile" />
								</c:if>
                             </div>
                     </div><div class="line line-dashed line-lg pull-in"></div>
                    <input type="hidden" name="recommendId" value="${goodsRecommend.recommendId}" />
                    <input type="hidden" name="recommendType" id="recommendType" value="" />
                    <input type="hidden" name="basePath" id="basePath" value="" />
                </form>
            </section>
        
            <footer class="footer b-t bg-white-only">
                <div class="m-t-sm">
                    <button type="button" data_submit_type="submit_save_back" class="btn btn-s-md btn-primary btn-sm input-submit">保存</button>
                    <c:if test="${goodsRecommend==null}"><button type="button" data_submit_type="submit_save_continue" class="btn btn-s-md btn-primary btn-sm input-submit">保存并继续添加</button></c:if>
                    <button type="button" data_submit_type="submit_cancel" class="btn btn-danger btn-sm input-submit">取消</button>
                    <span id="edit_notice"></span>
                </div>
            </footer>
        </section>
    </aside>
</section>

<jsp:include page="../wrapper.suffix.jsp"/>
<script src="${STATIC_URL}/plugins/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="${STATIC_URL}/plugins/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script src="${STATIC_URL}/modules/mall/js/recommend.edit.hot.js" type="text/javascript"></script>
<script>
	$(function(){
		var type = '${recommend_type}';
		$('#recommendType').val(type);
		
		if (type==='00') {
			$('#basePath').val('/goodsFirstRec/index?type=00');
		}else if(type==='11'){
			$('#basePath').val('/goodsSecondRec/index?type=11');
		}
		else if(type==='22'){
			$('#basePath').val('/secondSaleRec/index?type=22');
		}
		else if(type==='33'){
			$('#basePath').val('/goodsOnsale/index?type=33');
		}
		
		
	})
</script>
<!-- / modal - 编辑-->