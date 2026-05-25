$pdf_mode = 5;
$out_dir = '.latex_tmp';
$success_cmd = 'cp %D . 2>/dev/null || true';
$bibtex_use = 2;
$bibtex = 'biber %O %B';
$pdf_previewer = '';
$pdf_update_method = 0;

$xelatex = 'xelatex %O -interaction=nonstopmode -file-line-error -synctex=1 %S';

$clean_ext = 'bbl run.xml synctex.gz nav snm vrb';

