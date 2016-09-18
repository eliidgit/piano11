<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="coursepart">
<section class="content-header">
    <h1>
        栏目管理
        <small>列表</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/coursepart"><i class="fa fa-tag"></i> 栏目管理</a></li>
        <li class="active">列表</li>
    </ol>
</section>
<section class="content">
    <div class="box">
        <div class="box-header">
            <form class="form-inline" method="get" action="${baseUrl!}/admin/coursepart">
                <div class="form-group">
                    小节:<input type="text" class="form-control" name="name" value="${name!}" placeholder="栏目名"/>
                    课程:<input type="text" class="form-control" name="course_name" value="${course_name!}"
                              placeholder="课程名"/>
                </div>


                <button type="submit" class="btn btn-raised btn-default ">搜索</button>
                <div class="form-group">
                    &nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
                </div>



            <#--treeview-->
                <div class="form-group">
                    <button class="btn1 btn btn-primary" type="button">选择栏目</button>
                    <div class="modal" id="mymodal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span
                                            aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                    <h4 class="modal-title">模态弹出窗标题</h4>
                                </div>
                                <div class="modal-body">
                                    <p>
                                    <#--模态弹出窗主体内容-->
                                  <#--  <div id="treeview-searchable" class="form-group"></div>-->

                                    <div class="form-group">
                                        <ul id="zTreeContent" class="ztree"></ul>
                                    </div>


                                    </p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <button type="button" class="btn btn-primary">保存</button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                </div>



            </form>
        </div>
    </div>


    <div class="box-body">
        <div class="dataTables_wrapper form-inline dt-bootstrap">
            <table class="table table-hover table-bordered">
                <thead>

                <th>id</th>
                <th>所在课程</th>
                <th>父栏目</th>
                <th>栏目名</th>
                <th>栏目顺序</th>

                <#--To DO暂时没有真正实现，考虑去掉-->
                <th>子栏目数量(除课程外其他未实现考虑去掉)</th>

                <th>栏目类型</th>
                <th>操作</th>
                </thead>
                <tbody>
                    <#if page??>
                        <#list page.getList() as coursepart>
                        <tr>
                            <td>${coursepart.id!}</td>
                            <td>${coursepart.cname!}</td>
                            <td>${coursepart.parentname!}</td>
                            <td>${coursepart.name!}</td>
                            <td>${coursepart.part_index!}</td>

                            <td>${coursepart.unit_number!}</td>
                            <td>

                                <#if coursepart.type = '1'>
                                    课时

                                <#elseif coursepart.type = '2' >
                                    普通子栏目
                                <#elseif coursepart.type = '6' >
                                    作业子栏目
                                <#elseif coursepart.type = '3' >
                                    视频资源
                                    <@shiro.hasPermission name="coursepart:info">
                                        <a href="${baseUrl!}/admin/coursepart/info/${coursepart.id!}"><span
                                                class="glyphicon glyphicon-eye-open"></span></a>
                                    </@shiro.hasPermission>
                                <#elseif coursepart.type = '4' >
                                    音乐资源
                                    <@shiro.hasPermission name="coursepart:info">
                                        <a href="${baseUrl!}/admin/coursepart/info/${coursepart.id!}"><span
                                                class="glyphicon glyphicon-eye-open"></span></a>
                                    </@shiro.hasPermission>
                                <#elseif coursepart.type = '5' >
                                    作业资源
                                    <@shiro.hasPermission name="coursepart:info">
                                        <a href="${baseUrl!}/admin/coursepart/info/${coursepart.id!}"><span
                                                class="glyphicon glyphicon-eye-open"></span></a>
                                    </@shiro.hasPermission>
                                </#if>
                            </td>


                            <td>
                                <@shiro.hasPermission name="coursepart:edit">
                                    <a href="${baseUrl!}/admin/coursepart/edit/${coursepart.id!}"><span
                                            class="glyphicon glyphicon-edit"></span></a>
                                </@shiro.hasPermission>
                                <@shiro.hasPermission name="coursepart:delete">
                                    <a href="javascript:delete_coursepart('${coursepart.id!}')"><span
                                            class="glyphicon glyphicon-trash"></span></a>
                                </@shiro.hasPermission>


                                <@shiro.hasPermission name="coursepart:addchild">
                                    <a href="${baseUrl!}/admin/coursepart/add/${coursepart.id!}"><span
                                            class="fa fa-fw fa-plus"></span></a>
                                </@shiro.hasPermission>

                            </td>
                        </tr>
                        </#list>
                    </#if>

                </tbody>
            </table>
            <div class="row">
                <div class="col-sm-5">
                    <div class="dataTables_info" id="example2_info" role="status" aria-live="polite">
                        总栏目数：
                        <#if page??>
                        ${page.getTotalRow()}
                        </#if>
                    </div>
                </div>
                <div class="col-sm-7">
                    <div class="dataTables_paginate paging_simple_numbers">
                        <#include "/page/admin/common/_paginate.ftl"/>
                            <#if page??>
                        <@paginate currentPage=page.pageNumber totalPage=page.totalPage
                        actionUrl="${baseUrl!}/admin/coursepart/index" urlParas="&name=${name!}&course_name=${course_name!}" />
                    </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <@shiro.hasPermission name="coursepart:add">
        <div class="box-footer">
            <a href="${baseUrl!}/admin/coursepart/add/0" class="btn btn-raised  btn-default pull-right">添加一级栏目</a>
        </div>
    </@shiro.hasPermission>
    </div>


    <script src="/static/ztree/js/jquery.ztree.all-3.5.min.js"></script>
    <script src="/static/ztree/js/jquery.ztree.exhide-3.5.min.js"></script>

    <link rel="stylesheet" href="/static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css"/>


    <#--            <script src="/static/zTree_v3/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
   <script src="/static/zTree_v3/js/jquery.ztree.core-3.5.min.js" type="text/javascript"></script>
    <script src="/static/zTree_v3/js/jquery.ztree.excheck-3.5.min.js" type="text/javascript"></script>
    <script src="/static/zTree_v3/js/jquery.ztree.exedit-3.5.min.js" type="text/javascript"></script>
  <link href="/static/zTree_v3/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css"/>-->

    <script src="/static/bootstrap-treeview-master/bootstrap-treeview.js"></script>

    <script src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap-transition.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap-modal.js"></script>

    <script>
        $(".btn1").click(function () {

            var setting = {
                view: {
                    selectedMulti: false
                },
                async: {
                    enable: true,
                    url: '${baseUrl!}/admin/coursepart/treeData',
                    autoParam:["id", "pId"],

                },
                data: {
                    simpleData: {
                        enable: true,
                        idKey: "id",
                        pIdKey: "pId",
                        rootPId: null
                    }
                },
                callback: {//回调函数，在这里可做一些回调处理
          /*         onCheck: onCheck,*/
                    beforeClick:beforeClick,
                    onClick:onClick

                }
            };

            function onClick(event, treeId, treeNode, clickFlag) {
                var  url=treeNode.href;
                window.location.href="${baseUrl!}"+url;
            }

            //单击加载
            function onCheck(e, treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("zTreeContent");
                var auths = zTree.getCheckedNodes(true);
                var authCodes = '';
                for (var i = 0; i < auths.length; i++) {
                    authCodes += auths[i].id + ",";
                }
                if (authCodes.length > 1) {
                    authCodes = authCodes.substr(0, authCodes.length - 1);
                }
                $('#authCodes').val(authCodes);

            }
            function refreshNode(e) {
                var zTree = $.fn.zTree.getZTreeObj("zTreeContent"),
                        type = e.data.type,
                        silent = e.data.silent,
                        nodes = zTree.getSelectedNodes();
                if (nodes.length == 0) {
                    alert("请先选择一个父节点");
                }
                for (var i=0, l=nodes.length; i<l; i++) {
                    zTree.reAsyncChildNodes(nodes[i], type, silent);
                    if (!silent) zTree.selectNode(nodes[i]);
                }
            }
            function beforeClick(treeId, treeNode) {
                if (!treeNode.isParent) {
                    alert("最后一个了，没有了,请选择上一级");
                    return false;
                } else {
                    return true;
                }
            }




            function createTree() {

                $.ajax({
                    type: 'post',
                    url: '${baseUrl!}/admin/coursepart/treeData', //url  action是方法的名称
                    dataType: "json", //可以是text，如果用text，返回的结果为字符串；如果需要json格式的，可是设置为json
                    ContentType: "application/json; charset=utf-8",
                    success: function (data) {

                        var zNodes=[];
                        zNodes=data;
                        $.fn.zTree.init($("#zTreeContent"), setting,zNodes);

                    },
                    error: function (msg) {
                        alert("失败");
                    }
                });
            }


          $(document).ready(function () {
                $("#mymodal").modal("toggle");
                createTree();
            });

        });






        function delete_coursepart(coursepartid) {

            if (confirm("确定删除吗?")) {
                $.ajax({
                    url: "${baseUrl!}/admin/coursepart/delete",
                    async: true,
                    cache: false,
                    type: 'post',
                    dataType: "json",
                    data: {
                        coursepart_id: coursepartid
                    },
                    success: function (data) {
                        if (data.code == '200') {
                            alert("删除成功");
                            window.location.reload();
                        } else {
                            alert("删除失败，原因是" + data.description);

                        }
                    }
                });
            }
        }
    </script>
</section>
</@layout>
