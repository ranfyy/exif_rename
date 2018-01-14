DIRIN="./*.[jJ][pP][gG]"
#DIRIN="./DSC05636.JPG" # test 1 jpg
DIROUT="out/"
if [ -d $DIROUT ] ; then
  echo $DIROUT" exists. fine."
else
  mkdir -p $DIROUT
  echo $DIROUT" created. Find your new files there."
fi 
for FN in $(ls -1 $DIRIN) ; do
  FNOUT=$(exiftool -d "%Y-%m-%d_%H-%M-%S" -CreateDate "$FN" |  head -n 1 | cut -d : -f 2 | cut -d " " -f 2)
  if [ -z $FNOUT ] ; then
    echo $FN" copied unchanged"
    cp -i "$FN" $DIROUT
  else
    echo $FNOUT
    cp -i "$FN" $DIROUT$FNOUT.jpg
  fi
done
