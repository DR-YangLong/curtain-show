<header class="main-header">
    <!-- Logo -->
    <a href="" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>A</b>LT</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>Admin</b>LTE</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </a>
    </nav>
</header>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${staticTools.getResourcePath()}/admin/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>Alexander Pierce</p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">操作列表</li>
            <li>
                <!--列表页 -->
                <a href="/manager/list"><i class="fa fa-table"></i> <span>查看所有产品</span></a>
            </li>
            <li>
                <!-- 发布页面 -->
                <a href="/manager/pub"><i class="fa fa-pencil"></i> <span>发布新商品</span></a>
            </li>
            <li>
                <!-- 编辑页面 -->
                <a href="javascript:void(0);"><i class="fa  fa-pencil-square-o"></i> <span>编辑商品</span></a>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>