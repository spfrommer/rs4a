mkdir pretrain
for d in None/*; do
	cp "None/${d:5}/model_ckpt.torch" "pretrain/${d:5}.pt" 
	#echo "None/${d:5}/model_ckpt.torch"
	#echo "pretrain/${d:5}.pt"
done
