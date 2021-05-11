Function mkFolders() {
	For ($i=0; $i -lt 4; $i+=2) {
		$a = $i+1;
		$str = 'Semaine '+$a + ' et ' + ($a+1);
		mkdir $str;
		echo "Hello World" >> test1.txt
	}
}

Get-ChildItem . -Directory | % {
	$path = $_.FullName;
	cd $path;
	mkFolders;
	cd ..;
}
