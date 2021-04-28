<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${html_title}</title>
	<script type="text/javascript" src="${javascript_folder}/intersection-observer.js"></script>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<@liferay_util["include"] page=top_head_include />
</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<div class="d-flex flex-column min-vh-100">
<#if show_dockbar>
	<@liferay.control_menu />	
</#if>
	<div class="d-flex flex-column flex-fill" id="wrapper">
		<#if show_header>
			<header id="banner">
				<div class="navbar navbar-classic navbar-top py-2 upper-header upper-header-bg upper-header-text-color"  id="upperHeader">
					<div class="bg-transparent container-fluid px-lg-4 px-xl-6 user-personal-bar">
						<div class="align-items-center autofit-row">
							<#if show_language_selector>
								<div class="autofit-col language-selector mr-1 mr-md-2">
									<#assign preferences = freeMarkerPortletPreferences.getPreferences("portletSetupPortletDecoratorId", "barebone") />

									<@liferay_portlet["runtime"]
										defaultPreferences=preferences
										portletProviderAction=portletProviderAction.VIEW
										portletProviderClassName="com.liferay.portal.kernel.servlet.taglib.ui.LanguageEntry"
									/>
								</div>
							</#if>
							
							<#assign preferences = freeMarkerPortletPreferences.getPreferences({"portletSetupPortletDecoratorId": "barebone", "destination": "/search"}) />

							<div class="autofit-col flex-grow-1 flex-shrink-1">								
									<div class="justify-content-md-end ml-md-2 mr-2 mr-md-4 navbar-form" role="search">
										<div class="autofit-col personal-bar-container">
											<#if !is_signed_in>					
												<a style="margin-right: 10px" class="sign-in text-default" data-redirect="${is_login_redirect_required?string}" href="javascript:void(0)" onclick="$('#loginCardContainer').css('visibility', 'visible');" id="sign-in" rel="nofollow">${sign_in_text}</a>
											</#if>
											
											<#if is_signed_in>
												<@liferay.user_personal_bar />	
											</#if>											
										</div>
									<#if show_header_search>
										<@liferay.search_bar default_preferences="${preferences}" />
									</#if>
									</div>
							</div>													
						</div>
					</div>
				</div>

				<div class="lower-header lower-header-bg lower-header-text-color navbar navbar-classic navbar-expand-md navbar-light py-2 site-navigation" id="lowerHeader">
					<div class="bg-transparent container-fluid px-lg-4 px-xl-6">
						<a class="${logo_css_class} align-items-center d-md-flex d-none logo-md mx-2" href="${site_default_url}" title="<@liferay.language_format arguments="" key="go-to-x" />">
							<img alt="${logo_description}" class="mx-2 site-logo" src="${site_logo}" />

							<#if show_site_name>
								<h2 class="font-weight-light h2 mb-0 mx-2 lower-header-text-color text-uppercase">${site_name}</h2>
							</#if>
						</a>
						
						<a class="${logo_css_class} align-items-center d-inline-flex d-md-none logo-xs mr-4" href="${site_default_url}" rel="nofollow">
							<img alt="${logo_description}" class="mr-2 site-logo" src="${site_logo}" />

							<#if show_site_name>
								<h2 class="font-weight-light h2 mb-0 lower-header-text-color text-uppercase">${site_name}</h2>
							</#if>
						</a>

						<#include "${full_templates_path}/navigation.ftl" />
					</div>
				</div>
			</header>
		</#if>

		<section class="${portal_content_css_class} minium-frame flex-fill" id="content">
			<h2 class="sr-only" role="heading" aria-level="1">${the_title}</h2>

			<#if selectable>
				<@liferay_util["include"] page=content_include />
			<#else>
				${portletDisplay.recycle()}

				${portletDisplay.setTitle(the_title)}

				<@liferay_theme["wrap-portlet"] page="portlet.ftl">
					<@liferay_util["include"] page=content_include />
				</@>
			</#if>
		</section>

		<#if show_footer>
			<footer class="footer-bg footer-text-color" id="footer" role="contentinfo">
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-center text-md-left">
							<@liferay.language key="powered-by" />

							<a class="text-gray" href="http://www.liferay.com" rel="external">Liferay UK &copy;2020</a>
						</div>
					</div>
				</div>
			</footer>
		</#if>
		<#if !is_signed_in>	
			<div id="loginCardContainer" style="background: rgba(0, 0, 0, 0.5); height: 100%; width: 100%; z-index: 1500; position: fixed; top: 0; left: 0; visibility: hidden;">
				<div style="margin-left: 90%; margin-right: 20px; margin-top: 20px; position: relative;">
					<a class="btn btn-primary" href="javascript:void(0)" onclick="$('#loginCardContainer').css('visibility', 'hidden');" id="hide-sign-in" rel="nofollow">X</a>
				</div>
				<div class="b2b-login-card card" id="loginCardArea" style="background-color: #ffffff; min-width:300px; max-width: 400px; position: fixed; top: 25%;
					left: 50%; transform: translate(-50%, 0); z-index: 2000; padding: 20px;">	
						<#assign preferences = freeMarkerPortletPreferences.getPreferences("portletSetupPortletDecoratorId", "barebone") />
						<@liferay_portlet["runtime"]
							defaultPreferences=preferences
							portletName="com_liferay_login_web_portlet_LoginPortlet"
						/>
				</div>
			</div>
		</#if>
	</div>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

<#if enable_sticky_header>
	<script data-senna-track="permanent" id="stickyJS" src="${javascript_folder}/sticky.js" type="text/javascript"></script>
</#if>

</body>

</html>