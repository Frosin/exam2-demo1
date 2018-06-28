<?
if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true) die();
?>
<?
    $specialdate = $arResult["ITEMS"][0]["DISPLAY_ACTIVE_FROM"];
    $arResult["SPECIALDATE"] = $specialdate;
    $this->__component->arResultCacheKeys = array_merge(
                                                    $this->__component->arResultCacheKeys,
                                                    ["SPECIALDATE"]);
?>

