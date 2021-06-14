[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 
$process = Get-Process -Name RewardsCrack_4  -ErrorAction SilentlyContinue
$global:notify = $true
$global:Visible = $false
$global:PointsPre = 0
$global:PointsPost = 0
function Notify{
  param(
	[string]$Titel,
	[string]$Infotext,
    [int]$Countdown,
    [string]$Icon

  )
 if($global:notify[0] -match "true"){
  $counter = 0
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(1,1)
$Form.text                       = "Form"
$Form.AllowTransparency = $true
$Form.ShowInTaskbar = $false
$Form.Opacity = 0
$Form.TopMost                    = $true
$Form.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#323740")
$Form.FormBorderStyle            = [System.Windows.Forms.FormBorderStyle]::None
$Form.Location.X                 = 30
$Form.Location.y                 = 300
$Poistion                        = 'RightBottom'
$Coordinates                     = switch ($Poistion)
{
    #'LeftTop' { 0, 0 }
    'LeftBottom'  { 0, $([System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Bottom) }
    #'RightTop' { $([System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Width - $Form.Width), 0 }
    'RightBottom' { $([System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Width - $Form.Width), $([System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Bottom - $Form.Height) }
}

$Form.StartPosition = [System.Windows.Forms.FormStartPosition]::Manual
$Form.Location           = New-Object System.Drawing.Point($Coordinates)

$Button_ok                       = New-Object system.Windows.Forms.Button
$Button_ok.text                  = "OK"
$Button_ok.Visible               = $false
$Button_ok.width                 = 101
$Button_ok.height                = 30
$Button_ok.location              = New-Object System.Drawing.Point(259,84)
$Button_ok.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',11)
$Button_ok.ForeColor             = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$Button_ok.BackColor             = [System.Drawing.ColorTranslator]::FromHtml("#323740")

$PictureBox1                     = New-Object system.Windows.Forms.PictureBox
$PictureBox1.width               = 60
$PictureBox1.height              = 60
$PictureBox1.location            = New-Object System.Drawing.Point(5,5)
$PictureBox1.imageLocation       = $Icon #Your Image here
$PictureBox1.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = $Titel #Your Text here
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(80,12)
$Label1.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',13)
$Label1.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#9b9b9b")

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = $Infotext #Your Text here
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(80,42)
$Label2.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',11)
$Label2.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#9b9b9b")

$CheckBox1                       = New-Object system.Windows.Forms.CheckBox
$CheckBox1.AutoSize              = $false
$CheckBox1.Visible               = $false
$CheckBox1.width                 = 238
$CheckBox1.height                = 25
$CheckBox1.location              = New-Object System.Drawing.Point(11,96)
$CheckBox1.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$CheckBox1.ForeColor             = [System.Drawing.ColorTranslator]::FromHtml("#9b9b9b")

$Form.controls.AddRange(@($Button_ok,$PictureBox1,$Label1,$Label2))

$global:a                        = 1 #if $a is 0 the MasseBox topmost set to false

$Button_ok.Add_Click({
    $global:a                    = 0
    while($global:sitze -gt 0){
        $global:sitze           -= 2 #Animationspeed
        $Coordinates             = switch ($Poistion)
        { #Screensize
            'LeftTop' { 0, 0 }
            'LeftBottom'  { 0, $([System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Bottom - $global:sitze + 2 ) }
            'RightTop' { $([System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Width - $Form.Width), 0 }
            'RightBottom' { $([System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Width - $Form.Width), $([System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Bottom - $global:sitze +2) }
        }
        $Form.Location           = New-Object System.Drawing.Point($Coordinates) #low slide down
        Start-Sleep -Milliseconds 1 #CPU Performace improved
    }
    [void]$Form.Hide()
})
if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}
$Form.Add_MouseHover({
    $global:topmost              = 1
})
$Form.Add_MouseLeave({
    $global:topmost              = 0
})
$CheckBox1.Add_MouseHover({
    $global:topmost              = 1
})
$CheckBox1.Add_MouseLeave({
    $global:topmost              = 0
})
$Label1.Add_MouseHover({
    $global:topmost              = 1
})
$Label1.Add_MouseLeave({
    $global:topmost              = 0
})
$PictureBox1.Add_MouseHover({
    $global:topmost              = 1
})
$PictureBox1.Add_MouseLeave({
    $global:topmost              = 0
})
$Button_ok.Add_MouseHover({
    $global:topmost              = 0
})
$Button_ok.Add_MouseLeave({
    $global:topmost              = 1
})

#Show Text on Hover
$CheckBox1.Add_MouseHover({ $CheckBox1.text                  = "disable notifications" })
$CheckBox1.Add_MouseLeave({ $CheckBox1.text                  = "" })


[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')  	 | out-null
[System.Reflection.Assembly]::LoadWithPartialName('presentationframework') 	 | out-null
[System.Reflection.Assembly]::LoadWithPartialName('System.Drawing') 		 | out-null
[System.Reflection.Assembly]::LoadWithPartialName('WindowsFormsIntegration') | out-null

$global:i                        = 0

$time                            = 2

$global:sitze                    = 0

[void]$Form.Show()
if($global:sound[0] -match "true"){
Start-Job -Name "Play Sound" -ScriptBlock({start-sleep -m 700;[System.Console]::Beep(999,90);[System.Console]::Beep(800,90);}) | Out-Null
}
#While QickNotify Massagebox is visible
#--------------------------------------
#--------------------------------------
Start-Sleep -Seconds 1
do{[System.Windows.Forms.Application]::DoEvents()

$Form.ClientSize                 = New-Object System.Drawing.Point(374,126)
    [void]$Form.Update()
    Start-Sleep -Milliseconds 1 #Improve CPU Performance
    if([System.Windows.Forms.Cursor]::Position.X -gt [System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Width - $Form.Width -and [System.Windows.Forms.Cursor]::Position.Y -gt [System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Bottom - $Form.Height -and $sitze -gt $Form.Height -and $global:a -eq 1 -and ([System.Windows.Forms.Cursor]::Position.X -lt [System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Width -and [System.Windows.Forms.Cursor]::Position.Y -lt [System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Bottom)){
         $Form.TopMost        = $false
         while($global:sitze -gt 0){
         if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}
            $global:sitze           -= 2 #Animationspeed
            $Coordinates             = switch ($Poistion)
            { #Screensize
                'LeftTop' { 0, 0 }
                'LeftBottom'  { 0, $([System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Bottom - $global:sitze + 2 ) }
                'RightTop' { $([System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Width - $Form.Width), 0 }
                'RightBottom' { $([System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Width - $Form.Width), $([System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Bottom - $global:sitze +2) }
            }
            $Form.Location           = New-Object System.Drawing.Point($Coordinates) #low slide down
            Start-Sleep -Milliseconds 1 #CPU Performace improved
        }
        [void]$Form.Hide()
        #$CheckBox1.Visible       = $true #CheckBox and Button are only visible when the mouse is on the MassageBox
        #$Button_ok.Visible       = $true
        if($global:topmost -eq $true){
            $Form.TopMost        = $false
            $global:a                    = 0
        }
        else{
            $Form.topmost        = $false
        }
        }
    else{
        $CheckBox1.Visible       = $false
        $Button_ok.Visible       = $false
        $Form.TopMost            = $false
    }
    $counter                    += 1 #Counter
    if(-not($sitze -gt $Form.Height) -and $counter -lt $Countdown){ #Popup Animation show duration* show in line 198 to change the time $counter 
        $global:sitze           += 2 #Animationspeed
        $Coordinates             = switch ($Poistion)
    {
        'LeftTop' { 0, 0 }
        'LeftBottom'  { 0, $([System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Bottom - $global:sitze + 2 ) }
        'RightTop' { $([System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Width - $Form.Width), 0 }
        'RightBottom' { $([System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Width - $Form.Width), $([System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Bottom - $global:sitze +2) }
    }
    $Form.Location               = New-Object System.Drawing.Point($Coordinates)
    $Form.Opacity = 1
    }
    if($counter -gt $Countdown){ #Counter hide the MessageBox if reaches 2000*
        $global:sitze           -= 2 #Animationspeed
        $Coordinates             = switch ($Poistion)
    { #Get Screensize (WorkingArea = without taskbar)
        'LeftTop' { 0, 0 }
        'LeftBottom'  { 0, $([System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Bottom - $global:sitze + 2 ) }
        'RightTop' { $([System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Width - $Form.Width), 0 }
        'RightBottom' { $([System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Width - $Form.Width), $([System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Bottom - $global:sitze +2) }
    }
    $Form.Location               = New-Object System.Drawing.Point($Coordinates) #Move the MassageBox to the new Location
    if($global:sitze -lt 0){ #Hide the MessageBox if it is not visible in the Working Area
        $Form.Visible            = $false
    }
    }
}until($Form.Visible -eq $false)

}}
if(($process.Count -gt 1 -and $process.Count -lt 3) -or (Get-Process -name rc3_gui  -ErrorAction SilentlyContinue) -or (Get-Process -name rc3_bto  -ErrorAction SilentlyContinue)){
notify -Titel "REWARDS CRACK" -Infotext ("Rewards Crack läuft bereits.`nKlicke erneut um alle Instanzen`nzu beenden.") -Countdown 700 -Icon "https://img.icons8.com/color/60/000000/cancel--v1.png"
else{
if($process.Count -gt 2){
    notify -Titel "REWARDS CRACK" -Infotext ("Rewards Crack wird jetzt beendet.") -Countdown 700 -Icon "https://img.icons8.com/color/60/000000/info-squared.png"
    Stop-Process -Name RewardsCrack_4 -Force
    Stop-Process -Name powershell -Force 
}
}
}
else{
Stop-Process -Name iexplore -Force -ErrorAction SilentlyContinue
if(-not(test-path ($env:HOMEPATH + "\AppData\Roaming\MiRUTH\RewardsCrack"))){ #installation
    if(-not(Test-Path ($env:HOMEPATH + "\AppData\Roaming\MiRUTH")) -and (Test-Path ($env:HOMEPATH + "\AppData\Roaming")))
    {
        new-item -Path ($env:HOMEPATH + "\AppData\Roaming\") -Name "MiRUTH" -ItemType "directory" -ErrorAction SilentlyContinue
        new-item -Path ($env:HOMEPATH + "\AppData\Roaming\MiRUTH") -Name "RewardsCrack" -ItemType "directory" -ErrorAction SilentlyContinue
    }
    else
    {
        if(-not(Test-Path ($env:HOMEPATH + "\AppData\Roaming\MiRUTH\RewardsCrack")) -and (Test-Path ($env:HOMEPATH + "\AppData\Roaming\MiRUTH")))
        {
           new-item -Path ($env:HOMEPATH + "\AppData\Roaming\MiRUTH") -Name "RewardsCrack" -ItemType "directory" -ErrorAction SilentlyContinue 
        }
    }
    if((Test-Path ($env:HOMEPATH + "\AppData\Roaming\MiRUTH\RewardsCrack")) -and (Test-Path ($PSScriptRoot + "\zero")))
    {
        #Move-Item -Path ($PSScriptRoot + ".\zero.ico") -Destination ($env:HOMEPATH + "\AppData\Roaming\MiRUTH\RewardsCrack")
        #Move-Item -Path ($PSScriptRoot + "\RewardsCrack_v4.exe") -Destination ($env:HOMEPATH + "\AppData\Roaming\MiRUTH\RewardsCrack")
        #$ShortcutFile = $env:USERPROFILE + "\Desktop\Rewards Crack 4.lnk"
        #$WScriptShell = New-Object -ComObject WScript.Shell
        #$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
        #$Shortcut.Description = "RewardsCrack_v4.exe"
        #$shortcut.WorkingDirectory = ($env:USERPROFILE + "\AppData\Roaming\")
        #$Shortcut.TargetPath = $env:USERPROFILE+ "\AppData\Roaming\MiRUTH\RewardsCrack\RewardsCrack_v4.exe"
        #$Shortcut.Save()
        notify -Titel "REWARDS CRACK 4.0" -Infotext "Rewards Crack wurde Installiert." -Countdown 300 -Icon "https://img.icons8.com/color/60/000000/info-squared.png"
        exit
    }
}
function TrayIcon{
#$icon                            = [System.Drawing.Icon]::ExtractAssociatedIcon(".\RewardsCrack_4.exe") #Your Tray Icon here
$code = @"
using System;
using System.Drawing;
using System.Runtime.InteropServices;

namespace System
{
	public class IconExtractor
	{

	 public static Icon Extract(string file, int number, bool largeIcon)
	 {
	  IntPtr large;
	  IntPtr small;
	  ExtractIconEx(file, number, out large, out small, 1);
	  try
	  {
	   return Icon.FromHandle(largeIcon ? large : small);
	  }
	  catch
	  {
	   return null;
	  }

	 }
	 [DllImport("Shell32.dll", EntryPoint = "ExtractIconExW", CharSet = CharSet.Unicode, ExactSpelling = true, CallingConvention = CallingConvention.StdCall)]
	 private static extern int ExtractIconEx(string sFile, int iIndex, out IntPtr piLargeVersion, out IntPtr piSmallVersion, int amountIcons);

	}
}
"@
$global:exit = 0
Add-Type -TypeDefinition $code -ReferencedAssemblies System.Drawing
$global:Main_Tool_Icon                  = New-Object System.Windows.Forms.NotifyIcon #Tray Icon
$global:Main_Tool_Icon.Text             = "Rewards Crack - click to Exit" #Popup Text on MouseHover
$global:Main_Tool_Icon.Icon             = ($PSScriptRoot + "\zero.ico")#$icon #[System.IconExtractor]::Extract("shell32.dll", 43, $true
$global:Main_Tool_Icon.Visible          = $true
$global:Main_Tool_Icon.Add_Click({
    $Main_Tool_Icon.Visible      = $false
    [void]$Form.Hide()
$global:exit = 1
 })
}
TrayIcon
$global:exit = 0
$global:active = 1
if(test-path ($env:HOMEPATH + "\AppData\Roaming\MiRUTH\RewardsCrack\config.txt")){
$settings = Get-Content ($env:HOMEPATH + "\AppData\Roaming\MiRUTH\RewardsCrack\config.txt")
    foreach($setting in $settings){
        if($setting -match "notify"){
            $global:notify = $setting.split("=")[1].Split("#")
        }
        if($setting -match "sound"){
            $global:sound = $setting.split("=")[1].Split("#")
        }
        if($setting -match "runs"){
            $global:runs = $setting.split("=")[1].Split("#")
        }
        if($setting -match "quiz"){
            $global:quiz = $setting.split("=")[1].Split("#")
        }
        if($setting -match "licence"){
            $global:lizenz = $setting.split("=")[1].Split("#")
        }
        if($setting -match "account"){
            $global:account = $setting.split("=")[1].Split(",").Split("#")
        }
    }
}
else{
notify -Titel "REWARDS CRACK 4.0" -Infotext "Rewards Crack ist umgezogen!`nHier im Tray findest du das Icon.`nKlicke zum beenden auf das Icon." -Countdown 1000 -Icon "https://img.icons8.com/color/60/000000/info-squared.png"
notify -Titel "REWARDS CRACK 4.0" -Infotext "Mit der Maus kanst du`ndie Benachrichtungen schneller`nausblenden. Probier es gleich aus oder`ndeaktiviere Sie in den Einstellungen." -Countdown 1000 -Icon "https://img.icons8.com/color/60/000000/info-squared.png"
notify -Titel "REWARDS CRACK 4.0" -Infotext "Die Icons stammen übrigens von`nicons8.com" -Countdown 400 -Icon "https://img.icons8.com/color/60/000000/info-squared.png"
new-item -Name "config.txt" -Path ($env:HOMEPATH + "\AppData\Roaming\MiRUTH\RewardsCrack\") -ItemType File
$Value = "notify=true#Benachrichtigungen true für an false für aus`nsound=true#Sounds true für an false für aus`nruns=30#Bing Suchdruchläufe 30 ist Standard`nquiz=true#Bing Quiz machen  true für an false für aus`nlicence=435678987656789876578908`naccount=maxmustermann@outlook.de:passwort,claudiamusterfrau@hotmail.com:passwort#mehrere Accounts möglich"
Set-Content -Path ($env:HOMEPATH + "\AppData\Roaming\MiRUTH\RewardsCrack\config.txt") -Value $Value
start ($env:HOMEPATH + "\AppData\Roaming\MiRUTH\RewardsCrack\config.txt")
notify -Titel "REWARDS CRACK 4.0" -Infotext "Noch sind keine Accounts vorhanden.`nFüge die Accounts in die Config Datei`nein und starte REWARDS CRACK neu" -Countdown 1200 -Icon "https://img.icons8.com/color/60/000000/info-squared.png"
$settings = Get-Content ($env:HOMEPATH + "\AppData\Roaming\MiRUTH\RewardsCrack\config.txt")
    foreach($setting in $settings){
        if($setting -match "notify"){
            $global:notify = $setting.split("=")[1].Split("#")
        }
        if($setting -match "sound"){
            $global:sound = $setting.split("=")[1].Split("#")
        }
        if($setting -match "runs"){
            $global:runs = $setting.split("=")[1].Split("#")
        }
        if($setting -match "quiz"){
            $global:quiz = $setting.split("=")[1].Split("#")
        }
        if($setting -match "licence"){
            $global:lizenz = $setting.split("=")[1].Split("#")
        }
        if($setting -match "account"){
            $global:account = $setting.split("=")[1].Split(",").Split("#")
        }
    }
exit
}
if($global:notify -eq ""){
    $global:notify = "true"
}
if($global:sound -eq ""){
    $global:sound = "true"
}
if($global:runs -eq ""){
    $global:runs = 30
}
if($global:quiz -eq ""){
    $global:quiz = "true"
}
if($global:lizenz -eq ""){
    $global:lizenz = "435678987656789876578908"
}
if($global:account -eq ""){
    $global:account = "maxmustermann@outlook.de,passwort"
}
$global:Fehler = 0
function MicrosoftLogin{
  param(
	[string]$username,
	[string]$password
  )
 Stop-Process -Name iexplore -Force -ErrorAction SilentlyContinue
 start-sleep -s 2
$ie = New-Object -ComObject 'internetExplorer.Application' -ErrorAction Ignore -ErrorVariable global:Fehler
if($global:Fehler.Count -ne 0){
    notify -Titel "REWARDS CRACK" -Infotext ("Es ist ein unerwarteter`nFehler aufgetreten.`nStarten Sie die Anwendung neu.") -Countdown 700 -Icon "https://img.icons8.com/color/60/000000/cancel--v1.png"
    $global:Main_Tool_Icon.Visible      = $false
    exit
}
$ie.Visible= $global:Visible
$ie.Navigate("https://www.microsoft.com/mscomhp/onerf/signout?pcexp=False&ru=https%3A%2F%2Fwww.microsoft.com%2Fde-de%2F%3Fwa%3Dwsignin1.0")
While ($ie.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
#Stop-Process -Name iexplore -Force
#Start-Sleep -Seconds 1
$ie = New-Object -ComObject 'internetExplorer.Application' -ErrorAction Ignore -ErrorVariable global:Fehler
if($global:Fehler.Count -ne 0){
    notify -Titel "REWARDS CRACK" -Infotext ("Es ist ein unerwarteter`nFehler aufgetreten.`nStarten Sie die Anwendung neu.") -Countdown 700 -Icon "https://img.icons8.com/color/60/000000/cancel--v1.png"
    $global:Main_Tool_Icon.Visible      = $false
    exit
}
$ie.Visible= $global:Visible
$ie.Navigate("https://login.live.com/login.srf?wa=wsignin1.0&rpsnv=13&ct=1617198935&rver=6.7.6631.0&wp=MBI_SSL&wreply=https%3a%2f%2fwww.bing.com%2fsecure%2fPassport.aspx%3frequrl%3dhttps%253a%252f%252fwww.bing.com%252f%253fcc%253dde%2526wlsso%253d1%2526wlexpsignin%253d1%26sig%3d3B6AE06771B46E150D82F06C70746F9A&lc=1031&id=264960&CSRFToken=ed45b454-ac16-42e5-9c6f-82efc22edaa4&aadredir=1")
While ($ie.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
$usernamefield = $ie.document.getElementByID('i0116')
$usernamefield.click()
$usernamefield.value = "$username"
$ie.Document.body.focus()
$Link = $ie.document.getElementByID('idSIButton9')
$Link.focus()
$Link.click()
$Link = $ie.document.getElementByID('idSIButton9')
$Link.focus()
$Link.click()
$ie.Document.body.focus()
Start-Sleep -s 1
$global:Item = $ie.document.getElementByID('aadTileTitle')
if($Item.textContent.Length -gt 10){
     notify -Titel "REWARDS CRACK" -Infotext ($user_0.Split(":")[0],"`nist ein Geschäftskonto.`nGeschäftskonten werden nicht`nunterstüzt.") -Countdown 700 -Icon "https://img.icons8.com/color/60/4a90e2/box-important--v1.png"
}
$passwordfield = $ie.document.getElementByID('i0118')
$passwordfield.value = "$password"
$ie.Document.body.focus()
$CheckBox = $ie.document.getElementByID('idChkBx_PWD_KMSI0Pwd')
    $CheckBox.focus()
    $CheckBox.click()
$Link = $ie.document.getElementByID('idSIButton9')
$Link.focus()
$Link.click()
try
{
    $global:errors = 0
    $Link.click()
}
catch
{
    notify -Titel "REWARDS CRACK" -Infotext ($user_0.Split(":")[0],"`nkonnte nicht angemeldet werden.`nVersuchen Sie es später erneut") -Countdown 700 -Icon "https://img.icons8.com/color/60/4a90e2/box-important--v1.png"
    $global:errors = 1
}
#$global:Error1 = ""
#$global:Error2 = ""
#try{
#write-host "TRY PASSWORT"
#$global:Error1 = $ie.document.getElementByID('usernameError')
#$global:Error2 = $ie.document.getElementByID('passwordError')
#write-host "TRY PASSWORT"
#}
#catch{
# }
# if($global:Error2 -ne "" -or $global:Error1 -ne ""){
#        notify -Titel "REWARDS CRACK" -Infotext ($user_0.Split(":")[0],"`nkonnte nicht angemeldet werden.`nPrüfen Sie die Anmeldedaten.") -Countdown 700 -Icon "https://img.icons8.com/color/60/000000/cancel--v1.png"
#        
#    }
$ie = New-Object -ComObject 'internetExplorer.Application' -ErrorAction Ignore -ErrorVariable global:Fehler
if($global:Fehler.Count -ne 0){
    notify -Titel "REWARDS CRACK" -Infotext ("Es ist ein unerwarteter`nFehler aufgetreten.`nStarten Sie die Anwendung neu.") -Countdown 700 -Icon "https://img.icons8.com/color/60/000000/cancel--v1.png"
    $global:Main_Tool_Icon.Visible      = $false
    exit
}
$ie.Visible= $global:Visible
$ie.Navigate("https://bing.com")
While ($ie.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
$anmelden = $ie.Document.links | where innerText -match "Anmelden"
$anmelden.click()
While ($ie.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}

}
function BingSerch{
  param(
	[Int]$number
  )
$count = 0
while($Number -gt $count){
    if($exit -eq 1){
       $global:Main_Tool_Icon.Visible      = $false
       exit
    }
    $random = -join ((33..126)| Get-Random -Count 5 | % {[char]$_})
    $iexplo = new-object -com InternetExplorer.Application -ErrorAction Ignore -ErrorVariable global:Fehler
    if($global:Fehler.Count -ne 0){
        notify -Titel "REWARDS CRACK" -Infotext ("Es ist ein unerwarteter`nFehler aufgetreten.`nStarten Sie die Anwendung neu.") -Countdown 700 -Icon "https://img.icons8.com/color/60/000000/cancel--v1.png"
        $global:Main_Tool_Icon.Visible      = $false
        exit
    }
    $iexplo.Visible = $false
    $iexplo.Navigate2("http://www.bing.com/search?q=" + $random);
    While ($ie.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
    $count += 1
}
}
function ConnectionUndLizenzTest{
    $HTTP_Request1 = [System.Net.WebRequest]::Create('http://google.com')
    try
    {
      $HTTP_Response1 = $HTTP_Request1.GetResponse()
    }
    Catch
    {
        $HTTP_Response1 = ""
    }
    
    $HTTP_Request2 = [System.Net.WebRequest]::Create('http://miruth.de/response.txt')
    try
    {
      $HTTP_Response2 = $HTTP_Request2.GetResponse()
    }
    Catch
    {
        $HTTP_Response2 = ""
    }
    if($HTTP_Response2 -eq "" -and $global:lizenz -ne "full" -and $HTTP_Response1 -ne ""){
        notify -Titel "REWARDS CRACK" -Infotext ("Es sieht so aus als ob`nDeine Lizenz nicht mehr gültig ist.`nErneuere Sie oder`nversuche es später erneut.") -Countdown 900 -Icon "https://img.icons8.com/color/60/000000/cancel--v1.png"
        $global:Main_Tool_Icon.Visible      = $false
        exit
    }
    if($HTTP_Response1 -ne "" -and $global:lizenz -eq "full" -and $global:active -eq 1){
        notify -Titel "REWARDS CRACK" -Infotext ("PRO Lizenz gefunden.") -Countdown 200 -Icon "https://img.icons8.com/color/60/000000/info-squared.png"
        $global:active = 0
    }
    if($HTTP_Response1 -ne "" -and $global:lizenz -eq "435678987656789876578908"  -and $global:active -eq 1){
        notify -Titel "REWARDS CRACK" -Infotext ("BASIC Lizenz gefunden.") -Countdown 200 -Icon "https://img.icons8.com/color/60/000000/info-squared.png"
        $global:active = 0
    }
    if($global:lizenz -ne "full" -and $global:lizenz -ne "435678987656789876578908"){
        notify -Titel "REWARDS CRACK" -Infotext ("Keine Lizenz gefunden.") -Countdown 700 -Icon "https://img.icons8.com/color/60/000000/cancel--v1.png"
        $global:Main_Tool_Icon.Visible      = $false
        exit
    }
    if($global:lizenz -eq "435678987656789876578908" -or $global:lizenz -eq "full" -and $HTTP_Response1 -eq ""){
        notify -Titel "REWARDS CRACK" -Infotext ("Es sieht so aus als ob`ndu offline bist.") -Countdown 200 -Icon "https://img.icons8.com/color/60/000000/cancel--v1.png"
        $global:Main_Tool_Icon.Visible      = $false
        exit
    }

}
################OLD--------------------------------------------->
#function RewardsQuiz{
#$ie = New-Object -ComObject 'internetExplorer.Application' -ErrorAction Ignore -ErrorVariable global:Fehler
#if($global:Fehler.Count -ne 0){
#    notify -Titel "REWARDS CRACK" -Infotext ("Es ist ein unerwarteter`nFehler aufgetreten.`nStarten Sie die Anwendung neu.") -Countdown 700 -Icon "https://img.icons8.com/color/60/000000/cancel--v1.png"
#    $global:Main_Tool_Icon.Visible      = $false
#    exit
#}
#$ie.Visible= $global:Visible
#$ie.Navigate("https://account.microsoft.com/rewards/")
#While ($ie.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
#Start-Sleep -s 10
#try{
#[int]$global:PointsPre += $ie.Document.body.getElementsByClassName("bold number margin-top-1")[0].InnerText.replace(".","")
#}
#    catch{
#   if($ie.Document.body.getElementsByClassName("bold number margin-top-1").innerHTML -match "<mee-rewards-counter-animation class="){#############
#
#    }
#    else{
#    notify -Titel "REWARDS CRACK" -Infotext ($user_0.Split(":")[0],"`nkonnte nicht angemeldet werden.`nPrüfen Sie die Anmeldedaten.") -Countdown 700 -Icon "https://img.icons8.com/color/60/4a90e2/box-important--v1.png"
#        $global:errors = 1
#    } 
#}
#$global:links10p = $ie.Document.links | where innerText -match "10 Punkte"
##$links30p = $ie.Document.links | where innerText -match "30 Punkte"
#foreach($global:link in $links10p){
#    $ie.Visible = $global:Visible
#    #$global:link2 = $global:link
#    $global:link.click()
#    Start-Sleep -s 3
#    #$ie.Navigate($global:link.ie8_href)
#    #$ie.Visible= $global:Visible
#    While ($ie.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
#}

#foreach($quiz in $links30p.ie8_href){
#    $ie.Navigate($quiz)
#    While ($ie.Busy -eq $true) {Start-Sleep -Seconds 3;}
#    $button = $ie.Document.getElementById("rqStartQuiz")
#    $button
#    $button.focus()
#    Start-Sleep -Seconds 1
#    $options = $ie.Document | where class -match "b_cards bt_lstcl_card btcs btwNoImg"
#}
#
#$ie.Visible= $global:Visible
#$ie.Navigate("https://account.microsoft.com/rewards/")
#While ($ie.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
#Start-Sleep -s 10
#try{
#$global:PointsPost += $ie.Document.body.getElementsByClassName("bold number margin-top-1")[0].InnerText.replace(".","")
#}
#    catch{
#   if($ie.Document.body.getElementsByClassName("bold number margin-top-1").innerHTML -match "<mee-rewards-counter-animation class="){###
#
#    }
#    else{
#    if($global:errors -ne 1){
#        notify -Titel "REWARDS CRACK" -Infotext ($user_0.Split(":")[0],"`nkonnte nicht angemeldet werden.`nPrüfen Sie die Anmeldedaten.") -Countdown 700 -Icon "https://img.icons8.com/color/60/4a90e2/box-important--v1.png"
#            $global:errors = 1
#    }
#    } 
#}
#}
################OLD---------------------------------------------<
function Set-WindowStyle {
param(
    [Parameter()]
    [ValidateSet('FORCEMINIMIZE', 'HIDE', 'MAXIMIZE', 'MINIMIZE', 'RESTORE', 
                 'SHOW', 'SHOWDEFAULT', 'SHOWMAXIMIZED', 'SHOWMINIMIZED', 
                 'SHOWMINNOACTIVE', 'SHOWNA', 'SHOWNOACTIVATE', 'SHOWNORMAL')]
    $Style = 'SHOW',
    [Parameter()]
    $MainWindowHandle = (Get-Process -Id $pid).MainWindowHandle
)
    $WindowStates = @{
        FORCEMINIMIZE   = 11; HIDE            = 0
        MAXIMIZE        = 3;  MINIMIZE        = 6
        RESTORE         = 9;  SHOW            = 5
        SHOWDEFAULT     = 10; SHOWMAXIMIZED   = 3
        SHOWMINIMIZED   = 2;  SHOWMINNOACTIVE = 7
        SHOWNA          = 8;  SHOWNOACTIVATE  = 4
        SHOWNORMAL      = 1
    }
    Write-Verbose ("Set Window Style {1} on handle {0}" -f $MainWindowHandle, $($WindowStates[$style]))

    $Win32ShowWindowAsync = Add-Type –memberDefinition @” 
    [DllImport("user32.dll")] 
    public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
“@ -name “Win32ShowWindowAsync” -namespace Win32Functions –passThru

    $Win32ShowWindowAsync::ShowWindowAsync($MainWindowHandle, $WindowStates[$Style]) | Out-Null
}
function RewardsQuiz{
$ie = New-Object -ComObject 'internetExplorer.Application' -ErrorAction Ignore -ErrorVariable global:Fehler
if($global:Fehler.Count -ne 0){
    notify -Titel "REWARDS CRACK" -Infotext ("Es ist ein unerwarteter`nFehler aufgetreten.`nStarten Sie die Anwendung neu.") -Countdown 700 -Icon "https://img.icons8.com/color/60/000000/cancel--v1.png"
    $global:Main_Tool_Icon.Visible      = $false
    exit
}
$ie.Visible= $global:Visible
$ie.Navigate("https://account.microsoft.com/rewards/")
While ($ie.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
Start-Sleep -s 10
try{
[int]$global:PointsPre += $ie.Document.body.getElementsByClassName("bold number margin-top-1")[0].InnerText.replace(".","")
}
    catch{
   if($ie.Document.body.getElementsByClassName("bold number margin-top-1").innerHTML -match "<mee-rewards-counter-animation class="){

    }
    else{
    notify -Titel "REWARDS CRACK" -Infotext ($user_0.Split(":")[0],"`nkonnte nicht angemeldet werden.`nPrüfen Sie die Anmeldedaten.") -Countdown 700 -Icon "https://img.icons8.com/color/60/4a90e2/box-important--v1.png"
        $global:errors = 1
    } 
}
$global:links10p = $ie.Document.links | where innerText -match "10 Punkte"
$global:links30p = $ie.Document.links | where innerText -match "30 Punkte"
foreach($global:link in $links10p){
    $ie.Visible = $global:Visible
    $global:link2 = $global:link
    $global:link.click()
    (Get-Process -Name "iExplore").MainWindowHandle | foreach { Set-WindowStyle HIDE $_ }
    Start-Sleep -s 3
    #$ie.Navigate($global:link.ie8_href)
    $ie.Visible= $global:Visible
    While ($ie.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
}
#Stop-Process -Name iexplore -ErrorAction SilentlyContinue
Start-Sleep -s 3
foreach($global:link in $global:links30p){
$ine = New-Object -ComObject 'internetExplorer.Application' -ErrorAction Ignore -ErrorVariable global:Fehler
Start-Sleep -s 3
    $ine.Visible = $global:Visible
    #$global:link.click()
    $ine.Navigate($global:link.IHTMLAnchorElement_href)
    (Get-Process -Name "iExplore").MainWindowHandle | foreach { Set-WindowStyle HIDE $_ }
    Start-Sleep -s 3
    While ($ine.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
    Start-Sleep -s 3
    $global:button_weiter = $ine.Document.getElementById("rqStartQuiz")
    $global:button_weiter.click()
    write-host $button_weiter,"-1"
    $antworten = @()
    $global:count = 0
    while($global:count -lt 4){
    $global:count += 1

    $ine.Document.getElementById("rqAnswerOption0").click();While ($ine.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
    $ine.Document.getElementById("rqAnswerOption1").click();While ($ine.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
    $ine.Document.getElementById("rqAnswerOption2").click();While ($ine.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
    $ine.Document.getElementById("rqAnswerOption3").click();While ($ine.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
    $ine.Document.getElementById("rqAnswerOption4").click();While ($ine.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
    $ine.Document.getElementById("rqAnswerOption5").click();While ($ine.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
    $ine.Document.getElementById("rqAnswerOption6").click();While ($ine.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
    $ine.Document.getElementById("rqAnswerOption7").click();While ($ine.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
    $ine.Document.getElementById("rqAnswerOption8").click();While ($ine.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
    $ine.Document.getElementById("rqAnswerOption9").click();While ($ine.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
    }


    #$button_a	=	$ie.Document.IHTMLDocument3_getElementById("1CF31B_54_btn")
    #$button_b	=	$ie.Document.IHTMLDocument3_getElementById("1CF31B_54_btn")
    #$button_c	=	$ie.Document.IHTMLDocument3_getElementById("1CF31B_54_btn")
    #$button_d	=	$ie.Document.IHTMLDocument3_getElementById("1CF31B_54_btn")
    #$button_e	=	$ie.Document.IHTMLDocument3_getElementById("1CF31B_54_btn")
    #$button_f	=	$ie.Document.IHTMLDocument3_getElementById("1CF31B_54_btn")
    #$button_g	=	$ie.Document.getElementById("1CF31B_54_btn")
    #$button_h	=	$ie.Document.getElementById("1CF31B_54_btn")
    #$button_i	=	$ie.Document.getElementById("1CF31B_54_btn")
    #$button_j	=	$ie.Document.getElementById("1CF31B_54_btn")
    #$button_k	=	$ie.Document.getElementById("1CF31B_54_btn")
    #$button_l	=	$ie.Document.getElementById("1CF31B_54_btn")
    #$button_m	=	$ie.Document.getElementById("1CF31B_54_btn")
    #$button_n	=	$ie.Document.getElementById("1CF31B_54_btn")
    #$button_o	=	$ie.Document.getElementById("1CF31B_54_btn")
    #$button_p	=	$ie.Document.getElementById("1CF31B_54_btn")
    #$button_q	=	$ie.Document.getElementById("1CF31B_54_btn")
    #$button_r	=	$ie.Document.getElementById("1CF31B_54_btn")
    #$button_s	=	$ie.Document.getElementById("1CF31B_54_btn")
    #$button_t	=	$ie.Document.getElementById("1CF31B_54_btn")
    #$button_u	=	$ie.Document.getElementById("1CF31B_54_btn")
    #$button_v	=	$ie.Document.getElementById("1CF31B_54_btn")
    #$button_w	=	$ie.Document.getElementById("1CF31B_54_btn")
    #$button_x	=	$ie.Document.getElementById("1CF31B_54_btn")
    #$button_y	=	$ie.Document.getElementById("1CF31B_54_btn")
    #$button_z	=	$ie.Document.getElementById("1CF31B_54_btn")

    #foreach($antwort in $antworten){
    #    $antwort.click()
    #    $ie.Height = 100
    #    $ie.Width = 100
    #    Start-Sleep -s 3
    #    While ($ie.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
    #}
#Stop-Process -Name iexplore -ErrorAction SilentlyContinue
}

#foreach($quiz in $links30p.ie8_href){
#    $ie.Navigate($quiz)
#    While ($ie.Busy -eq $true) {Start-Sleep -Seconds 3;}
#    $button = $ie.Document.getElementById("rqStartQuiz")
#    $button
#    $button.focus()
#    Start-Sleep -Seconds 1
#    $options = $ie.Document | where class -match "b_cards bt_lstcl_card btcs btwNoImg"
#}

$ie.Visible= $global:Visible
$ie.Navigate("https://account.microsoft.com/rewards/")
While ($ie.Busy -eq $true) {Start-Sleep -Seconds 3;if($exit -eq 1){$global:Main_Tool_Icon.Visible      = $false;exit}}
Start-Sleep -s 10
try{
$global:PointsPost += $ie.Document.body.getElementsByClassName("bold number margin-top-1")[0].InnerText.replace(".","")
}
    catch{
   if($ie.Document.body.getElementsByClassName("bold number margin-top-1").innerHTML -match "<mee-rewards-counter-animation class="){

    }
    else{
    if($global:errors -ne 1){
        notify -Titel "REWARDS CRACK" -Infotext ($user_0.Split(":")[0],"`nkonnte nicht angemeldet werden.`nPrüfen Sie die Anmeldedaten.") -Countdown 700 -Icon "https://img.icons8.com/color/60/4a90e2/box-important--v1.png"
            $global:errors = 1
    }
    } 
}
}

$userlist = $account[0..($account.Count -2)]
foreach($user_0 in $userlist){
   if((Get-Process -Name RewardsCrack_v4 -ErrorAction SilentlyContinue) -or (Get-Process -Name powershell* -ErrorAction SilentlyContinue) -or (Get-Process -Name  "RewardsCrack_v4.exe (32 Bit)" -ErrorAction SilentlyContinue)){
           if($test -eq 0){
        ConnectionUndLizenzTest
        $test = 1
            }
        notify -Titel "REWARDS CRACK" -Infotext ($user_0.Split(":")[0],"`nwird angemeldet...") -Countdown 400 -Icon "https://img.icons8.com/color/60/000000/info-squared.png"
        MicrosoftLogin -username $user_0.Split(":")[0] -password $user_0.Split(":")[1]
        if($Item.textContent.Length -lt 10 -and $global:errors -eq 0){
        if($global:quiz -match "true"){
        RewardsQuiz
        }
        if($check.textContent.Length -lt 2){
        BingSerch -number ([int]$global:runs[0] -and $global:errors -eq 0)
        }
        }
   }
   else
   {
        $global:Main_Tool_Icon.Visible      = $false
        #exit
   }
}
notify -Titel "REWARDS CRACK" -Infotext ("Abgeschlossen!`nPunkte:" + ($global:PointsPost) + "`nNeue Punkte:" + ($global:PointsPost - $global:PointsPre)) -Countdown 200 -Icon "https://img.icons8.com/color/60/000000/info-squared.png"
Stop-Process -Name iexplore
$global:Main_Tool_Icon.Visible      = $false
}
