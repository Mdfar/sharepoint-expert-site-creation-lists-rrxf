PnP PowerShell Script to provision the Order Management List

Connect-PnPOnline -Url "https://clinique-dentaire-quebec.sharepoint.com/sites/Orders" -Interactive

$listName = "SupplyOrders" $list = New-PnPList -Title $listName -Template GenericList

Add Custom Columns

Add-PnPField -List $listName -DisplayName "Clinic Location" -InternalName "ClinicLocation" -Type Choice -Choices "Montreal", "Quebec City", "Laval" -AddToDefaultView Add-PnPField -List $listName -DisplayName "Order Status" -InternalName "OrderStatus" -Type Choice -Choices "Pending", "Approved", "Ordered", "Received" -DefaultValue "Pending" -AddToDefaultView Add-PnPField -List $listName -DisplayName "Urgency" -InternalName "Urgency" -Type Choice -Choices "Low", "Medium", "High" -AddToDefaultView Add-PnPField -List $listName -DisplayName "Total Cost" -InternalName "TotalCost" -Type Currency -AddToDefaultView

Write-Host "SharePoint List '$listName' created successfully." -ForegroundColor Green