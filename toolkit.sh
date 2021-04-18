#!/bin/bash

#Variables de colores
red="$(printf '\033[31m')"
azul="$(printf '\033[34m')"
naranja="$(printf '\033[33m')"
verde="$(printf '\033[32m')"
white="$(printf '\033[37m')"
reset_color() {
	tput sgr0   # reset attributes
	tput op     # reset color
    return
}

#Banner
banner() {
      cat <<- OEF
            ${red}         _              _     _    _ _     _     _                  
            ${red}        | |_ ___   ___ | |___| | _(_) |_  | |   (_)_ __  _   ___  __
            ${red}        | __/ _ \ / _ \| / __| |/ / | __| | |   | | '_ \| | | \ \/ /
            ${naranja}        | || (_) | (_) | \__ \   <| | |_  | |___| | | | | |_| |>  < 
            ${naranja}         \__\___/ \___/|_|___/_|\_\_|\__| |_____|_|_| |_|\__,_/_/\_\

            ${verde}Version:${azul}1.0                                        ${verde}Created by: ${azul}Yenot-Hack & Lesli
OEF
}

#Menu
main_menu() {
      { clear; banner; echo;}
      echo -e  "${white}Accediste como: ${azul}$USER\n"
      cat <<- EOF
      ${azul}[${red}01${azul}]${white} INFORMACION_IP             ${azul}[${red}02${azul}]${white} SCAN

      ${azul}[${red}03${azul}]${white} MAPA                       ${azul}[${red}04${azul}]${white} MI_IP_PUBLICA      

      ${azul}[${red}05${azul}]${white} MONITORES_SISTEMA          ${azul}[${red}06${azul}]${white} MONITORES_RED

      ${azul}[${red}07${azul}]${white} ANONIMATO                  ${azul}[${red}08${azul}]${white} INFORMACION_HARDWARE

      ${azul}[${red}09${azul}]${white} COMANDOS                   ${azul}[${red}10${azul}]${white} INFORMACION_SOFTWARE

      ${azul}[${red}00${azul}]${white} SALIDA
EOF
      echo -e "\n"
      read -p "Selecciona una opcion: "; echo -ne '\e[3 q'

      if [[ "$REPLY" == 1 || "$REPLY" == 01 ]]; then
            ipinfo
      elif [[ "$REPLY" == 2 || "$REPLY" == 02  ]]; then
            nmap_tool
      elif [[ "$REPLY" == 0 || "$REPLY" == 00 ]]; then 
            msg_exit
      elif [[ "$REPLY" == 3 || "$REPLY" == 03  ]]; then
            mapa
      elif [[ "$REPLY" == 4 || "$REPLY" == 04  ]]; then
            ip_public
      elif [[ "$REPLY" == 5 || "$REPLY" == 05  ]]; then
            monitor_sistem
      elif [[ "$REPLY" == 6 || "$REPLY" == 06  ]]; then
            monitor_red
      elif [[ "$REPLY" == 7 || "$REPLY" == 07  ]]; then
            anonimato
      elif [[ "$REPLY" == 8 || "$REPLY" == 08  ]]; then
            inf_hard
      elif [[ "$REPLY" == 9 || "$REPLY" == 09  ]]; then
            comandos_linux
      elif [[ "$REPLY" == 10 || "$REPLY" == 10  ]]; then
            info_soft
      else
            echo -ne "\n[!] Opcion Invalida"
            { sleep 1; main_menu; }
      fi
}

clear

