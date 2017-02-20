$apps=@(     
    "9E2F88E3.Twitter"
    "ClearChannelRadioDigital.iHeartRadio"
    "Flipboard.Flipboard"
    "king.com.CandyCrushSodaSaga"
    "Microsoft.3DBuilder"
    "Microsoft.Appconnector"
    "Microsoft.BingFinance"
    "Microsoft.BingNews"
    "Microsoft.BingSports"
    "Microsoft.BingWeather"
    "Microsoft.CommsPhone"
    "Microsoft.Getstarted"
    "Microsoft.Messaging"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.Office.OneNote"
    "Microsoft.Office.Sway"
    "Microsoft.People"
    "Microsoft.SkypeApp"
    "Microsoft.Windows.Phone"
    "Microsoft.WindowsAlarms"
    "Microsoft.WindowsCamera"
    "Microsoft.WindowsMaps"
    "Microsoft.WindowsPhone"
    "Microsoft.XboxApp"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
    "Microsoft.MinecraftUWP"
    "ShazamEntertainmentLtd.Shazam"        
)

foreach ($app in $apps) {    
    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage
    Get-AppXProvisionedPackage -Online | where DisplayName -EQ $app | Remove-AppxProvisionedPackage -Online
            
    $appPath="$Env:LOCALAPPDATA\Packages\$app*"
    Remove-Item $appPath -Recurse -Force -ErrorAction 0
}