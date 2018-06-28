<?
define("LOG_FILENAME", $_SERVER["DOCUMENT_ROOT"]."/log.txt");



AddEventHandler("main", "OnBeforeEventSend", Array("MyClass", "OnSend"));



class MyClass
{
  function OnSend(&$arFields, &$arTemplate)
  {

       
       
       if ($arTemplate["EVENT_NAME"] == "FEEDBACK_FORM")
       {
            global $USER;
            $user = "";
            if ($USER->isAuthorized())
            {
               $user = "Пользователь авторизован: ".
               $USER->GetID()." (".$USER->GetLogin().
               ") ".$USER->GetFullName()." данные из формы: ".$arFields["AUTHOR"]; 
            }
            else
            {   
                $user = "Пользователь не авторизован, данные из формы: ".$arFields["AUTHOR"];
            }
            str_replace("#AUTHOR#" , $user, $arTemplate['MESSAGE']);

            $arFields = ["DESCRIPTION" => "Замена данных в отсылаемом письме – ".$user];
            CEventLog::Add($arFields);      
       }
       return true;
  }
}













?>