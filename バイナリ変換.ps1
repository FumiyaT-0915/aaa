
$file = "C:\Users\159na\OneDrive\デスクトップ\work\vbaProject.bin"
 
[Byte[]]$data = Get-Content $file -Encoding Byte
 
$buf = ''
$cnt = 0
 
Write-Host

$one = 0
$two = 0
$three = 0

foreach($a in $data)
{

    if($one -eq 0){
        if($a.ToString("X2") -eq "44"){
            $one = $cnt
            $cnt += 1
            #echo $one
            continue
        } else {
            $one = 0
            $two = 0
            $three = 0
            $cnt += 1
            continue
        }

    }

    if($two -eq 0) {
        if($a.ToString("X2") -eq "50"){
            $two = $cnt
            $cnt += 1

            #echo "${one}_${two}"
            continue
        } else {
            $one = 0
            $two = 0
            $three = 0
            $cnt += 1
            continue
        }
    }

    if($three -eq 0) {
        if($a.ToString("X2") -eq "42"){
            $three = $cnt
            echo "${one}_${two}_${three}"

            
            [byte[]]$Bone = [System.Text.Encoding]::Default.GetBytes("A")
            [byte[]]$Btwo = [System.Text.Encoding]::Default.GetBytes("P")
            [byte[]]$Bthree = [System.Text.Encoding]::Default.GetBytes("B")

            echo $Bone[0]
            echo $Btwo[0]
            echo $Bthree[0]

            $data[$one] = $Bone[0]
            $data[$two] = $Btwo[0]
            $data[$three] = $Bthree[0]

            Set-Content -Encoding Byte -Path "C:\Users\159na\OneDrive\デスクトップ\work\copy_vbaProject.bin" -Value $data

            break
        } else {
            $one = 0
            $two = 0
            $three = 0
            $cnt += 1
            continue
        }
    }

    $cnt += 1

}

[byte[]]$t = [System.Text.Encoding]::Default.GetBytes("A")
echo $t[0]

<#
echo "バイト文字をそのままで表示"
echo $data[0]
echo "バイト文字を16進数で表示"
echo $data[0].ToString("X2")
echo "文字　208　をバイト表示"
echo [System.Text.Encoding]::Default.GetString($data[0].ToString("X2"))
#>

#Write-Host $buf