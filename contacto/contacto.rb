# encoding: utf-8
def publicacion(dir)

    p                           = Publicacion.new
    p.directorio                = dir
    p.archivo                   = 'contacto'
    p.nombre                    = 'Acerca del autor de este sitio web'
    p.nombre_menu               = 'Acerca'
    p.fecha                     = "2006-08-01 00:00"
    p.aparece_en_pagina_inicial = false
    p.contenido                 = <<FIN_CONTENIDO
El presente sitio es mantenido por *Guillermo Valdés Lozano*. Actualmente trabaja en el desarrollo de aplicaciones web usando Software Libre.

También hace notables esfuerzos en la divulgación del [Software Libre](http://es.wikipedia.org/wiki/Software_libre). Queda a su servicio para asesorías, pláticas o conferencias sobre el tema, ya sea para instituciones educativas, gubernamentales o privadas.
FIN_CONTENIDO

    # Entregar la publicacion
    p

end