#Dependencias
banner
echo -ne "${naranja}\nInicializando..."; reset_color
echo -ne "\n"
dependencias() {
      tput civis

      #CURL      
      pack_curl="curl"
      var_curl="$(dpkg -s $pack_curl | grep "Status: install ok installed")"
      new_curl="${var_curl}"

      func_curl() {
            if [[ $new_curl == "Status: install ok installed"  ]]; then
                  echo ""
            else 
                  echo "${red}$pack_curl No instalada" 
                  echo -e "\nInstalando..."
                  sleep 1
                  echo -e "\n"
                  apt install $pack_curl
            fi
      }
      func_curl


      #XTERM
      pack_xterm="xterm"
      var_xterm="$(dpkg -s $pack_xterm | grep "Status: install ok installed")"
      new_xterm="${var_xterm}"

      func_xterm() {
            if [[ $new_xterm == "Status: install ok installed"  ]]; then
                  echo ""
            else
                  echo "${red}$pack_xterm No instalada" 
                  echo -e "\nInstalando..."
                  sleep 1
                  echo -e "\n"
                  apt install $pack_xterm
            fi
      }
      func_xterm


      #iotop
      pack_iotop="iotop"
      var_iotop="$(dpkg -s $pack_iotop | grep "Status: install ok installed")"
      new_iotop="${var_iotop}"

      func_iotop() {
            if [[ $new_iotop == "Status: install ok installed"  ]]; then
                  echo ""
            else 
                  echo "${red}$pack_iotop No instalada" 
                  echo -e "\nInstalando..."
                  sleep 1
                  echo -e "\n"
                  apt install $pack_iotop
            fi
      }
      func_iotop


      #glances
      pack_glances="glances"
      var_glances="$(dpkg -s $pack_glances | grep "Status: install ok installed")"
      new_glances="${var_glances}"

      func_glances() {
            if [[ $new_glances == "Status: install ok installed"  ]]; then
                  echo ""
            else 
                  echo "${red}$pack_glances No instalada" 
                  echo -e "\nInstalando..."
                  sleep 1
                  echo -e "\n"
                  apt install $pack_glances
            fi
      }
      func_glances


      #htop
      pack_htop="htop"
      var_htop="$(dpkg -s $pack_htop | grep "Status: install ok installed")"
      new_htop="${var_htop}"

      func_htop() {
            if [[ $new_htop == "Status: install ok installed"  ]]; then
                  echo ""
            else 
                  echo "${red}$pack_htop No instalada" 
                  echo -e "\nInstalando..."
                  sleep 1
                  echo -e "\n"
                  apt install $pack_htop
            fi
      }
      func_htop


      #speedometer
      pack_speedometer="speedometer"
      var_speedometer="$(dpkg -s $pack_speedometer | grep "Status: install ok installed")"
      new_speedometer="${var_speedometer}"

      func_speedometer() {
            if [[ $new_speedometer == "Status: install ok installed"  ]]; then
                  echo ""
            else 
                  echo "${red}$pack_speedometer No instalada" 
                  echo -e "\nInstalando..."
                  sleep 1
                  echo -e "\n"
                  apt install $pack_speedometer
            fi
      }
      func_speedometer


      #nload
      pack_nload="nload"
      var_nload="$(dpkg -s $pack_nload | grep "Status: install ok installed")"
      new_nload="${var_nload}"

      func_nload() {
            if [[ $new_nload == "Status: install ok installed"  ]]; then
                  echo ""
            else
                  echo "${red}$pack_nload No instalada" 
                  echo -e "\nInstalando..."
                  sleep 1
                  echo -e "\n"
                  apt install $pack_nload
            fi
      }
      func_nload


      #nmon
      pack_nmon="nmon"
      var_nmon="$(dpkg -s $pack_nmon | grep "Status: install ok installed")"
      new_nmon="${var_nmon}"

      func_nmon() {
            if [[ $new_nmon == "Status: install ok installed"  ]]; then
                  echo ""
            else 
                  echo "${red}$pack_nmon No instalada" 
                  echo -e "\nInstalando..."
                  sleep 1
                  echo -e "\n"
                  apt install $pack_nmon
            fi
      }
      func_nmon


      #bmon
      pack_bmon="bmon"
      var_bmon="$(dpkg -s $pack_bmon | grep "Status: install ok installed")"
      new_bmon="${var_bmon}"

      func_bmon() {
            if [[ $new_bmon == "Status: install ok installed"  ]]; then
                  echo ""
            else
                  echo "${red}$pack_bmon No instalada" 
                  echo -e "\nInstalando..."
                  sleep 1
                  echo -e "\n"
                  apt install $pack_bmon
            fi
      }
      func_bmon


      #ctop
      pack_ctop="ctop"
      var_ctop="$(dpkg -s $pack_ctop | grep "Status: install ok installed")"
      new_ctop="${var_ctop}"

      func_ctop() {
            if [[ $new_ctop == "Status: install ok installed"  ]]; then
                  echo ""
            else
                  echo "${red}$pack_ctop No instalada" 
                  echo -e "\nInstalando..."
                  sleep 1
                  echo -e "\n"
                  apt install $pack_ctop
            fi
      }
      func_ctop


      #nmap
      pack_nmap="nmap"
      var_nmap="$(dpkg -s $pack_nmap | grep "Status: install ok installed")"
      new_nmap="${var_nmap}"

      func_nmap() {
            if [[ $new_nmap == "Status: install ok installed"  ]]; then
                  echo ""
            else 
                  echo "${red}$pack_nmap No instalada" 
                  echo -e "\nInstalando..."
                  sleep 1
                  echo -e "\n"
                  apt install $pack_nmap
            fi
      }
      func_nmap


      #tor
      pack_tor="tor"
      var_tor="$(dpkg -s $pack_tor | grep "Status: install ok installed")"
      new_tor="${var_tor}"

      func_tor() {
            if [[ $new_tor == "Status: install ok installed"  ]]; then
                  echo ""
            else
                  echo "${red}$pack_tor No instalada" 
                  echo -e "\nInstalando..."
                  sleep 1
                  echo -e "\n"
                  apt install $pack_tor
            fi
      }
      func_tor


      #

      tput cnorm
}

