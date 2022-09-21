#!/bin/bash

tput setaf 2;
echo "
URLplus v0.0.1
@shaharia63
"

tput sgr0;
read -p "Enter the Domain name : " DOM

read -p "Enter Subdomain Url File Links : " LINK

if [ -d /home/kali/urlplus/output/$DOM ]
then
  echo " "
else
  mkdir /home/kali/urlplus/output/$DOM 
fi

echo "${blue} [+] Started Waybackurls ${reset}"
echo " "
#Waybackurls
echo "${yellow} ---------------------------------- xxxxxxxx ---------------------------------- ${reset}"
echo " "
  echo "${magenta} [+] Running Waybackurls${reset}"
  printf "Waybackurls Started\n"
cat $LINK | waybackurls > output/$DOM/waybackurls.txt
printf "✅ Waybackurls data :$(wc -l output/$DOM/waybackurls.txt | awk '{print $1}')\n"
echo " "
echo "${blue} [+] Succesfully saved as Waybackurls.txt  ${reset}"
echo " "

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
printf "Hakrawler Data Started\n"
cat $LINK | hakrawler > output/$DOM/hakrawler.txt
printf "✅ hakrawler data :$(wc -l output/$DOM/hakrawler.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
printf "Gau Data Started\n"
cat $1 | gau --providers commoncrawl,otx,urlscan --o output/$DOM/gau.txt
printf "✅ Gau data :$(wc -l output/$DOM/gau.txt | awk '{print $1}')\n"

cat output/$DOM/waybackurls.txt output/$DOM/hakrawler.txt output/$DOM/gau.txt | sort -u > output/$DOM/all-urls.txt

cat output/$DOM/all-urls.txt | httpx > output/$DOM/live-urls.txt

rm output/$DOM/all-urls.txt

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

printf "Total all-urls :$(wc -l output/$DOM/all-urls.txt)\n"
printf "Total live-urls :$(wc -l output/$DOM/live-urls.txt)\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
printf "Grep zip Started\n"
cat output/$DOM/live-urls.txt | grep ".zip" > output/$DOM/zip.txt
printf "✅ Zip data :$(wc -l output/$DOM/zip.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
printf "Grep csv Started\n"
cat output/$DOM/live-urls.txt | grep ".csv" > output/$DOM/csv.txt
printf "✅ Csv data :$(wc -l output/$DOM/csv.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

printf "Grep txt Started\n"
cat output/$DOM/live-urls.txt | grep ".txt" > output/$DOM/txt.txt
printf "✅ Txt data :$(wc -l output/$DOM/txt.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

printf "Grep xls Started\n"
cat output/$DOM/live-urls.txt | grep ".xls" > output/$DOM/xls.txt
printf "✅ Xls data :$(wc -l output/$DOM/xls.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

printf "Grep doc Started\n"
cat output/$DOM/live-urls.txt | grep ".doc" > output/$DOM/doc.txt
printf "✅ Doc data :$(wc -l output/$DOM/doc.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

printf "Grep pdf Started\n"
cat output/$DOM/live-urls.txt | grep ".pdf" > output/$DOM/pdf.txt
printf "✅ Pdf data :$(wc -l output/$DOM/pdf.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

printf "Grep php Started\n"
cat output/$DOM/live-urls.txt | grep ".php" > output/$DOM/php.txt
printf "✅ Php data :$(wc -l output/$DOM/php.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

printf "Grep asp Started\n"
cat output/$DOM/live-urls.txt | grep ".asp" > output/$DOM/asp.txt
printf "✅ Asp data :$(wc -l output/$DOM/asp.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

printf "Grep bak Started\n"
cat output/$DOM/live-urls.txt | grep ".bak" > output/$DOM/bak.txt
printf "✅ Bak data :$(wc -l output/$DOM/bak.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

printf "Grep env Started\n"
cat output/$DOM/live-urls.txt | grep ".env" > output/$DOM/env.txt
printf "✅ Env data :$(wc -l output/$DOM/env.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

printf "Grep api Started\n"
cat output/$DOM/live-urls.txt | grep "api" > output/$DOM/api.txt
printf "✅ Api data :$(wc -l output/$DOM/api.txt | awk '{print $1}')\n"
}
