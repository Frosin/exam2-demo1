<?
if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true) die();
/** @var CBitrixComponent $this */
/** @var array $arParams */
/** @var array $arResult */
/** @var string $componentPath */
/** @var string $componentName */
/** @var string $componentTemplate */
/** @global CDatabase $DB */
/** @global CUser $USER */
/** @global CMain $APPLICATION */

/** @global CIntranetToolbar $INTRANET_TOOLBAR */


if($this->StartResultCache())
{
	if(!CModule::IncludeModule("iblock"))
	{
		$this->AbortResultCache();
		return;
	}
	
$catalog_id = intval($arParams["CATALOG_ID"]);
$news_id = intval($arParams["NEWS_ID"]);
$code = $arParams['CODE'];

$filter = [
		   "IBLOCK_ID" => $catalog_id,
		   "ACTIVE" => "Y",
		   "!".$code => false,
		   ];

$r = CIBlockSection::GetList(
    $arOrder = [],
    $filter,
    false,
    Array("ID", "NAME", $code),
    false
);

$arSection = [];
while ($res = $r->GetNext())
{
	$arSection[] = $res;
}


//// News

$filter = ["IBLOCK_ID" => $news_id];
$r = CIBlockElement::GetList(
 [],
 $filter,
 false,
 false,
 ["ID","ACTIVE_FROM","NAME"]
);

$arNews = [];
$i = 0;

while ($res = $r->GetNext())
{
	foreach($arSection as &$item)
	{
		foreach($item[$code] as $sub)
		{
			if ($sub == $res['ID'])
			{
				$res['SECTIONS'][$i] = $item;
				$res['SECTION_NAMES'][] = $item['NAME'];
			}
		}
		$i++;
	}
	$res['SECTION_NAMES'] = implode(", ",$res['SECTION_NAMES']);
	$arNews[] = $res;	
}

//Elements


$filter = [
		   "IBLOCK_ID" => $catalog_id,
		   ];
$r = CIBlockElement::GetList(
 [],
 $filter,
 false,
 false,
 ["ID","NAME", "PROPERTY_MATERIAL", "PROPERTY_ARTNUMBER", "PROPERTY_PRICE", "IBLOCK_SECTION_ID"]
);

$minPrice = 100500;
$maxPrice = 0;

$elements = [];
while ($res = $r->GetNext())
{
	foreach ($arNews as &$item)
	{
		foreach($item['SECTIONS'] as $sub)
		{
			if ($sub['ID'] == $res['IBLOCK_SECTION_ID'])
			{
				$item['ITEMS'][] = $res;
				$elements[] = $res['NAME'];
				if ($res['PROPERTY_PRICE_VALUE'] > $maxPrice)
					$maxPrice = $res['PROPERTY_PRICE_VALUE'];
				if ($res['PROPERTY_PRICE_VALUE'] < $minPrice)
					$minPrice = $res['PROPERTY_PRICE_VALUE'];	
			}
		}
	}
}
$maxminText = "Максимальная цена: ".$maxPrice;
$maxminText .= ", минимальная цена: ".$minPrice;



$elements = array_unique($elements);


$arResult['ITEMS'] = $arNews;
$arResult["ELEM_COUNT"] = count($elements);
$arResult['MAXMIN'] = $maxminText;

$this->SetResultCacheKeys(['ELEM_COUNT', 'MAXMIN']);
$this->IncludeComponentTemplate();
}


$APPLICATION->SetTitle("В каталоге товаров представлено товаров: ".$arResult['ELEM_COUNT']);

?>






