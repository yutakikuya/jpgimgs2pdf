#!/bin/sh
pdf_ext=".pdf"
folder_name=$1
output_pdfname=$folder_name$pdf_ext
cur_dir=(`pwd`)
cd $folder_name
f_list=(`find ./ -name "*.jpg"`)
i=0
for textfile in ${f_list[@]}; do
if [ 0 -le $i -a $i -le 9 ]; then
    tmp="00"
    output_file=$tmp$i$pdf_ext
elif [ 10 -le $i -a $i -le 99 ]; then
    tmp="0"
    output_file=$tmp$i$pdf_ext
else
    output_file=$i$pdf_ext
fi
convert $textfile $output_file
i=`expr $i + 1`
done
sura='/'
pdftk *.pdf cat output $output_pdfname
mv $output_pdfname $cur_dir
rm *.pdf
echo $folder_name "done."
