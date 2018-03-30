<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
${menus}
<!-- <ul class="nav sidebar-menu">
	<li class="active"><a
		href="javascript:ajaxLoad('shop/user/getAllUser.htm','前台用户管理')"> <i
			class="menu-icon glyphicon glyphicon-home"></i> <span
			class="menu-text"> 前台用户管理 </span>
	</a></li>
	<li class="active"><a
		href="javascript:ajaxLoad('shop/setProblemAbout/getAll.htm','设置')">
			<i class="menu-icon glyphicon glyphicon-home"></i> <span
			class="menu-text"> 设置 </span>
	</a></li>
	<li class="active"><a
		href="javascript:ajaxLoad('sys/user/list.htm','用户管理')"> <i
			class="menu-icon glyphicon glyphicon-home"></i> <span
			class="menu-text"> 用户管理 </span>
	</a></li>
	Databoxes
	<li><a href="javascript:ajaxLoad('sys/item/list.htm','数据字典')">
			<i class="menu-icon glyphicon glyphicon-tasks"></i> <span
			class="menu-text"> 数据字典 </span>
	</a></li>
	<li><a href="javascript:ajaxLoad('news/news/list.htm','新闻管理')">
			<i class="menu-icon glyphicon glyphicon-tasks"></i> <span
			class="menu-text"> 新闻管理 </span>
	</a></li>
	<li><a href="javascript:ajaxLoad('news/newsType/list.htm','新闻管理')">
			<i class="menu-icon glyphicon glyphicon-tasks"></i> <span
			class="menu-text"> 新闻分类管理 </span>
	</a></li>
	Widgets
	<li><a href="javascript:ajaxLoad('sys/org/list.htm','菜单管理')">
			<i class="menu-icon fa fa-th"></i> <span class="menu-text">
				组织管理 </span>
	</a></li>

	<li><a
		href="javascript:ajaxLoad('shop/aservice/list.htm','服务说明管理')"> <i
			class="menu-icon fa fa-desktop"></i> <span class="menu-text">服务说明管理
		</span>
	</a></li>
	<li><a href="javascript:ajaxLoad('shop/consignee/list.htm','收货人')">
			<i class="menu-icon fa fa-desktop"></i> <span class="menu-text">收货人
		</span>
	</a></li>

	<li><a href="javascript:ajaxLoad('sys/role/list.htm','角色管理')">
			<i class="menu-icon fa fa-desktop"></i> <span class="menu-text">角色管理
		</span>
	</a></li>

	<li><a href="javascript:ajaxLoad('shop/coupon/list.htm','优惠券管理')">
			<i class="menu-icon fa fa-desktop"></i> <span class="menu-text">优惠券管理
		</span>
	</a></li>
	<li><a href="javascript:ajaxLoad('shop/adSlot/list.htm','广告位')">
			<i class="menu-icon fa fa-desktop"></i> <span class="menu-text">广告位
		</span>
	</a></li>

	<li><a href="javascript:ajaxLoad('shop/goods/list.htm','商品管理')">
			<i class="menu-icon fa fa-desktop"></i> <span class="menu-text">商品管理
		</span>
	</a></li>

	<li><a
		href="javascript:ajaxLoad('shop/evaluationTag/list.htm','标签管理')">
			<i class="menu-icon fa fa-desktop"></i> <span class="menu-text">标签管理
		</span>
	</a></li>


	<li><a href="javascript:ajaxLoad('shop/brand/list.htm','品牌管理')">
			<i class="menu-icon fa fa-desktop"></i> <span class="menu-text">
				品牌管理 </span>

	</a></li>

	<li><a
		href="javascript:ajaxLoad('shop/region/selectProvince.htm','省市區')">
			<i class="menu-icon fa fa-desktop"></i> <span class="menu-text">
				省市區 </span>

	</a></li>

	<li><a
		href="javascript:ajaxLoad('shop/productCategory/list.htm','类别')">
			<i class="menu-icon fa fa-th"></i> <span class="menu-text">类别
		</span>
	</a></li>

	<li><a href="#" class="menu-dropdown"> <i
			class="menu-icon fa fa-table"></i> <span class="menu-text">
				微信二次开发 </span>


	</a>

		<ul class="submenu">
			<li><a href="tables-simple.html"> <span class="menu-text">基本信息设置</span>
			</a></li>
			<li><a href="tables-data.html"> <span class="menu-text">菜单自定义</span>
			</a></li>
		</ul></li>
	Forms
	<li><a href="#" class="menu-dropdown"> <i
			class="menu-icon fa fa-pencil-square-o"></i> <span class="menu-text">
				工单管理 </span> 
	</a>

		<ul class="submenu">
			<li><a href="form-layouts.html"> <span class="menu-text">创建诉求工单</span>
			</a></li>

			<li><a href="form-inputs.html"> <span class="menu-text">诉求工单派发</span>
			</a></li>

			<li><a href="form-pickers.html"> <span class="menu-text">处理诉求工单</span>
			</a></li>
			<li><a href="form-wizard.html"> <span class="menu-text">Wizard</span>
			</a></li>
			<li><a href="form-validation.html"> <span class="menu-text">Validation</span>
			</a></li>
			<li><a href="form-editors.html"> <span class="menu-text">Editors</span>
			</a></li>
		</ul></li>
	Charts
	<li><a href="#" class="menu-dropdown"> <i
			class="menu-icon fa fa-bar-chart-o"></i> <span class="menu-text">
			监督管理 </span> 
	</a>

		<ul class="submenu">
			<li><a href="flot.html"> <span class="menu-text">Flot
						Charts</span>
			</a></li>

			<li><a href="morris.html"> <span class="menu-text">
						Morris Charts</span>
			</a></li>
			<li><a href="sparkline.html"> <span class="menu-text">Sparkline
						Charts</span>
			</a></li>
			<li><a href="easypiecharts.html"> <span class="menu-text">Easy
						Pie Charts</span>
			</a></li>
			<li><a href="chartjs.html"> <span class="menu-text">
						ChartJS</span>
			</a></li>
		</ul></li>
	Profile
	<li><a href="profile.html"> <i
			class="menu-icon fa fa-picture-o"></i> <span class="menu-text"></span>
	</a></li>
	Mail
	<li><a href="#" class="menu-dropdown"> <i
			class="menu-icon fa fa-envelope-o"></i> <span class="menu-text">
				报表统计 </span> 
	</a>

		<ul class="submenu">
			<li><a href="inbox.html"> <span class="menu-text">业务报表统计</span>
			</a></li>

			<li><a href="message-view.html"> <span class="menu-text">话务报表统计</span>
			</a></li>
			<li><a href="message-compose.html"> <span class="menu-text">Compose
						Message</span>
			</a></li>
		</ul></li>
	Calendar
	<li><a href="calendar.html"> <i
			class="menu-icon fa fa-calendar"></i> <span class="menu-text">
				Calendar </span>
	</a></li>
	Pages
	<li><a href="#" class="menu-dropdown"> <i
			class="menu-icon glyphicon glyphicon-paperclip"></i> <span
			class="menu-text"> 前台知识库管理 </span> 
	</a>
		<ul class="submenu">
			<li><a href="timeline.html"> <span class="menu-text">知识库录入</span>
			</a></li>
			<li><a href="pricing.html"> <span class="menu-text">知识库审核</span>
			</a></li>

			<li><a href="invoice.html"> <span class="menu-text">知识库使用</span>
			</a></li>

		</ul></li>
	More Pages
	<li><a href="#" class="menu-dropdown"> <i
			class="menu-icon glyphicon glyphicon-link"></i> <span
			class="menu-text"> More Pages </span>
	</a>

		<ul class="submenu">
			<li><a href="error-404.html"> <span class="menu-text">Error
						404</span>
			</a></li>

			<li><a href="error-500.html"> <span class="menu-text">
						Error 500</span>
			</a></li>
			<li><a href="blank.html"> <span class="menu-text">Blank
						Page</span>
			</a></li>
			<li><a href="grid.html"> <span class="menu-text">
						Grid</span>
			</a></li>
			<li><a href="#" class="menu-dropdown"> <span
					class="menu-text">Multi Level Menu</span>
			</a>

				<ul class="submenu">
					<li><a href="#"> <i class="menu-icon fa fa-camera"></i> <span
							class="menu-text">Level 3</span>
					</a></li>

					<li><a href="#" class="menu-dropdown"> <i
							class="menu-icon fa fa-asterisk"></i> <span class="menu-text">Level
								4</span>
					</a>

						<ul class="submenu">
							<li><a href="#"> <i class="menu-icon fa fa-bolt"></i> <span
									class="menu-text">Some Item</span>
							</a></li>

							<li><a href="#"> <i class="menu-icon fa fa-bug"></i> <span
									class="menu-text">Another Item</span>
							</a></li>
						</ul></li>

				</ul></li>

		</ul></li>
	Right to Left
	<li><a href="#" class="menu-dropdown"> <i
			class="menu-icon fa fa-align-right"></i> <span class="menu-text">
				Right to Left </span>
	</a>
		<ul class="submenu">
			<li><a> <span class="menu-text">RTL</span> <label
					class="pull-right margin-top-10"> <input id="rtl-changer"
						class="checkbox-slider slider-icon colored-primary"
						type="checkbox"> <span class="text"></span>
				</label>
			</a></li>
			<li><a href="index-rtl-ar.html"> <span class="menu-text">Arabic
						Layout</span>
			</a></li>

			<li><a href="index-rtl-fa.html"> <span class="menu-text">Persian
						Layout</span>
			</a></li>

		</ul></li> 
</ul>-->


