
mkdir -p -m 755 ~/MATLAB/CADIC_project/competition
chmod 711 ~

if [ -d "~/MATLAB/CADIC_project/myGA" ]; then
    # Will enter here if $DIRECTORY exists, even if it contains spaces
    cd ~/MATLAB/CADIC_project/competition
    cp -ru ../myGA/ ./
    chmod -R 755 myGA/
elif [ -d "./myGA" ]; then
	cp -ru myGA/ ~/MATLAB/CADIC_project/competition/
	cd ~/MATLAB/CADIC_project/competition
    chmod -R 755 myGA/
else
	echo "ERROR: Directory \"myGA\" not found in \"~/MATLAB/CADIC_project\" or in current directory \"$(pwd)\""
fi