##VARIABLES

miraculosxd() {
      cat << EOF
                                                                        ${azul}[${red}00${azul}]${white} Salir al menu
EOF
      read -p "${verde}Ingresa 0 para regresar al menu ${white}"
      if [[ "$REPLY" == 0 || "$REPLY" == 00 ]]; then
            { clear; banner; main_menu; }
      else 
            sleep 0
            echo -ne "\n${red}[!]Opcion Invalida"
            { banner; miraculosxd; }
      fi
}

#Ingresar direccion ip de la victima
ipinfo() {
      { clear; banner; echo; }
      echo -e "\nAl ingresar una dirección IP pública, se mostrara información como Localización, Coordenadas
Región, entre otras cosas. Debe ingresar una ip publica, ejemplo: 200.68.136.183"
      echo -ne "${verde}\nIngresa la dirección IP: "
      echo -en "\e[32m=>\e[0m "
      read ip
      echo ""
      reset_color
      #resultado
      echo "INFORMACION_IP"
      sleep 1
      #Utilizar el servicio ipinfo.io
      curl -s https://ipinfo.io/"$ip"
      sleep 1
      echo -e "\n"
      cat << EOF
                                                                        ${azul}[${red}00${azul}]${white} Salir al menu
EOF
      read -p "${red}Ingresa 0 para regresar al menu ${white}"
      if [[ "$REPLY" == 0 || "$REPLY" == 00 ]]; then
      { clear; banner; main_menu; }
      else 
      echo -ne "\n[!]Opcion Invalida"
            { sleep 1; miraculosxd; }
      fi
}

#nmap
nmap_tool() {

      command="$(nmcli | grep route4 | grep  24$)"

      ip="${command#????????}"

      banner_nmap() {
            printf "\e[33m"
            figlet -c -f smslant "Scan Nmap"
            reset_color
      }
      menu_nmap() {
            { clear; banner_nmap; echo; }
            cat <<- EOF
            ${red}[${azul}01${red}]${white} Escaneo                     ${red}[${azul}02${red}]${white} Puertos abiertos

            ${red}[${azul}03${red}]${white} Sistemas y datos del host   ${red}[${azul}00${red}]${white} Regresar al menu
EOF
            echo -e "\n"
            read -p "Selecciona una opcion: ${white}"

            if [[ "$REPLY" == 1 || "$REPLY" == 01  ]]; then
                  nmap_scan
            elif [[ "$REPLY" == 2 || "$REPLY" == 02  ]]; then
                  nmap_port_open
            elif [[ "$REPLY" == 3 || "$REPLY" == 03  ]]; then 
                  nmap_sys_dat
            elif [[ "$REPLY" == 0 || "$REPLY" == 00  ]]; then
                  { clear; banner; main_menu; }
            else
                  echo -ne "\n[!]Opcion Invalida"
                  sleep 2
            { clear; banner_nmap; menu_nmap;  }
            fi
      }

      #nmap
      nmap_scan() {
            { clear; banner_nmap; echo;  }
            echo "escaneo nmap"
            echo -ne "\n"
            reset_color
            nmap -T5 "$ip"
            cat << EOF
                                                                        ${azul}[${red}00${azul}]${white} Salir al maenu
EOF

            read -p "${verde}Ingresa 0 para regresar al menu: ${white}"
            if [[ "$REPLY" == 0 || "$REPLY" == 00 ]]; then
                  { clear; banner_nmap; menu_nmap; }
            else
                  { clear; miraculosxd; }
            fi
      }

      #nmap
      nmap_port_open() {
            { clear; banner_nmap; echo;  }
            echo "puertos abiertos"
            nmap -T5 -p- "$ip"; reset_color
            echo -ne "\n"
            sleep 1 
            lsof -i 
            sleep 1
            cat << EOF
                                                                        ${azul}[${red}00${azul}]${white} Salir al maenu
EOF
            read -p "${verde}Ingresa 0 para regresar al menu ${white}"
            if [[ "$REPLY" == 0 || "$REPLY" == 00 ]]; then
                  { clear; banner_nmap; menu_nmap; }
            else
                  { miraculosxd;}
            fi
      }
      #nmap 
      nmap_sys_dat() {
            { clear; banner_nmap; echo; }
            echo "info. OS y datos"
            echo -ne "\n"
            nmap -T5 -O -sV "$ip"; reset_color
            echo -ne "\n"
            sleep 1 
            cat << EOF
                                                                        ${azul}[${red}00${azul}]${white} Salir al maenu
EOF
            read -p "${verde}Ingresa 0 para regresar al menu ${white}"
            if [[ "$REPLY" == 0 || "$REPLY" == 00 ]]; then
                  { clear; banner_nmap; menu_nmap; }
            else
                  echo -e "\n[!]Opcion Invalida"
                  { miraculosxd; }
            fi
      }
menu_nmap
}

