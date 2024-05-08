#!/bin/bash

echo "Day1"
ARRAY=()

check_string(){
case $1 in
	one)
	return 1
	;;
	two)
	return 2
	;;
	three)
	return 3
	;;
	four)
	return 4
	;;
	five)
	return 5
	;;
	six)
	return 6
	;;
	seven)
	return 7
	;;
	eight)
	return 8
	;;
	nine)
	return 9
	;;
	*)
	return 0
esac
}

input="./input.txt"
while read -r line
do

i=0
j=$((${#line}-1))
while [ $i -le $j ]
do 
cur_i=${line:$i:1}
if [[ $cur_i =~ ^[0-9]$ ]];then
	num1=$cur_i
	break
else
	str3=${line:$i:3}
	str4=${line:$i:4}
	str5=${line:$i:5}
	check_string $str3
	out3=$?
	check_string $str4
	out4=$?
	check_string $str5
	out5=$?
	if [[ $out3 != 0 ]];then
		num1=$out3
		break 	
	elif [[ $out4 != 0 ]];then
		num1=$out4
		break 	
	elif [[ $out5 != 0 ]];then
		num1=$out5
		break 	
	else
		i=$(( $i + 1 ))
	fi
fi
done

i=0
j=$((${#line}-1))
while [ $i -le $j ]
do 
cur_j=${line:$j:1}
if [[ $cur_j =~ ^[0-9]$ ]];then
	num2=$cur_j
	break
else
	str3=${line:$((j-2)):3}
	str4=${line:$((j-3)):4}
	str5=${line:$((j-4)):5}
	check_string $str3
	out3=$?
	check_string $str4
	out4=$?
	check_string $str5
	out5=$?
	if [[ $out5 != 0 ]];then
		num2=$out5
		break 	
	elif [[ $out4 != 0 ]];then
		num2=$out4
		break 	
	elif [[ $out3 != 0 ]];then
		num2=$out3
		break 	
	else
		j=$(( $j - 1 ))
	fi
fi
done


num=$num1$num2
ARRAY+=($num)

done < $input

sum=0
for a in ${ARRAY[*]};do
	echo $a
	(( sum += a ))
done
echo $sum

