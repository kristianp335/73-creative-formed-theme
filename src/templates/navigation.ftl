<#if has_navigation && is_setup_complete>
	<button aria-controls="navigationCollapse" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler navbar-toggler-right" data-target="#navigationCollapse" data-toggle="liferay-collapse" type="button">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div aria-expanded="false" class="collapse flex-grow-0 navbar-collapse" id="navigationCollapse">
		<@liferay.navigation_menu default_preferences="${preferences}" />
		<#if show_account_selector>
			<div class="minium-topbar__account-selector-wrapper">
				<@liferay_commerce_ui["account-selector"] />
			</div>
		</#if>	
	</div>
	<#if show_mini_cart>
		<div class="minium-topbar__cart-wrapper">
					<@liferay_commerce_ui["mini-cart"] spritemap="${themeDisplay.getPathThemeImages()}/icons.svg" />
		</div>
	</#if>
</#if>