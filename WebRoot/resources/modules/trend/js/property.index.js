$(document).ready(function() {
	loadDataGridContent(columnsDefined(), 'formatData');
	
    /**
     * 刷新搜索
     */
    $(".action-refresh,#action_search").on('click',function(){
    	$('#content_listing').datagrid('reload');
    	return false;
    });
    
    /**
	 * 关键字搜索 - 支持回车
	 */
	$('input[name=key]').on('keypress', function (event) {
	    if (event.which == '13') {
	        $('#content_listing').datagrid("reload");
	        return false;
	    }
	});
    
    /**
     * 单个删除
     */
	$("#content_listing").delegate('.operate-delete', 'click', function(){
		var propertyId = $(this).attr("propertyId");
		doDeleteProperty(propertyId);
	});
    
    /**
     * 批量删除分类
     */
	$('#action_delete').on('click', function(){
		var id_arr = new Array();
		var i = 0;
		$('#content_listing').find('.select-single').each(function(){
			if ($(this).is(':checked')) {
				id_arr[i] = $(this).val();
				i++;
			}
		});
		var id = id_arr.join(',');
		
		if (! id) {
			return false;
		}
		
		doDeleteProperty(id);
	});
});


/**
 * 删除
 */
function doDeleteProperty(id) {
	var del = confirm('确定要删除所选属性吗？');
	if (! del) {return false;}
	
	/* 执行 */
	$.ajax({
    	type:'post',
        url:BASE_URL+'/trendProperty/delete',
        data:'ids=' + id,
        dataType:'json',
        timeout:60000,
        success:function(data){
    		if (data.status == 0) {
    			if (parseInt(id) == id) {
    				$("#property_" + id).parent().parent().remove();
    			} else {
    				$('#content_listing').find('.select-single:checked').parent().parent().remove();
    			}
    		} else {
    			alert(data.msg);
    		}
    		return false;
    	}
    });
}

function columnsDefined() {
	return [
            {
                property: 'checkbox',
                label: '<input type="checkbox" />'
            },
            {
                property: 'propertyId',
                label: 'ID',
                sortable: true
            },
            {
            	property: 'labelName',
            	label: '属性名称',
            	sortable: false
            },
            {
            	property: 'propertyValues',
            	label: '属性值',
            	sortable: false
            },
            {
            	property: 'note',
            	label: '备注',
            	sortable: false
            },
            {
            	property: 'sortOrder',
            	label: '序号',
            	sortable: false
            },
            {
            	property: 'isSpec',
            	label: '开启规格',
            	sortable: false
            },
            {
            	property: 'status',
            	label: '状态',
            	sortable: false
            },
            {
            	property: 'operate',
                label: '操作'
            }
        ];
}

function formatData(items) {
	$.each(items, function (index, item) {
    	item.checkbox = '<input type="checkbox" name="post[]" class="select-single" value="' + item.propertyId + '" />';
    	item.is_spec = item.is_spec == 1 ? '<i class="fa fa-check text-success" title="开启"></i>' : '<i class="fa fa-ban text-danger" title="不开启"></i>';
    	item.status = item.status == 1 ? '<i class="fa fa-check text-success" title="启用"></i>' : '<i class="fa fa-ban text-danger" title="不启用"></i>';
    	
    	item.operate = '<a href="'+BASE_URL+'/trendProperty/edit/?propertyId=' + item.propertyId + '" class="operate-edit load-content" title="编辑"><i class="fa fa-pencil"></i></a>&nbsp;&nbsp;' + 
				'<a href="javascript:;" class="operate-delete" id="property_' + item.propertyId + '" propertyId="' + item.propertyId + '" title="删除"><i class="fa fa-times"></i></a>';
    });
}