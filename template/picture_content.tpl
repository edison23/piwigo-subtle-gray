{if !$current.selected_derivative->is_cached()}
{combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
{combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
{footer_script}var error_icon = "{$ROOT_URL}{$themeconf.icon_dir}/errors_small.png"{/footer_script}
{/if}

<!-- this loader gif is ugly -->
<!-- <img {if $current.selected_derivative->is_cached()}src="{$current.selected_derivative->get_url()}" {$current.selected_derivative->get_size_htm()}{else}src="{$ROOT_URL}{$themeconf.img_dir}/ajax_loader.gif" data-src="{$current.selected_derivative->get_url()}"{/if} alt="{$ALT_IMG}" id="theMainImage" usemap="#map{$current.selected_derivative->get_type()}" title="{if isset($COMMENT_IMG)}{$COMMENT_IMG|@strip_tags:false|@replace:'"':' '}{else}{$current.TITLE_ESC} - {$ALT_IMG}{/if}"> -->
<!-- this is nice loader but we don't have an idea how to actually implemented it here -->
<!-- <div class="waitingForServer"></div> -->
<!-- this didn't work (setting display none while the img is loading, then give it display block) -->
<!-- <img src="{$current.selected_derivative->get_url()}" {$current.selected_derivative->get_size_htm()} data-src="{$current.selected_derivative->get_url()}" alt="{$ALT_IMG}" id="theMainImage" usemap="#map{$current.selected_derivative->get_type()}" title="{if isset($COMMENT_IMG)}{$COMMENT_IMG|@strip_tags:false|@replace:'"':' '}{else}{$current.TITLE_ESC} - {$ALT_IMG}{/if}" {if $current.selected_derivative->is_cached()}style="display: block"{else}style="display: none;"{/if}> -->
<!-- this is without any loader -->
<img src="{$current.selected_derivative->get_url()}" {$current.selected_derivative->get_size_htm()} data-src="{$current.selected_derivative->get_url()}" alt="{$ALT_IMG}" id="theMainImage" usemap="#map{$current.selected_derivative->get_type()}" title="{if isset($COMMENT_IMG)}{$COMMENT_IMG|@strip_tags:false|@replace:'"':' '}{else}{$current.TITLE_ESC} - {$ALT_IMG}{/if}">

<!-- <img src="" class="loader"> -->

{foreach from=$current.unique_derivatives item=derivative key=derivative_type}{strip}
<map name="map{$derivative->get_type()}">
{assign var='size' value=$derivative->get_size()}
{if isset($previous)}
<area shape=rect coords="0,0,{($size[0]/4)|@intval},{$size[1]}" href="{$previous.U_IMG}" title="{'Previous'|@translate} : {$previous.TITLE_ESC}" alt="{$previous.TITLE_ESC}">
{/if}
<area shape=rect coords="{($size[0]/4)|@intval},0,{($size[0]/1.34)|@intval},{($size[1]/4)|@intval}" href="{$U_UP}" title="{'Thumbnails'|@translate}" alt="{'Thumbnails'|@translate}">
{if isset($next)}
<area shape=rect coords="{($size[0]/1.33)|@intval},0,{$size[0]},{$size[1]}" href="{$next.U_IMG}" title="{'Next'|@translate} : {$next.TITLE_ESC}" alt="{$next.TITLE_ESC}">
{/if}
</map>
{/strip}{/foreach}