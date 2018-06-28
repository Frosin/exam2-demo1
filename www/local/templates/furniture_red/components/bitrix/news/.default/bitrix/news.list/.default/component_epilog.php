<?
if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true) die();

if ($arParams["USE_SPECIALDATE"] == "Y")
{
    $specialdate = $arResult["SPECIALDATE"];
    $APPLICATION->SetPageProperty("specialdate", $arResult["SPECIALDATE"]);  
}
?>

