$file = "./light_manager.do";

Function writeForSim([String] $text) {
	$text | Out-File -FilePath $file
}


[String] $val0 = "000000000";
[String] $val1 = "000000001"; 
[String] $cmd ;#= "force cycle_time $val0 0, $val1 1 `r`n"
$bn = 0b000000000
For ($i=0; $i -lt 202; $i += 1) {
  $i_1 = $i + 1 
	$bn += [Convert]::ToString($i, 2);

	#	$t = 0b000000000;
	$temp1 = [Convert]::ToString($i, 2);
	$temp2 = [Convert]::ToString($i_1, 2);
	$bin1 = $temp1 #+ $t;
	$bin2 = $temp2 #+ $t;

	$cmd += "force cycle_time $i $bin1"#, $i_1 $bin2"
	$cmd += "`r`n";
}

[String] $generics= "-gt1=10#9# -gt2=10#9# -gt3=10#3# -gt4=10#3# -gt5=10#6# -gty=10#1#"

[String] $cmd2 = "force is_rush_hour 0 0, 1 50, 0 80, 1 120, 0 165"

[String] $otherArgs = "vsim -t ms "+ $generics + " light_manager `r`nadd wave -unsigned * `r`n" + $cmd + "`r`n" + $cmd2 + "`r`nrun 202ms"

writeForSim $otherArgs
