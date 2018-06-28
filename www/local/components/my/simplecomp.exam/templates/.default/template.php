<?if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();
?>
<?$this->SetViewTarget('maxmin')?>
<div style="color:red; margin: 34px 15px 35px 15px"><?=$arResult['MAXMIN']?></div>
<?$this->EndViewTarget();?>

<b><?=GetMessage("CATALOG")?>:</b>
<ul>
<?foreach($arResult['ITEMS'] as $arItem):?>
<li>
	<b><?=$arItem["NAME"]?></b> - <?=$arItem["ACTIVE_FROM"]?> (<?=$arItem["SECTION_NAMES"]?>)
	<ul>
		<?foreach($arItem["ITEMS"] as $sub)
		{
			echo "<li>";
			echo $sub['NAME']." - ".$sub['PROPERTY_PRICE_VALUE'].
			" - ".$sub["PROPERTY_MATERIAL_VALUE"]." - ".$sub["PROPERTY_ARTNUMBER_VALUE"];
			echo "</li>";
		}?>
	</ul>
</li>


<?endforeach;?>
</ul>