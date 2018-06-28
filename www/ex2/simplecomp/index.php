<?
require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");
$APPLICATION->SetTitle("Простой компонент");
?><?$APPLICATION->IncludeComponent(
	"my:simplecomp.exam",
	".default",
	Array(
		"COMPONENT_TEMPLATE" => ".default",
		"CATALOG_ID" => "2",
		"NEWS_ID" => "1",
		"CODE" => "UF_NEWS_LINK",
		"CACHE_TYPE" => "A",
		"CACHE_TIME" => "36000000"
	)
);?><br><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>