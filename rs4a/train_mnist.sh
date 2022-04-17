#!/bin/bash

sigma=( "0.15" "0.25" "0.5" "0.75" "1.00" "1.25" )
label=( "015" "025" "050" "075" "100" "125" )

for i in "${!sigma[@]}"; do
	echo ${sigma[i]}
	# python3 -m src.train --model=ResNet --noise=Gaussian --sigma=${sigma[i]} --experiment-name=mnist_gaussian_${label[i]} --stability --dataset=mnist
	python3 -m src.train --model=ResNet --noise=Gaussian --sigma=${sigma[i]} --experiment-name=mnist_gaussian_${label[i]} --dataset=mnist --num-epochs=60
	python3 -m src.train --model=ResNet --noise=Laplace --sigma=${sigma[i]} --experiment-name=mnist_laplace_${label[i]} --dataset=mnist --num-epochs=60 
	python3 -m src.train --model=ResNet --noise=Uniform --sigma=${sigma[i]} --experiment-name=mnist_uniform_${label[i]} --dataset=mnist --num-epochs=60 
done
