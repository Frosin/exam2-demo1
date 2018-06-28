<?
define("LOG_FILENAME", $_SERVER["DOCUMENT_ROOT"]."/log.txt");

include_once($_SERVER["DOCUMENT_ROOT"])."/local/php_interface/EventHandler.php";

AddEventHandler("main", "OnBeforeEventAdd", Array("EventHandler", "OnEmailSend"));
















?>