<?
if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true) die();
/** @var array $arCurrentValues */

if(!CModule::IncludeModule("iblock"))
	return;

	
$arComponentParameters = array(
	"GROUPS" => array(
	),
	"PARAMETERS" => array(
		"CATALOG_ID" => array(
			"PARENT" => "BASE",
			"NAME" => GetMessage("CATALOG_ID"),
			"TYPE" => "STRING",
			"DEFAULT" => "2",
		),
		"NEWS_ID" => array(
			"PARENT" => "BASE",
			"NAME" => GetMessage("NEWS_ID"),
			"TYPE" => "STRING",
			"DEFAULT" => "1",
		),
		"CODE" => array(
			"PARENT" => "BASE",
			"NAME" => GetMessage("CODE"),
			"TYPE" => "STRING",
			"DEFAULT" => "UF_NEWS_LINK",
		),
		"CACHE_TIME"  =>  array("DEFAULT"=>36000000),
	),
);	
