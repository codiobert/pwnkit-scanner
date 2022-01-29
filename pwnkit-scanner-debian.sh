#!/bin/bash


VULNERABLE_VERSIONS=(
    '0.112-5'
    '0.112-13'
    '0.96-2'
    '0.96-5'
    '0.96-7'
    '0.96-11'
    '0.112-1'
    '0.112-5'
    '0.112-6'
    '0.112-7'
    '0.112-9'
    '0.112-11'
    '0.112-12'
    '0.112-14'
    '0.112-17'
    '0.112-18'
    '0.112-22'
    '0.112-26'
    '0.115-6'
    '0.115-9'
    '0.115-11'
    '0.115-12'
)


echo
printf "[*] Checking vulnerable version in installed packages...\n"
echo

DPKG_RESULT="$(dpkg -l | grep polkit | awk '{print $3"%"$2}')"
IS_VULNERABLE=0

for dpkgLine in $DPKG_RESULT ; do
	IFS='%'
	read -a strarr <<< "$dpkgLine"
	pkgVersion=${strarr[0]}
	pkgName=${strarr[1]}

	for version in ${VULNERABLE_VERSIONS[@]}; do
		if [[ $pkgVersion == ${version}* ]]
		then
			IS_VULNERABLE=1
			printf "[-] Possible vulnerable package: $pkgName (version $pkgVersion) \n";
		fi
	done
done

if [ $IS_VULNERABLE -eq 1 ]
then
	echo
	printf "[-] Oh no! It looks like there are vulnerable packages.\n"
else
	printf "[+] OK, It seems there are not vulnerable packages\n"
fi

echo
printf "[*] NOTE: This test are not 100%% reliable, but it helps for quick scan.\n"
echo
