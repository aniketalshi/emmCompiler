#!
make
rm -rf myoutputs
mkdir myoutputs
for i in `seq 1 23`;
do
    echo;echo "---->Running in$i"
    ./demo mytests/in$i >myoutputs/out$i;
    echo;echo "---->Diff"
    diff -w mytests/out$i myoutputs/out$i
    echo;
done  

