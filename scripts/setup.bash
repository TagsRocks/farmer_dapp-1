# Setup script for Farner Dapp nodes
# Detect platform
datadir='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
	datadir='.ethereum'
elif [[ "$unamestr" == 'Darwin' ]]; then
	datadir='Library/Ethereum'
else
	printf "Platform not supported, currently working on MacOS and Linux only.\nExiting..." && exit
fi

# Init new chain
while true; do
	read -p "Do you wish to create a new chain? (This will remove previous chaindata): " yn
	case $yn in
		[Yy]* )
			rm -rf ~/"$datadir/chaindata"
			echo "Deleted previous chaindata..."
			geth init ./data/genesis.json
			echo "Initialised new chain..."
			break;;
		[Nn]* ) break;;
		* ) echo "Please answer yes or no.";;
	esac
done

# Set up static nodes
echo "Setting up static nodes..."
cp ./data/static-nodes.json ~/"$datadir/geth"

# Create a new account
while true; do
	read -p "Do you wish to create a new account?: " yn
	case $yn in
		[Yy]* )
			geth account new
			break;;
		[Nn]* ) break;;
		* ) echo "Please answer yes or no.";;
	esac
done

# Celebrate
printf "\e[32mSuccess!\e[0m\nWE DIG, DIG, DIG, DIG DIG, DIG, DIG IN OUR \e[32mMINE\e[0m!\nTo do so please run :\n\t./launch.sh\n"
