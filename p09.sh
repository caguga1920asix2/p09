
if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 9 # He posat aquest número per assegurar-me que no coincideix amb cap altre valor de retorn
fi

clear

echo "doni un nom d'un fitxer del directori /etc:"


function backup {
	
	if [[ ! -d ~/backups ]]
	then
		mkdir ~/backups
	fi
	data=orig
	cp /etc/$fit /etc/$fit.$data
	echo "El backup de /etc/$fit s'ha realitzat amb èxit" 
	tar -cvf $fit.data.tar /etc/
	return 0 # No hi ha error. Retorna al programa que la funció s'ha executat amb èxit.
	
	
}
####MAIN#####


resposta=0
fit=$(zenity --entry --text="Si us plau, escriu el nom del fitxer")
backup
resposta=$(zenity --entry --text="Vol continuar?")

if (( resposta != 0 ))
then
		return 0
else 
./p09.sh
fi
