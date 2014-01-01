# encoding: utf-8
def publicacion(dir)

    p             = Publicacion.new
    p.directorio  = dir
    p.archivo     = 'cirugia-nasal'
    p.nombre      = 'Cirugía nasal'
    p.nombre_menu = 'Cirugía nasal'
    p.fecha       = "2007-09-29 14:00"
    p.categorias  = ['Vida cotidiana']
    p.contenido   = <<FIN_CONTENIDO
!<cirugia-nasal/despues-de-la-cirugia.jpg!

Los días pasaron tan rápido como el agua y la fecha de hubiera deseado que no llegara, llegó. Ni modo... a aguantarse como los machos (pero tuve tanto miedo como ni se imaginan) y a pensar en que vale la pena todo esto por respirar mejor. Eso ocurrió ayer viernes, un _via crucis_ inolvidable.

<!-- break -->

Es innumerable la cantidad de cosas que pasan por la mente en situaciones como éstas. Los miedos a las agujas, bisturí y hospitales se vuelven pesadillas que tratamos de minimizar rescatando la fe en el todo poderoso y con la confianza que tengamos en los médicos que nos hayan recomendado.

Afortunadamente todo salió bien y estoy recuperándome en casa. Permaneceré hasta el lunes con la nariz rellena de esponjas, respirando por la boca. Los médicos y enfermeras ejercieron su labor al mejor nivel.

Si se preguntan, qué me hicieron, me removieron "pólipos":http://www.cechin.com.ar/poliposis-nasal.asp que obstruían mi nariz, padecía de "sinusitis crónica":http://www.cechin.com.ar/sinusitis-cronica.asp. Un consejo... "no abusen de los descongestionantes nasales":http://www.canalsalud.info/datos-deshubicados/organos-de-los-sentidos/adiccion-a-descongestionantes-nasales.html, hacen más daño que remedio, mejor visiten a un "otorrinolaringólogo":http://es.wikipedia.org/wiki/Otorrinolaringolog%C3%ADa.
FIN_CONTENIDO

    # Entregar la publicacion
    p

end
