<#macro pageLeft page_tab="">
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${baseUrl!}/static/AdminLTE/dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>欢迎你,${session.admin_username!}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">导航菜单</li>
            <@shiro.hasPermission name="menu:index">
                <li <#if page_tab="index"> class="active" </#if>>
                    <a href="${baseUrl!}/admin/index">
                        <i class="fa fa-dashboard"></i> <span>首页</span>
                    </a>
                </li>
            </@shiro.hasPermission>
            <@shiro.hasPermission name="menu:school">
                <li <#if page_tab="school"> class="active" </#if>>
                    <a href="${baseUrl!}/admin/school">
                        <i class="fa fa-dashboard"></i> <span>学校</span>
                    </a>
                </li>
            </@shiro.hasPermission>

            <@shiro.hasPermission name="menu:score">
                <li <#if page_tab="score"> class="active" </#if>>
                    <a href="${baseUrl!}/admin/score">
                        <i class="fa  fa-list-ol"></i> <span>成绩管理</span>
                    </a>
                </li>
            </@shiro.hasPermission>


            <@shiro.hasPermission name="menu:source">
                <li class="treeview <#if page_tab="demolesson" || page_tab="video" || page_tab="music" || page_tab="homework" >active</#if>">
                    <a href="javascript:;">
                        <i class="fa  fa-cubes"></i> <span>资源管理</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <#---->
                            <@shiro.hasPermission name="menu:demolesson">
                                <li <#if page_tab="demolesson"> class="active" </#if>>
                                    <a href="${baseUrl!}/admin/demolesson">
                                        <i class="fa  fa-television"></i> <span>示范课管理</span>
                                    </a>
                                </li>
                            </@shiro.hasPermission>

                            <@shiro.hasPermission name="menu:video">
                                <li <#if page_tab="video"> class="active" </#if>>
                                    <a href="${baseUrl!}/admin/video">
                                        <i class="fa fa-youtube-play"></i> <span>通用视频管理</span>
                                    </a>
                                </li>
                            </@shiro.hasPermission>

                            <@shiro.hasPermission name="menu:music">
                                <li <#if page_tab="music"> class="active" </#if>>
                                    <a href="${baseUrl!}/admin/music">
                                        <i class="fa fa-music"></i> <span>音乐管理</span>
                                    </a>
                                </li>
                            </@shiro.hasPermission>


                            <@shiro.hasPermission name="menu:homework">
                                <li <#if page_tab="homework"> class="active" </#if>>
                                    <a href="${baseUrl!}/admin/homework">
                                        <i class="fa fa-file-text"></i> <span>作业管理</span>
                                    </a>
                                </li>
                            </@shiro.hasPermission>

                            <@shiro.hasPermission name="menu:song">
                                <li <#if page_tab="song"> class="active" </#if>>
                                    <a href="${baseUrl!}/admin/song">
                                        <i class="fa  fa-music"></i> <span>曲库管理</span>
                                    </a>
                                </li>
                            </@shiro.hasPermission>


                    </ul>
                </li>
            </@shiro.hasPermission>







            <@shiro.hasPermission name="menu:course">
                <li <#if page_tab="course"> class="active" </#if>>
                    <a href="${baseUrl!}/admin/course">
                        <i class="fa fa-book"></i> <span>课程管理</span>
                    </a>
                </li>
            </@shiro.hasPermission>


            <@shiro.hasPermission name="menu:grade">
                <li <#if page_tab="course"> class="active" </#if>>
                    <a href="${baseUrl!}/admin/grade">
                        <i class="fa  fa-building"></i> <span>年级管理</span>
                    </a>
                </li>
            </@shiro.hasPermission>







            <@shiro.hasPermission name="menu:coursepart">
                <li <#if page_tab="coursepart"> class="active" </#if>>
                    <a href="${baseUrl!}/admin/coursepart">
                        <i class="fa fa-folder-open"></i> <span>栏目管理</span>
                    </a>
                </li>
            </@shiro.hasPermission>

    <@shiro.hasPermission name="menu:coursepart">
            <li <#if page_tab="greetings"> class="active" </#if>>
                <a href="${baseUrl!}/admin/greetings">
                    <i class="fa fa-folder-open"></i> <span>欢迎语管理</span>
                </a>
            </li>
    </@shiro.hasPermission>
    <@shiro.hasPermission name="menu:coursepart">
            <li <#if page_tab="tone"> class="active" </#if>>
                <a href="${baseUrl!}/admin/tone">
                    <i class="fa fa-folder-open"></i> <span>音色管理</span>
                </a>
            </li>
    </@shiro.hasPermission>

        <#--<@shiro.hasPermission name="menu:coursepartunit">-->
                <#--<li <#if page_tab="coursepart"> class="active" </#if>>-->
                    <#--<a href="${baseUrl!}/admin/coursepartunit">-->
                        <#--<i class="fa fa-youtube-play"></i> <span>小节单元管理</span>-->
                    <#--</a>-->
                <#--</li>-->
            <#--</@shiro.hasPermission>-->







            <@shiro.hasPermission name="menu:user">
                <li <#if page_tab="user"> class="active" </#if>>
                    <a href="${baseUrl!}/admin/user">
                        <i class="fa fa-user"></i> <span>用户</span>
                    </a>
                </li>
            </@shiro.hasPermission>
				 <li <#if page_tab="notify"> class="active" </#if>>
                    <a href="${baseUrl!}/admin/notify">
                        <i class="fa fa-folder-open"></i> <span>通知管理</span>
                    </a>
                </li>
                <li class="treeview <#if page_tab="piano" || page_tab="piano-mal" >active</#if>">
                    <a href="javascript:;">
                        <i class="fa fa-cogs"></i> <span>设备管理</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                            <li <#if page_tab="piano"> class="active" </#if>><a
                                    href="${baseUrl!}/admin/piano"><i class="fa fa-circle-o"></i>钢琴资产配置</a></li>
                            <li <#if page_tab="piano-mal"> class="active" </#if>><a
                                    href="${baseUrl!}/admin/piano/mal"><i class="fa fa-circle-o"></i> 钢琴故障列表</a></li>
                    </ul>
                </li>
            <@shiro.hasPermission name="menu:setting">
                <li class="treeview <#if page_tab="sysconfig" || page_tab="adminuser" || page_tab="role" || page_tab="permission" || page_tab="modifypwd">active</#if>">
                    <a href="javascript:;">
                        <i class="fa fa-cogs"></i> <span>设置</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <@shiro.hasPermission name="setting:sysconfig">
                            <li <#if page_tab="sysconfig"> class="active" </#if>><a
                                    href="${baseUrl!}/admin/sysconfig"><i class="fa fa-circle-o"></i> 系统设置</a></li>
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="setting:adminuser">
                            <li <#if page_tab="adminuser"> class="active" </#if>><a
                                    href="${baseUrl!}/admin/adminuser"><i class="fa fa-circle-o"></i> 后台用户</a></li>
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="setting:role">
                            <li <#if page_tab="role"> class="active" </#if>><a href="${baseUrl!}/admin/role"><i
                                    class="fa fa-circle-o"></i> 角色</a></li>
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="setting:permission">
                            <li <#if page_tab="permission"> class="active" </#if>><a
                                    href="${baseUrl!}/admin/permission"><i class="fa fa-circle-o"></i> 权限</a></li>
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="setting:modifypwd">
                            <li <#if page_tab="modifypwd"> class="active" </#if>><a
                                    href="${baseUrl!}/admin/adminuser/modifypwd"><i class="fa fa-circle-o"></i> 修改密码</a>
                            </li>
                        </@shiro.hasPermission>
                    </ul>
                </li>
            </@shiro.hasPermission>
            <li>
                <a href="${baseUrl!}/admin/logout">
                    <i class="fa fa-sign-out"></i> <span>退出</span>
                </a>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
</#macro>