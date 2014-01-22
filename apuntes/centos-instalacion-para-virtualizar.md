Instalación de CentOS para virtualizar
======================================

Fecha: 2014-01-22
Categorías: CentOS, Virtualización

[CentOS](https://www.centos.org/) es una distribución GNU/Linux mantenida por la comunidad a partir del código libre de [Red Hat](https://www.redhat.com/). De una forma práctica, **CentOS** es lo mismo que **Red Hat** pero sin su marca comercial ni soporte técnico de paga. La estabilidad y confiabilidad de CentOS lo hacen la mejor opción para sistema operativo base de un servidor cuyo fin sea virtualizar. Recientemente se ha anunciado el apoyo directo de Red Hat a la comunidad de CentOS; de lo cual esperamos muchas ganancias para todos.

<!-- break -->

#### Arranque con el CD Minimal

Hay varios tipos de discos ISO de CentOS para cada versión. Desde DVD completos a CD para instarar por red. Su servidor recomienda usar el **CD Minimal x86_64** ya que contiene lo básico para llegar a una terminal. Considere que es poco útil y riesgoso tener una interfaz gráfica en un servidor. 

Durante la instalación elija estas opciones:

* GRUB: Install or Update
* Idioma: Spanish
* Teclado: Latinoamericano
* Special Storage Devices
* Use All Space

Ya que haga su primer arranque, a partir de lo instalado en el disco duro, continúe con los siguientes pasos.

#### Levante la red

Por defecto no levanta ningún dispositivo de red. Como partimos del **CD Minimal** necesitaremos salida a internet para bajar el software. Para configurar el dispositivo de red **eth0** edite:

    # cd /etc/sysconfig/network-scripts
    # vi ifcfg-eth0

Si quiere usar una **dirección IP fija**, por ejemplo 192.168.0.250 con ruteador 192.168.0.254:

    DEVICE=eth0
    HWADDR=xx:xx:xx:xx:xx:xx
    TYPE=Ethernet
    ONBOOT=yes
    NM_CONTROLLED=no
    IPADDR=192.168.0.250
    NETMASK=255.255.255.0
    GATEWAY=192.168.0.254

Luego debe configurar cuáles serán sus servidores DNS:

    vi /etc/resolv.conf

Escriba el dominio si lo usa, luego cada servidor DNS como una línea _nameserver_. En el siguiente ejemplo he puesto las direcciones IP de los DNS de Google:

    domain oficina.lan
    search oficina.lan
    nameserver 8.8.8.8
    nameserver 8.8.4.4

En cambio, para solicitar una **dirección IP dinámica** al servidor DHCP:

    DEVICE=eth0
    HWADDR=xx:xx:xx:xx:xx:xx
    TYPE=Ethernet
    ONBOOT=yes
    NM_CONTROLLED=no
    BOOTPROTO=dhcp

Después de cambiar estos archivos de configuración, reinicie el servicio de red para hacerlos efectivos.

    # service network restart

Revise la dirección IP obtenida con:

    # ifconfig eth0

Revise la tabla de ruteo también:

    # route -n

#### Configure proxy de ser necesario

En caso de tener internet a través de un _proxy_ debe de editar el archivo de configuración de **Yum**:

    # vi /etc/yum.conf

Agregue una línea como la siguiente para definir el servidor _proxy_. Cambie _proxy.oficina.lan_ por el nombre o dirección IP del _proxy_.

    proxy=http://proxy.oficina.lan:3128

#### Actualize e instale

Ejecute estos dos comandos para actualizar las listas de los repositorios de CentOS:

    # yum check-update
    # yum update

Por ser programas indispensables, instale **nano**, **sudo** y **man**:

    # yum install nano sudo man

Yum ofrece la instalación por **grupos**, éstos son conjuntos de paquetes de software. Para listar los **grupos** ejecute este comando:

    # yum grouplist

Instale los **grupos** de paquetes que tienen que ver con virtualización en servidor:

    # yum groupinstall "Virtualización"
    # yum groupinstall "Plataforma de virtualización"
    # yum install tunctl

Esta descarga es grande y puede demorar algo de tiempo, dependiendo de su velocidad de internet.

#### Configuración del bridge

    # cd /etc/sysconfig/network-scripts
    # nano ifcfg-br0

    DEVICE=br0
    TYPE=Bridge
    ONBOOT=yes
    DELAY=0
    NM_CONTROLLED=no
    IPADDR=192.168.6.253
    NETMASK=255.255.255.0
    GATEWAY=192.168.6.247

    # nano ifcfg-eth0

    DEVICE="eth0"
    HWADDR="xx:xx:xx:xx:xx:xx"
    NM_CONTROLLED="no"
    ONBOOT="yes"
    BRIDGE="br0"

    # service network restart

    # ifconfig br0
    # ifconfig eth0
    # brctl show

#### Agregue un usuario común

    useradd -g users -G tty,lp,wheel,uucp,games,video,audio,cdrom,kvm,qemu -m saturno

#### Reinicie el servidor

    # shutdown -r 1 &
    # exit