inf_hard() {
      banner_hard() {
            printf "\e[33m"
            figlet -c -f smslant "HARDWARE"
            reset_color
      }

      { clear; banner_hard; echo;  }
      
      echo -e "\n${azul}Sistema:\n"; reset_color
      uname -s
      sleep 0.5
      echo -e "\n${azul}Arquitectura:\n"; reset_color
      uname -i
      sleep 0.5
      echo -e "\n${azul}Bateria:\n"; reset_color
      acpi -i
      sleep 0.5
      echo -e "\n${azul}CPU(s):\n"; reset_color
      cat /proc/cpuinfo
      sleep 0.5
      echo -e "\n${azul}RAM y SWAP:\n"; reset_color
      free -h
      sleep 0.5
      echo -e "\n${azul}Particiones y Discos:\n"; reset_color
      fdisk -l
      sleep 0.5

      sleep 0
      cat << EOF
                                                                        ${azul}[${red}00${azul}]${white} Salir al maenu
EOF
      read -p "${verde}Ingresa 0 para regresar al menu ${white}"
      if [[ "$REPLY" == 0 || "$REPLY" == 00 ]]; then
            { clear; banner; main_menu; }
      else
            echo -e "\n[!]Opcion Invalida"
            { miraculosxd; }
      fi
}

#sorftware
info_soft() {
      clear
      printf "\e[33m"
      figlet -c -f smslant "SOFTWARE"
      reset_color
      echo -e "\n${azul}Usuario\n";reset_color
      whoami
      echo -e "\n${azul}Fecha\n";reset_color
      cal
      echo -e "\n${azul}IP Privada\n";reset_color
      hostname -I
      echo -e "\n${azul}IP Publica\n"; reset_color
      curl ipecho.net/plain -w "\n"
      echo -e "\n${azul}Sistema Operativo\n";reset_color
      uname -o
      echo -e "\n${azul}Nombre del Host\n";reset_color
      uname -n
      echo -e "\n${azul}Nombre del Nucleo\n";reset_color
      uname -s
      echo -e "\n${azul}Clima\n";reset_color
      curl http://v2.wttr.in/Mexico

      { miraculosxd; }
}

#mapa
mapa() {
      { clear; banner; echo; }
      tput civis
      snap install mapscii
      clear
      sleep 1
      echo "Pulsa Ctrl+C para cerrar y regresar al menu"
      xterm -e "mapscii"
      tput cnorm
      { clear; banner; main_menu;  }
}
#mi_ip_publica
ip_public() {
      { clear; banner; echo; }
      echo "${azul}Mi ip publica"
      echo -e  "\n"
      reset_color
      curl ipecho.net/plain -w "\n"
      sleep 0
      { miraculosxd; }
}

comandos_linux() {
      clear
      printf "\e[33m"
      figlet -c -f smslant "Comandos"
      reset_color
      cat comandos.txt
      echo -e "\n"
      { miraculosxd; }
}

anonimato() {
      { clear; }
      printf "\e[33m"
      figlet -c -f smslant "Anonimato"
      reset_color

      if [[ ! -d ".anon" ]]; then
	      mkdir ".anon"
      else
            rm -r ".anon"
            mkdir ".anon"
      fi

      cd .anon/
      git clone https://github.com/Und3rf10w/kali-anonsurf.git
      cd kali-anonsurf
      ./installer.sh
      anonsurf start
      clear
      echo -e "\n${azul}Enrutamiento Listo\n"
      
      red_tor() {
            service tor start
            sleep 1
            echo -e "\nServidor Tor Listo\n"
      }
      red_tor
      cat << EOF
                                                                        ${azul}[${red}00${azul}]${white} Salir al menu
EOF
      read -p "${red}Ingresa 0 para regresar al menu ${white}"
      if [[ "$REPLY" == 0 || "$REPLY" == 00 ]]; then
            { clear; banner; main_menu; }
      else 
            sllep 0
            echo -ne "\n[!]Opcion Invalida"
            { miraculosxd; }
      fi
}

monitor_sistem() {
      xterm -e "htop" | xterm -e "glances" | xterm -e "iotop" | xterm -e "top" | xterm -e "nmon" | ctop
      { clear; banner; main_menu;  }
}

monitor_red() {
      xterm -e "speedometer -r wlo1 -t wlo1" | xterm -e "nload" | xterm -e "bmon" | iftop -i wlo1
      { clear; banner; main_menu;  }
}

msg_exit() {
      echo "Adios"
      sleep 0
      clear
      exit 0
}

sleep 1
#llamar dependencias
dependencias
sleep 0
# Limpiar terminal
clear
#Llamar el menu
main_menu
