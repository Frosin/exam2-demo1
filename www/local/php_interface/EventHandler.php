<?
class EventHandler
{
  function OnEmailSend(&$event,&$lid, &$arFields)
  {
       if ($event == "FEEDBACK_FORM")
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
            
            $arFields["AUTHOR"] = $user;
            $arToLog = ["DESCRIPTION" => "Замена данных в отсылаемом письме – ".$user];
            CEventLog::Add($arToLog);      
       }
       return true;
  }
}