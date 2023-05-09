#! /usr/bin/fish

set target '/Users/davidferguson/Desktop/_Open Job Tickets/'
set temp (random)
pdftotext $argv $temp 

set job_number (rg '^\d{5}$' $temp)[2]
set job_name (rg 'Title: ' $temp | choose 1:)
set job_title (echo $job_number $job_name)
set job_folder (echo $target$job_title'/')

mkdir -p \
    $job_folder'_Final Print Documents' \
    $job_folder'_Final Print PDFs' \
    $job_folder'Dies'\
    $job_folder'Emails' \
    $job_folder'GPL Links' \
    $job_folder'Intermediate Files' \
    $job_folder'Pickups' \
    $job_folder'Proofs' \
    $job_folder'Purchase Orders' \
    $job_folder'Supplied/Supplied on '(date -u +'%m-%d-%Y') \
    $job_folder$job_title' fonts/customer_supplied_fonts' \
    $job_folder$job_title' fonts/gp_suppled_fonts'

mv $argv $job_folder'/Purchase Orders'
rm -f $temp
open $job_folder
